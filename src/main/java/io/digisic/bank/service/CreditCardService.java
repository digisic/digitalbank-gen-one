package io.digisic.bank.service;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import io.digisic.bank.jms.CreditAppProducer;
import io.digisic.bank.model.CreditCardApplication;
import io.digisic.bank.model.CreditCardBillingDetail;
import io.digisic.bank.model.CreditCardDetail;
import io.digisic.bank.model.CreditCardReference;
import io.digisic.bank.model.CreditCardTransaction;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.repository.CreditCardReferenceRepository;
import io.digisic.bank.util.Constants;

@Service
@Transactional
public class CreditCardService {
	
	private static final Logger LOG = LoggerFactory.getLogger(CreditCardService.class);
	
	// Digital Credit Connection details
	private static Boolean creditEnabled;
	private static String apiBaseUrl;
	private static String username;
	private static String password;
	private static String authToken;
	private static HttpHeaders requestHeaders;
	
	// Digital Credit Default properties
	private static final String DEFAULT_DIGTIAL_CREDIT_PROTOCOL 	= "http";
	private static final String DEFAULT_DIGTIAL_CREDIT_HOSTNAME 	= "localhost"; 
	private static final String DEFAULT_DIGTIAL_CREDIT_PORT 		= "8080";
	private static final String DEFAULT_DIGTIAL_CREDIT_CONTEXT_PATH = "/credit";
	private static final String DEFAULT_DIGTIAL_CREDIT_USERNAME 	= "admin@demo.io";
	private static final String DEFAULT_DIGTIAL_CREDIT_PASSWORD 	= "Demo123!";
	
	
	@Autowired
	private CreditCardReferenceRepository ccReferenceRepository;
	
	@Autowired
	private Environment environment;
	
	@Autowired(required = false)
	private CreditAppProducer creditAppProducer;
	
