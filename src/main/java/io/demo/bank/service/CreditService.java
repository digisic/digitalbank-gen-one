package io.demo.bank.service;

import java.util.Arrays;
import java.util.Date;
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
import io.demo.bank.model.CreditApplication;
import io.demo.bank.model.CreditReference;
import io.demo.bank.model.security.User;
import io.demo.bank.repository.CreditReferenceRepository;
import io.demo.bank.util.Constants;

@Service
@Transactional
public class CreditService {
	
	private static final Logger LOG = LoggerFactory.getLogger(CreditService.class);
	
	// Digital Credit Connection details
	private static Boolean creditEnabled;
	private static String apiBaseUrl;
	private static String username;
	private static String password;
	private static String authToken;
	private static HttpHeaders requestHeaders;
	
	@Autowired
	private CreditReferenceRepository creditReferenceRepository;
	
	@Autowired
	private Environment environment;
	
	
	/*
	 * Check id User has a Credit Application
	 */
	public boolean userHasApplication(User user) {
		
		LOG.debug("User Has Credit Application? ");
		
		Optional<CreditReference> opt = creditReferenceRepository.findByBankUserId(user.getId());
		
		if (opt.isPresent() && opt.get().getAppId() > 0) {
			
			LOG.debug("Credit Application Found -> " + opt.get().getAppId());
			
			return true;
		}
		else {
			
			LOG.debug("No Credit Application Found");
			
			return false;
		}
	}
	
	/*
	 * Get Application Status
	 */
	public CreditReference getCurrentCreditAppStatus(User user) {
		
		Optional<CreditReference> opt = creditReferenceRepository.findByBankUserId(user.getId());
		
		if (opt.isPresent()) {
			return opt.get();
		}
		
		return null;
	}
	
	/*
	 * Check is User has a Credit Account Linked
	 */
	public boolean userHasLinkedCreditAccount (User user) {
		
		LOG.debug("User Has Credit Account Linked? ");
		
		Optional<CreditReference> opt = creditReferenceRepository.findByBankUserId(user.getId());
		
		if (opt.isPresent() && opt.get().getAcctId() != null) {
			
			LOG.debug("Credit Account Found -> " + opt.get().getAcctId());
			
			return true;
		}
		else {
			
			LOG.debug("No Credit Account Found");
			
			return false;
		}
	}
	
	/*
	 * Submit Credit Application
	 */
	public boolean submitCreditApplication (User user, CreditApplication app) {
		
		String url = CreditService.apiBaseUrl + "/credit/application";
		
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url);
		
		HttpEntity<CreditApplication> requestEntity = new HttpEntity<>(app, CreditService.requestHeaders);
		
		LOG.debug("Credit Application Request ->" + requestEntity.toString());
		
		RestTemplate restTemplate = new RestTemplate();
		
		try {
			ResponseEntity<CreditAppStatus> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
																		  HttpMethod.POST, 
																		  requestEntity, 
																		  CreditAppStatus.class);
			
			CreditReference creditReference = new CreditReference();
			
			// Create a new Credit Reference record
			creditReference.setBankUserId(user.getId());
			creditReference.setAppDate(new Date());
			creditReference.setAppId(responseEntity.getBody().getId());
			creditReference.setAppStatus(responseEntity.getBody().getStatus());
			
			creditReferenceRepository.save(creditReference);
			
			LOG.debug("Application ID -> " + responseEntity.getBody().getId());
			LOG.debug("Application Status -> " + responseEntity.getBody().getStatus());
			
			return true;
		}
		catch (HttpStatusCodeException ex) {
			LOG.debug("Digital Credit: Unable to successfully post credit application");
			LOG.debug(ex.getMessage());
			LOG.debug(ex.getResponseBodyAsString());
			
			return false;
		}
		catch (ResourceAccessException ex) {
			LOG.error("Digital Credit: Unable to reach Digital Credit endpoint");
			LOG.error(ex.getMessage());
			
			return false;
		} // End Catch
	}
	
	
	/*
	 * Check to see if Credit Service is enabled in the application.properties
	 */
	public boolean isCreditServiceEnabled () {
		
		if (CreditService.creditEnabled == null)
			CreditService.creditEnabled = Boolean.parseBoolean(environment.getProperty(Constants.APP_CREDIT_ENABLED));
		
		return CreditService.creditEnabled;
	}
	
	/*
	 * Check if we have an Auth Token, if not Create a new connection
	 */
	public boolean checkCreditConnection () {
		
		if (CreditService.authToken != null) {
			return true;
		} 
		else if (getConnectionProperties()) {
			return createCreditConnection();
		}
		
		return false;
	}
	
	/*
	 * Get authentication token if needed
	 */
	private boolean createCreditConnection () {
		
		// Set URL for Authentication
		String url = CreditService.apiBaseUrl + Constants.APP_CREDIT_URI_API_AUTH;
		
		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url)
                .queryParam("username", CreditService.username)
                .queryParam("password", CreditService.password);
		
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
				 
				 CreditService.authToken = responseEntity.getBody().getAuthToken();
				 
				 requestHeaders.add("Authorization", "Bearer " + CreditService.authToken);
				 CreditService.requestHeaders = requestHeaders;
				 
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
		
		String protocol = environment.getProperty(Constants.APP_CREDIT_PROTOCOL);
		String host = environment.getProperty(Constants.APP_CREDIT_HOST);
		String port = environment.getProperty(Constants.APP_CREDIT_PORT);
		
		CreditService.apiBaseUrl 	= protocol + "://"
				 				 	+ host + ":"
				 				 	+ port
				 				 	+ Constants.APP_CREDIT_URI_API_BASE;
		
		CreditService.username 		= environment.getProperty(Constants.APP_CREDIT_USER);
		CreditService.password		= environment.getProperty(Constants.APP_CREDIT_PASSWORD);
		
		// Make sure values were passed in for these properties
		if (CreditService.username == null || 
			CreditService.password == null ||
			protocol == null ||
			host == null ||
			port == null) {
			LOG.error("Digital Credit: Connection properties are missing in the configuration.");
			
			return false;
		}
		
		// Check the URL properties to ensure a valid URL can be formed
		try {
			UriComponentsBuilder.fromHttpUrl(CreditService.apiBaseUrl);
			
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
	
	/*
	 * Object for Credit Application Status 
	 */
	private static class CreditAppStatus {
		
		private Long id;
		private String status;
		/**
		 * @return the id
		 */
		public Long getId() {
			return id;
		}
		/**
		 * @return the status
		 */
		public String getStatus() {
			return status;
		}
	}
}
