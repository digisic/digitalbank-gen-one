package io.digisic.bank.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.text.MessageFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectReader;

import io.digisic.bank.model.obp.Account;
import io.digisic.bank.model.obp.Bank;
import io.digisic.bank.model.obp.LinkedAccount;
import io.digisic.bank.model.obp.LinkedUser;
import io.digisic.bank.model.obp.Transaction;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.repository.ObpLinkedAccountRepository;
import io.digisic.bank.repository.ObpLinkedUserRepository;
import io.digisic.bank.util.Constants;


@Service
@Transactional
public class ObpService {
	
	private static final Logger LOG = LoggerFactory.getLogger(ObpService.class);
	
	// OBP Service Attributes
	private static String apiBaseUrl;
	private static String apiLoginUrl;
	private static Boolean obpEnabled;
	private static String authToken;
	private static String consumerKey;
	private static HttpHeaders requestHeaders;
	
	@Autowired
	private Environment environment;
	
	@Autowired
	private ObpLinkedAccountRepository obpLinkedAccountRepository;
	
	@Autowired
	private ObpLinkedUserRepository obpLinkedUserRepository;
	
	
	// OBP Service Default properties
	private static final String DEFAULT_OBP_PROTOCOL 	= "https";
	private static final String DEFAULT_OBP_HOSTNAME 	= "apisandbox.openbankproject.com";
	private static final String DEFAULT_OBP_VERSION 	= "v4.0.0";
	
	
	/*
	 * Get all Linked Accounts
	 */
	public List<LinkedAccount> getLinkedAccounts (Users user){
		return (List<LinkedAccount>) obpLinkedAccountRepository.findByUser(user);
	}
	
	/*
	 * Synchronize Linked Account Data
	 */
	public boolean syncLinkedAccounts (List<LinkedAccount> linkedAccounts){
		
		for (LinkedAccount linkedAccount : linkedAccounts) {
			
			Bank bank = getBank(linkedAccount.getBankId());
			Account  account = getAccount(linkedAccount.getBankId(), linkedAccount.getAccountId());
			
			if (bank != null && account != null) {
				
				linkedAccount.setAccountBalance(account.getBalance().getAmount());
				linkedAccount.setAccountName(account.getLabel());
				linkedAccount.setBankName(bank.getFull_name());
				
				obpLinkedAccountRepository.save(linkedAccount);
				
			}
			else { // could not get the updated data
				
				return false;
			}
		}
		
		
		return true;
	}
	
	/*
	 * Delete Linked Account
	 */
	public boolean deleteLinkedAccount (LinkedAccount linkedAccount){
		
		obpLinkedAccountRepository.delete(linkedAccount);
		
		return true;
	}
	
	/*
	 * Linked Account
	 */
	public LinkedAccount getLinkedAccountbyAccountId (String accountId) {
		return obpLinkedAccountRepository.findByAccountId(accountId);
	}
	
	/*
	 * Linked Account
	 */
	public LinkedAccount getLinkedAccount (Long id) {
		
		Optional<LinkedAccount> opt = obpLinkedAccountRepository.findById(id);
		
		 if (opt.isPresent())
			 return opt.get();
		
		return null;
	}
	
	/*
	 * Link OBP Account
	 */
	public LinkedAccount LinkObpAccount (Users user, Bank bank, Account account) {
		
		LinkedAccount linkedAccount = new LinkedAccount();
		
		linkedAccount.setAccountId(account.getId());
		linkedAccount.setAccountName(account.getLabel());
		linkedAccount.setAccountNumber(account.getNumber());
		linkedAccount.setBankId(bank.getId());
		linkedAccount.setBankName(bank.getFull_name());
		linkedAccount.setAccountBalance(account.getBalance().getAmount());
		linkedAccount.setUser(user);
		
		obpLinkedAccountRepository.save(linkedAccount);
		
		return linkedAccount;
		
	}
	
