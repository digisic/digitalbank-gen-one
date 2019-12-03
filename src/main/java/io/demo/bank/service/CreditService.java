package io.demo.bank.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.MessageFormat;
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

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.demo.bank.jms.CreditAppProducer;
import io.demo.bank.model.CreditApplication;
import io.demo.bank.model.CreditCardDetails;
import io.demo.bank.model.CreditReference;
import io.demo.bank.model.security.Users;
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
	
	@Autowired
	private CreditAppProducer creditAppProducer;
	
	/*
	 * Get Credit Card Account Details
	 */
	public CreditCardDetails getCreditCardDetails (Long id) {
		
		CreditCardDetails ccDetails = null;
		
		if (checkCreditConnection()) {
			
			// Create the Request
			HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
			
			RestTemplate restTemplate = new RestTemplate();
			
			// Set URL for Authentication
			String url = CreditService.apiBaseUrl + MessageFormat.format(Constants.APP_CREDIT_URI_CREDIT_CARD_ID, id);
			
			// Add query parameters for authentication credentials
			UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(url);
			
			try { // Submit Authentication Request
				
				ResponseEntity<String> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
																				 HttpMethod.GET, 
																				 requestEntity, 
																				 String.class);
				
				
				
				if (responseEntity.getStatusCode() == HttpStatus.OK) {
				      
					 ccDetails = mapCreditCardDetails(responseEntity.getBody());
					 
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
		
		return ccDetails;
		
	}
	
	/*
	 * Check id User has a Credit Application
	 */
	public boolean userHasApplication(Users user) {
		
		LOG.debug("User Has Credit Application? ");

		Optional<CreditReference> opt = creditReferenceRepository.findByBankUserId(user.getId());
		  
		if (opt.isPresent()) {
			return true; 
		} else {
			return false; 
		}
		 
	}
	
	/*
	 * Get Application Status
	 */
	public CreditReference getCurrentCreditAppStatus(Users user) {
		
		Optional<CreditReference> opt = creditReferenceRepository.findByBankUserId(user.getId());
		
		if (opt.isPresent()) {
			return opt.get();
		}
		
		return null;
	}
	
	/*
	 * Get Credit Reference
	 */
	public CreditReference getCreditReference (String correlationId) {
		
		Optional<CreditReference> opt = creditReferenceRepository.findByCorrelationId(correlationId);
		
		if (opt.isPresent())
			return opt.get();
		else
			return null;
	}
	

	/*
	 * Get Credit Reference
	 */
	public CreditReference getCreditReference (Long applicationId) {
		
		Optional<CreditReference> opt = creditReferenceRepository.findByApplicationId(applicationId);
		
		if (opt.isPresent())
			return opt.get();
		else
			return null;
	}
	
	/*
	 * Update Credit Reference
	 */
	public void updateCreditReference (CreditReference creditReference) {
		creditReferenceRepository.save(creditReference);
	}
			
	
	/*
	 * Check is User has a Credit Account Linked
	 */
	public boolean userHasLinkedCreditAccount (Users user) {
		
		LOG.debug("User Has Credit Account Linked? ");
		
		
		Optional<CreditReference> opt = creditReferenceRepository.findByBankUserId(user.getId());
		
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
	public boolean submitCreditApplication (Users user, CreditApplication app) {
		
		String messageId = creditAppProducer.sendCreditApplication(app);
		
		// Create a new Credit Reference record
		CreditReference creditReference = new CreditReference();
		
		creditReference.setBankUserId(user.getId());
		creditReference.setCorrelationId(messageId);
		creditReference.setApplicationDate(new Date()); 
		creditReference.setApplicationStatus(Constants.APP_STATUS_SUBMITTED);
		creditReference.setApplicationStatusDetail("Your credit application has been sent to the credit provider for review."
				+ " Expect a response from the credit provider shortly.");
		 
		creditReferenceRepository.save(creditReference);
		
		return true;
		
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
	
	private CreditCardDetails mapCreditCardDetails (String response) {
		CreditCardDetails ccDetails = new CreditCardDetails();
		

			ObjectMapper mapper = new ObjectMapper();
			JsonNode node;
			
			try {
				
				node = mapper.readTree(response);
				
				ccDetails.setId(node.get("id").longValue());
				ccDetails.setCardNumber(node.get("cardNumber").asText());
				ccDetails.setCvv(node.get("cvv").asText());
				ccDetails.setApr(new BigDecimal(node.get("apr").asDouble()));
				ccDetails.setLimit(new BigDecimal(node.get("creditLimit").asDouble()));
				ccDetails.setDateValid(node.get("dateValid").asText());
				ccDetails.setDateExpire(node.get("dateExpire").asText());
				
			} catch (IOException e) {
				LOG.error("Unable to read Json response for Credit Card and covert to an object.");
				e.printStackTrace();
			}
			
		return ccDetails;
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
	
}