	/*
	 * Get Credit Card Account Details
	 */
	public CreditCardDetail getCreditCardDetails (Long id) {
		
		
		if (checkCreditConnection()) {
			
			// Create the Request
			HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
			
			RestTemplate restTemplate = new RestTemplate();
			
			// Set URL for Authentication
			String url = CreditCardService.apiBaseUrl + MessageFormat.format(Constants.APP_CREDIT_URI_CC_ID, id);
			
			// Add query parameters for authentication credentials
			UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url);
			
			try { // Submit Authentication Request
				
				ResponseEntity<CreditCardDetail> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
																				 HttpMethod.GET, 
																				 requestEntity, 
																				 CreditCardDetail.class);
				
				
				
				if (responseEntity.getStatusCode() == HttpStatus.OK) {
				      
					 return responseEntity.getBody();
					 
				} // End If
				else {
					
					 LOG.error("Digital Credit: Could not find credit card requested.");
					 LOG.error(responseEntity.getStatusCode().toString());
					 LOG.error(responseEntity.getBody().toString());
					 
					 
			    } // End Else
			} // End Try
			catch (HttpStatusCodeException ex) {
				LOG.error("Digital Credit: Could not find credit card requested.");
				LOG.error(ex.getResponseBodyAsString());
				
			} // End Catch
			catch (ResourceAccessException ex) {
				LOG.error("Digital Credit: Unable to reach Digital Credit endpoint");
				LOG.error(ex.getMessage());
			} // End Catch
			
		}
		
		return null;
		
	}
	
	/*
	 * Get Credit Card Billing Detail
	 */
	public CreditCardBillingDetail getCreditCardBillingDetail (Long id) {
		
		if (checkCreditConnection()) {
			
			// Create the Request
			HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
			
			RestTemplate restTemplate = new RestTemplate();
			
			// Set URL for Authentication
			String url = CreditCardService.apiBaseUrl + MessageFormat.format(Constants.APP_CREDIT_URI_CC_ID_BILLING, id);
			
			// Add query parameters for authentication credentials
			UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url);
			
			try { // Submit Authentication Request
				
				ResponseEntity<CreditCardBillingDetail> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
																				 HttpMethod.GET, 
																				 requestEntity, 
																				 CreditCardBillingDetail.class);
				
				
				
				if (responseEntity.getStatusCode() == HttpStatus.OK) {
				      
					 return responseEntity.getBody();
					 
				} // End If
				else {
					
					 LOG.error("Digital Credit: Could not find credit card billing requested.");
					 LOG.error(responseEntity.getStatusCode().toString());
					 LOG.error(responseEntity.getBody().toString());
					 
					 
			    } // End Else
			} // End Try
			catch (HttpStatusCodeException ex) {
				LOG.error("Digital Credit: Could not find credit card billing requested.");
				LOG.error(ex.getResponseBodyAsString());
				
			} // End Catch
			catch (ResourceAccessException ex) {
				LOG.error("Digital Credit: Unable to reach Digital Credit endpoint");
				LOG.error(ex.getMessage());
			} // End Catch
			
		}
		
		return null;
		
	}
	
	
	/*
	 * Get Credit Card Transactions
	 */
	public List<CreditCardTransaction> getCreditCardTransactions (Long id) {
		
		if (checkCreditConnection()) {
			
			// Create the Request
			HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
			
			RestTemplate restTemplate = new RestTemplate();
			
			// Set URL for Authentication
			String url = CreditCardService.apiBaseUrl + MessageFormat.format(Constants.APP_CREDIT_URI_CC_ID_TRANS, id);
			
			// Add query parameters for authentication credentials
			UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url);
			
			try { // Submit Authentication Request
				
				ResponseEntity<CreditCardTransaction[]> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
																				 HttpMethod.GET, 
																				 requestEntity, 
																				 CreditCardTransaction[].class);
				
				
				
				if (responseEntity.getStatusCode() == HttpStatus.OK) {
					
					List<CreditCardTransaction> transList = new ArrayList<>(Arrays.asList(responseEntity.getBody()));
					
					return transList;
					
					 
				} // End If
				else {
					
					 LOG.error("Digital Credit: Could not find credit card transactions requested.");
					 LOG.error(responseEntity.getStatusCode().toString());
					 LOG.error(responseEntity.getBody().toString());
					 
					 
			    } // End Else
			} // End Try
			catch (HttpStatusCodeException ex) {
				LOG.error("Digital Credit: Could not find credit card transactions requested.");
				LOG.error(ex.getResponseBodyAsString());
				
			} // End Catch
			catch (ResourceAccessException ex) {
				LOG.error("Digital Credit: Unable to reach Digital Credit endpoint");
				LOG.error(ex.getMessage());
			} // End Catch
			
		}
		
		return new ArrayList<CreditCardTransaction>();
		
	}
	
	/*
	 * Check id User has a Credit Application
	 */
	public boolean userHasApplication(Users user) {
		
		LOG.debug("User Has Credit Application? ");

		Optional<CreditCardReference> opt = ccReferenceRepository.findByBankUserId(user.getId());
		  
		if (opt.isPresent()) {
			return true; 
		} else {
			return false; 
		}
		 
	}
	
	/*
	 * Get all Credit References
	 */
	public List<CreditCardReference> getCreditReferences(){
		return ccReferenceRepository.findAll();
	}
	
	/*
	 * Get Credit Reference by User
	 */
	public CreditCardReference getCreditReference (Users user) {
		
		Optional<CreditCardReference> opt = ccReferenceRepository.findByBankUserId(user.getId());
		
		if (opt.isPresent()) {
			return opt.get();
		}
		
		return null;
	}
	
	/*
	 * Get Credit Reference By Correlation Id
	 */
	public CreditCardReference getCreditReference (String correlationId) {
		
		Optional<CreditCardReference> opt = ccReferenceRepository.findByCorrelationId(correlationId);
		
		if (opt.isPresent())
			return opt.get();
		else
			return null;
	}
	

	/*
	 * Get Credit Reference By Application Id
	 */
	public CreditCardReference getCreditReference (Long applicationId) {
		
		Optional<CreditCardReference> opt = ccReferenceRepository.findByApplicationId(applicationId);
		
		if (opt.isPresent())
			return opt.get();
		else
			return null;
	}
	
	/*
	 * Update Credit Reference
	 */
	public void updateCreditReference (CreditCardReference creditReference) {
		ccReferenceRepository.save(creditReference);
	}
			
	
	/*
	 * Check is User has a Credit Account Linked
	 */
	public boolean userHasLinkedCreditAccount (Users user) {
		
		LOG.debug("User Has Credit Account Linked? ");
		
		
		Optional<CreditCardReference> opt = ccReferenceRepository.findByBankUserId(user.getId());
		
		if (opt.isPresent() && opt.get().getCreditCardId() != null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	/*
	 * Submit Credit Application
	 */
	public boolean submitCreditApplication (Users user, CreditCardApplication app) {
		
		String messageId = creditAppProducer.sendCreditApplication(app);
		
		// Create a new Credit Reference record
		CreditCardReference ccReference = new CreditCardReference();
		
		ccReference.setBankUserId(user.getId());
		ccReference.setCorrelationId(messageId);
		ccReference.setApplicationDate(new Date()); 
		ccReference.setApplicationStatus(Constants.APP_STATUS_SUBMITTED);
		ccReference.setApplicationStatusDetail(Constants.APP_STATUS_SUBMITTED_DETAIL);
		 
		ccReferenceRepository.save(ccReference);
		
		return true;
		
	}
	
	
	/*
	 * Check to see if Credit Service is enabled in the application.properties
	 */
	public boolean isCreditServiceEnabled () {
		
		if (CreditCardService.creditEnabled == null)
			CreditCardService.creditEnabled = Boolean.parseBoolean(environment.getProperty(Constants.APP_CREDIT_ENABLED));
		
		return CreditCardService.creditEnabled;
	}
	
	/*
	 * Check if we have an Auth Token, if not Create a new connection
	 */
	public boolean checkCreditConnection () {
		
		if (CreditCardService.authToken != null) {
			return true;
		} 
		else if (getConnectionProperties()) {
			return createCreditConnection();
		}
		
		return false;
	}
	
	/*
	 * Delete Credit Card record
	 */
	public boolean deleteCreditCard (Users user) {

		if (checkCreditConnection()) {
			
			CreditCardReference ccReference = getCreditReference(user);
			Long id = ccReference.getCreditCardId();
			
			// Create the Request
			HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
			
			RestTemplate restTemplate = new RestTemplate();
			
			// Set URL for Authentication
			String url = CreditCardService.apiBaseUrl + MessageFormat.format(Constants.APP_CREDIT_URI_CC_ID, id);
			
			// Add query parameters for authentication credentials
			UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url);
			
			try { // Submit Authentication Request
				
				ResponseEntity<String> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
																				 HttpMethod.DELETE, 
																				 requestEntity, 
																				 String.class);
				
			
				if (responseEntity.getStatusCode() == HttpStatus.NO_CONTENT) {
					
					removeCreditCardReference(ccReference);
					
					return true;
					 
				} // End If
				else {
					
					 LOG.error("Digital Credit: Unable to Delete Credit Card with id: " + id);
					 LOG.error(responseEntity.getStatusCode().toString());
					 
					 if (responseEntity.hasBody())
						 LOG.error(responseEntity.getBody().toString());
					 
					 return false;
					 
			    } // End Else
			} // End Try
			catch (HttpStatusCodeException ex) {
				LOG.error("Digital Credit: Unable to Delete Credit Card with id: " + id);
				LOG.error(ex.getResponseBodyAsString());
				
			} // End Catch
			catch (ResourceAccessException ex) {
				LOG.error("Digital Credit: Unable to reach Digital Credit endpoint");
				LOG.error(ex.getMessage());
			} // End Catch
		
		}
		
		return false;
	}
	
	/*
	 * Delete the credit card reference record
	 */
	public void removeCreditCardReference (CreditCardReference ccReference) {
		ccReferenceRepository.delete(ccReference);
	}
	
	/*
	 * Get authentication token if needed
	 */
	private boolean createCreditConnection () {
		
		// Set URL for Authentication
		String url = CreditCardService.apiBaseUrl + Constants.APP_CREDIT_URI_API_AUTH;
		
		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("username", CreditCardService.username)
                .queryParam("password", CreditCardService.password);
		
		// Create required headers
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(MediaType.APPLICATION_JSON);
        requestHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		
        // Create the Request
		HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
		
		RestTemplate restTemplate = new RestTemplate();
		
		try { // Submit Authentication Request
			
			ResponseEntity<AuthToken> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
																			 HttpMethod.POST, 
																			 requestEntity, 
																			 AuthToken.class);
			if (responseEntity.getStatusCode() == HttpStatus.OK) {
			      
				 LOG.info("Digital Credit: Obtained authentication succcessfully");
				 
				 CreditCardService.authToken = responseEntity.getBody().getAuthToken();
				 
				 requestHeaders.add("Authorization", "Bearer " + CreditCardService.authToken);
				 CreditCardService.requestHeaders = requestHeaders;
				 
				 return true;
				 
			} // End If
			else {
				
				 LOG.error("Digital Credit: Authentication Request Failed");
				 LOG.error(responseEntity.getStatusCode().toString());
				 LOG.error(responseEntity.getBody().toString());
				 
				 return false;
				 
		    } // End Else
		} // End Try
		catch (HttpStatusCodeException ex) {
			LOG.error("Digital Credit: Authentication Request Failed");
			LOG.error(ex.getResponseBodyAsString());
			
			return false;
		} // End Catch
		catch (ResourceAccessException ex) {
			LOG.error("Digital Credit: Unable to reach Digital Credit endpoint");
			LOG.error(ex.getMessage());
		} // End Catch
		
		return false;
	}
	
	
	/*
	 * Get Digital Credit connection details from application.properties
	 */
	private boolean getConnectionProperties () {
		
		String protocol = environment.getProperty(Constants.APP_CREDIT_PROTOCOL, DEFAULT_DIGTIAL_CREDIT_PROTOCOL);
		String host = environment.getProperty(Constants.APP_CREDIT_HOST, DEFAULT_DIGTIAL_CREDIT_HOSTNAME);
		String port = environment.getProperty(Constants.APP_CREDIT_PORT, DEFAULT_DIGTIAL_CREDIT_PORT);
		String contextPath = environment.getProperty(Constants.APP_CREDIT_CONTEXT_PATH, DEFAULT_DIGTIAL_CREDIT_CONTEXT_PATH);

		// Add path separator in the beginning if its not there
		if (!contextPath.startsWith("/")) {
			contextPath = "/" + contextPath;
		}
		
		// Remove path separator if it exists in the end
		if (contextPath.endsWith("/")) {
			contextPath = contextPath.substring(0, contextPath.length()-1);
		}
		
		CreditCardService.apiBaseUrl = protocol + "://"
				 				 	 + host + ":"
				 				 	 + port
				 				 	 + contextPath
				 				 	 + Constants.APP_CREDIT_URI_API_BASE;
		
		CreditCardService.username 		= environment.getProperty(Constants.APP_CREDIT_USER, DEFAULT_DIGTIAL_CREDIT_USERNAME);
		CreditCardService.password		= environment.getProperty(Constants.APP_CREDIT_PASSWORD, DEFAULT_DIGTIAL_CREDIT_PASSWORD);
		
		// Make sure values were passed in for these properties
		if (CreditCardService.username == null || 
			CreditCardService.password == null ||
			protocol == null ||
			host == null ||
			port == null) {
			LOG.error("Digital Credit: Connection properties are missing in the configuration.");
			
			return false;
		}
		
		// Check the URL properties to ensure a valid URL can be formed
		try {
			UriComponentsBuilder.fromHttpUrl(CreditCardService.apiBaseUrl);
			
			return true;
		}
		catch (IllegalArgumentException ex) {
			LOG.error("Digital Credit: Connection properties for protocol, host, and port are not correct in the configuration.");
			LOG.error(ex.getMessage());
		}
		
		return false;
	}
	
	

	/*
	 * Object for Authentication response
	 */
	private static class AuthToken {
		private String authToken;

		/**
		 * @return the authToken
		 */
		public String getAuthToken() {
			return authToken;
		}
	}
	
}