	/*
	 * Get the bank details
	 */
	public Bank getBank (String bankId){
		
		if (ObpService.apiBaseUrl == null) {
			if (!getConnectionProperties()) {
				return null;
			}
		}

		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(ObpService.apiBaseUrl + MessageFormat.format(Constants.URI_OBP_API_BANK, bankId));
		
        LOG.debug("OBP Service :-> Request = " + uriBuilder.toUriString());
		
        // Create the Request
     	HttpEntity<?> requestEntity = new HttpEntity<>(ObpService.requestHeaders);
     	
		
		RestTemplate restTemplate = new RestTemplate();
		
		try {
			
			ResponseEntity<String> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
					 													  HttpMethod.GET, 
					 													  requestEntity, 
					 													  String.class);
			
			LOG.debug("OBP Service :-> OBP Response = " + responseEntity);
			
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(responseEntity.getBody());
			ObjectReader reader = mapper.readerFor(new TypeReference<Bank>(){});
			
			return reader.readValue(root);
			

		}
		catch (HttpStatusCodeException ex) {
			LOG.debug("OBP API Service: Unable to successfully get OBP Bank");
			LOG.debug(ex.getMessage());
			LOG.debug(ex.getResponseBodyAsString());
			
			return null;
			
		}
		catch (ResourceAccessException ex) {
			LOG.error("OBP API Service: Unable to reach OBP API Service endpoint");
			LOG.error(ex.getMessage());
			
			return null;
			
		}
		catch (IOException ex) {
			LOG.error("OBP API Service: Unable to read OBP API Service response");
			LOG.error(ex.getMessage());
			
			return null;
		}
		
	}
	
	/*
	 * Gets a list of available banks in the open banking platform
	 */
	public List<Bank> getBanks (){
		
		if (ObpService.apiBaseUrl == null) {
			
			if (!getConnectionProperties()) {
				return new ArrayList<Bank>();
			}
		}

		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(ObpService.apiBaseUrl + Constants.URI_OBP_API_BANKS);
		
        LOG.debug("OBP Service :-> Request = " + uriBuilder.toUriString());
		
        // Create the Request
     	HttpEntity<?> requestEntity = new HttpEntity<>(ObpService.requestHeaders);
     	
		
		RestTemplate restTemplate = new RestTemplate();
		
		try {
			
			ResponseEntity<String> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
					 													  HttpMethod.GET, 
					 													  requestEntity, 
					 													  String.class);
			
			LOG.debug("OBP Service :-> OBP Response = " + responseEntity);
			
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(responseEntity.getBody());
			JsonNode banks = root.path("banks");
			
			List<Bank> results = new ArrayList<>();
			
			if (banks.isArray()) {
				ObjectReader reader = mapper.readerFor(new TypeReference<List<Bank>>() {});
				
				results = reader.readValue(banks);
			}
			
			return results;	
		}
		catch (HttpStatusCodeException ex) {
			LOG.debug("OBP API Service: Unable to successfully get OBP Banks");
			LOG.debug(ex.getMessage());
			LOG.debug(ex.getResponseBodyAsString());
			
			return new ArrayList<Bank>();
			
		}
		catch (ResourceAccessException ex) {
			LOG.error("OBP API Service: Unable to reach OBP API Service endpoint");
			LOG.error(ex.getMessage());
			
			return new ArrayList<Bank>();
			
		} 
		catch (IOException ex) {
			LOG.error("OBP API Service: Unable to read OBP API Service response");
			LOG.error(ex.getMessage());
			
			return new ArrayList<Bank>();
		}
		
	}
	
	
	/*
	 * Get the account details
	 */
	public Account getAccount (String bankId, String accountId){
		
		if (ObpService.apiBaseUrl == null) {
			if (!getConnectionProperties()) {
				return null;
			}
		}

		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(ObpService.apiBaseUrl + MessageFormat.format(Constants.URI_OBP_API_BANK_ACCOUNT, bankId, accountId));
		
        LOG.debug("OBP Service :-> Request = " + uriBuilder.toUriString());
		
        // Create the Request
     	HttpEntity<?> requestEntity = new HttpEntity<>(ObpService.requestHeaders);
     	
		
		RestTemplate restTemplate = new RestTemplate();
		
		try {
			
			ResponseEntity<String> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
					 													  HttpMethod.GET, 
					 													  requestEntity, 
					 													  String.class);
			
			LOG.debug("OBP Service :-> OBP Response = " + responseEntity);
			
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(responseEntity.getBody());
			ObjectReader reader = mapper.readerFor(new TypeReference<Account>(){});
			
			return reader.readValue(root);
			

		}
		catch (HttpStatusCodeException ex) {
			LOG.debug("OBP API Service: Unable to successfully get OBP Account");
			LOG.debug(ex.getMessage());
			LOG.debug(ex.getResponseBodyAsString());
			
			return null;
			
		}
		catch (ResourceAccessException ex) {
			LOG.error("OBP API Service: Unable to reach OBP API Service endpoint");
			LOG.error(ex.getMessage());
			
			return null;
			
		}
		catch (IOException ex) {
			LOG.error("OBP API Service: Unable to read OBP API Service response");
			LOG.error(ex.getMessage());
			
			return null;
		}
		
	}
	
	
	public List<Account> getAccounts (String bankId){
		
		if (ObpService.apiBaseUrl == null) {
			if (!getConnectionProperties()) {
				return new ArrayList<Account>();
			}
		}

		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(ObpService.apiBaseUrl + MessageFormat.format(Constants.URI_OBP_API_BANK_ACCTS, bankId));

				
       LOG.debug("OBP Service :-> Accounts Request = " + uriBuilder.toUriString());
		
        // Create the Request
     	HttpEntity<?> requestEntity = new HttpEntity<>(ObpService.requestHeaders);
     	
		
		RestTemplate restTemplate = new RestTemplate();
		
		try {
			
			ResponseEntity<String> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
					 													  HttpMethod.GET, 
					 													  requestEntity, 
					 													  String.class);
			
			LOG.debug("OBP Service :-> OBP Accounts Response = " + responseEntity);
			
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(responseEntity.getBody());
			JsonNode accounts = root.path("accounts");
			
			List<Account> results = new ArrayList<>();
			
			if (accounts.isArray()) {
				ObjectReader reader = mapper.readerFor(new TypeReference<List<Account>>() {});
				
				results = reader.readValue(accounts);
			}
			
			return results;	
		}
		catch (HttpStatusCodeException ex) {
			LOG.debug("OBP API Service: Unable to successfully get OBP Accounts");
			LOG.debug(ex.getMessage());
			LOG.debug(ex.getResponseBodyAsString());
			
			return new ArrayList<Account>();
			
		}
		catch (ResourceAccessException ex) {
			LOG.error("OBP API Service: Unable to reach OBP API Service endpoint");
			LOG.error(ex.getMessage());
			
			return new ArrayList<Account>();
			
		} 
		catch (IOException ex) {
			LOG.error("OBP API Service: Unable to read OBP API Service response");
			LOG.error(ex.getMessage());
			
			return new ArrayList<Account>();
		}
		
	}
	
	
	/*
	 * Gets a list of the transactions for the account
	 */
	public List<Transaction> getAccountTransactions (Bank bank, Account account){
		
		if (ObpService.apiBaseUrl == null) {
			if (!getConnectionProperties()) {
				return new ArrayList<Transaction>();
			}
		}

		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(ObpService.apiBaseUrl + MessageFormat.format(Constants.URI_OBP_API_BANK_ACCOUNT_TRANS, bank.getId(), account.getId()));
		
        LOG.debug("OBP Service :-> Request = " + uriBuilder.toUriString());
		
        // Create the Request
     	HttpEntity<?> requestEntity = new HttpEntity<>(ObpService.requestHeaders);
     	
		
		RestTemplate restTemplate = new RestTemplate();
		
		try {
			
			ResponseEntity<String> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
					 													  HttpMethod.GET, 
					 													  requestEntity, 
					 													  String.class);
			
			LOG.debug("OBP Service :-> OBP Response = " + responseEntity);
			
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(responseEntity.getBody());
			JsonNode transaction = root.path("transactions");
			
			List<Transaction> results = new ArrayList<>();
			
			if (transaction.isArray()) {
				ObjectReader reader = mapper.readerFor(new TypeReference<List<Transaction>>() {});
				
				results = reader.readValue(transaction);
			}
			
			return results;	
		}
		catch (HttpStatusCodeException ex) {
			LOG.debug("OBP API Service: Unable to successfully get OBP Account Transactions");
			LOG.debug(ex.getMessage());
			LOG.debug(ex.getResponseBodyAsString());
			
			return new ArrayList<Transaction>();
			
		}
		catch (ResourceAccessException ex) {
			LOG.error("OBP API Service: Unable to reach OBP API Service endpoint");
			LOG.error(ex.getMessage());
			
			return new ArrayList<Transaction>();
			
		} 
		catch (IOException ex) {
			LOG.error("OBP API Service: Unable to read OBP API Service response");
			LOG.error(ex.getMessage());
			
			return new ArrayList<Transaction>();
		}
		
	}
	
	
	/*
	 * Check to see if OBP Service is enabled in the application.properties
	 */
	public boolean isObpServiceEnabled () {
		
		if (ObpService.obpEnabled == null) {
			
			ObpService.obpEnabled = Boolean.parseBoolean(environment.getProperty(Constants.APP_OBP_ENABLED));
			
			if (!getConnectionProperties()) {
				return false;
			}
		}
		
		return ObpService.obpEnabled;
	}
	
	/*
	 * Check to see if the user had linked accounts
	 */
	public boolean userHasLinkedAccount(Users user) {
		
		List<LinkedAccount> linkedAccount = getLinkedAccounts(user);
		
		LOG.debug("# of Linked Account = " + linkedAccount.size());
		
		if (linkedAccount.size() > 0) {
			
			LOG.debug("User has linked accounts.");
			
			// If we already have an authentication token return
			if (ObpService.authToken != null) {
				
				LOG.debug("We already have an auth token for OBP.");
				
				return true;
				
			} else { // else we need to authenticate to the OBP service platform
				LinkedUser linkedUser = obpLinkedUserRepository.findByUser(user);
				
				byte[] decodedbytes = Base64.getDecoder().decode(linkedUser.getPassword());
				
				LOG.debug("Authenticate OBP User.");
				
				return authenticateObpService(user, linkedUser.getUsername(), decodedbytes.toString());
			}
				
		} else { // no lined accounts
			
			LOG.debug("User does not have linked accounts.");
			
			return false;
		}
	}
	
		
	/*
	 * Get authentication token if needed
	 */
	public boolean authenticateObpService (Users user, String username, String password) {
		
		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(ObpService.apiLoginUrl);
		
		// Create required headers
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(MediaType.APPLICATION_JSON);
        requestHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        requestHeaders.set(HttpHeaders.AUTHORIZATION, MessageFormat.format(Constants.HEADER_OBP_DIRECT_AUTH, username, password, ObpService.consumerKey));
		
       
        // Create the Request
		HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
		
		RestTemplate restTemplate = new RestTemplate();
		
		LOG.debug("OBP Service :-> Request = " + uriBuilder.toUriString());
		LOG.debug("OBP Service :-> Request = " + requestEntity.toString());
		
		try { // Submit Authentication Request
			
			ResponseEntity<AuthToken> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
																			 HttpMethod.POST, 
																			 requestEntity, 
																			 AuthToken.class);
			if (responseEntity.getStatusCode() == HttpStatus.CREATED) {
			      
				 LOG.info("Open Banking Service: Obtained authentication succcessfully");
				 
				 ObpService.authToken = responseEntity.getBody().getToken();
				 requestHeaders.set(HttpHeaders.AUTHORIZATION, MessageFormat.format(Constants.HEADER_OBP_DIRECT_AUTH_TOKEN, ObpService.authToken));
				 
				 // Save the data to the object
				 ObpService.requestHeaders = requestHeaders;
				 
				 // Create Linked User
				 LinkedUser linkedUser = new LinkedUser();
				 linkedUser.setUsername(username);
				 linkedUser.setPassword(Base64.getEncoder().encodeToString(password.getBytes()));
				 linkedUser.setUser(user);
				 
				 obpLinkedUserRepository.save(linkedUser);
				 
				 
				 LOG.debug("OBP Authentication Response: " + responseEntity.toString());
				 
				 return true;
				 
			} // End If
			else {
				
				 LOG.error("Open Banking Service: Authentication Request Failed");
				 LOG.error(responseEntity.getStatusCode().toString());
				 LOG.error(responseEntity.getBody().toString());
				 
				 return false;
				 
		    } // End Else
		} // End Try
		catch (HttpStatusCodeException ex) {
			LOG.error("Open Banking Service: Authentication Request Failed");
			LOG.error(ex.getResponseBodyAsString());
			
			return false;
		} // End Catch
		catch (ResourceAccessException ex) {
			LOG.error("Open Banking Servicet: Unable to reach Open Banking Service endpoint");
			LOG.error(ex.getMessage());
		} // End Catch
		
		return false;
	}
	
	
	
	/*
	 * Get OBP API Service details from application.properties
	 */
	private boolean getConnectionProperties () {
		
		String protocol = environment.getProperty(Constants.APP_OBP_PROTOCOL, DEFAULT_OBP_PROTOCOL);
		String host = environment.getProperty(Constants.APP_OBP_HOST, DEFAULT_OBP_HOSTNAME);
		String port = environment.getProperty(Constants.APP_OBP_PORT, "");
		String version = environment.getProperty(Constants.APP_OBP_VERSION, DEFAULT_OBP_VERSION);
		String consumerKey = environment.getProperty(Constants.APP_OBP_CONSUMER_KEY, "");
		
		ObpService.apiBaseUrl = protocol + "://" + host;
		
		// check port values to see if it needs to be added to URL
		if (port != null && !port.isEmpty()) {
			if (!port.equals("443") && !port.equals("80")) { 
				ObpService.apiBaseUrl += ":" + port;
			} else {
				// if the port is a default of 443 or 80, then only add the port if 
				// it has been specified without the associated default protocol for the port.
				if (port.equals("443") && protocol.equals("http")) {
					ObpService.apiBaseUrl += ":" + port;
				}
				if (port.equals("80") && protocol.equals("https")) {
					ObpService.apiBaseUrl += ":" + port;
				}
			}
		}
		
		ObpService.apiLoginUrl = ObpService.apiBaseUrl + Constants.URI_OBP_API_DIRECT_LOGIN;
		ObpService.apiBaseUrl += MessageFormat.format(Constants.URI_OBP_API_BASE, version);
		ObpService.consumerKey = consumerKey;

		LOG.debug("OBP API Service URL: " + ObpService.apiBaseUrl);
		
		// Make sure values were passed in for these properties
		if (protocol == null ||
			host == null ||
			version == null ||
			consumerKey == null) {
			
			LOG.error("OBP API Service: Connection properties are missing in the configuration.");
			
			return false;
		}
		
		// Check the URL properties to ensure a valid URL can be formed
		try {
			UriComponentsBuilder.fromHttpUrl(ObpService.apiBaseUrl);
			
			return true;
		}
		catch (IllegalArgumentException ex) {
			LOG.error("OBP API Service: Connection properties for protocol, host, port, and version are not correct in the configuration.");
			LOG.error("OBP API Service URL: " + ObpService.apiBaseUrl);
			LOG.error(ex.getMessage());
			
			ObpService.apiBaseUrl = null;
			ObpService.apiLoginUrl = null;
			ObpService.apiBaseUrl = null;
			ObpService.consumerKey = null;
		}
		
		return false;
	}
	
	/*
	 * Object for Authentication response
	 */
	private static class AuthToken {
		private String token;

		/**
		 * @return the token
		 */
		public String getToken() {
			return token;
		}
	}

}
