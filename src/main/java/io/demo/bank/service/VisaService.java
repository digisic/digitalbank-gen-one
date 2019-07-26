package io.demo.bank.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.MathContext;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hibernate.type.StringType;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
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
import io.demo.bank.model.AtmLocation;
import io.demo.bank.util.Constants;

@Service
@Transactional
public class VisaService {
	
	private static final Logger LOG = LoggerFactory.getLogger(VisaService.class);
	
	// ATM Location Service URL
	private static String apiBaseUrl;
	
	@Autowired
	private Environment environment;
	
	public List<AtmLocation> searchATMLocations (String zipcode) throws Exception {
		
		if (VisaService.apiBaseUrl == null) {
			getConnectionProperties();
		}
		
		List<AtmLocation> results = new ArrayList<AtmLocation>();
				
		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(VisaService.apiBaseUrl)
		                					.queryParam("idcode", zipcode);

		
//		LOG.debug("ATM Location Request: " + uriBuilder.toUriString());
		
		// Create required headers
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(MediaType.APPLICATION_JSON);
        requestHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        requestHeaders.set("User-Agent", "PostmanRuntime/7.13.0");
		
       
		
        // Create the Request
     	HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
     	
		
		RestTemplate restTemplate = new RestTemplate();
		
		try {
			ResponseEntity<String> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
					 													  HttpMethod.GET, 
					 													  requestEntity, 
					 													  String.class);
			
			LOG.debug("Visa Response = " + responseEntity );
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(responseEntity.getBody());
		    
		    
			JsonNode idCode = root.path("actionCode");
			JsonNode Approvalcode = root.path("approvalCode");
			JsonNode CAVVResult = root.path("cavvResultCode");


			LOG.debug("Action Code from visa  = " + idCode);
			LOG.debug("Approval Code from visa  = " + Approvalcode);
			LOG.debug("CAVVResult Code from visa  = " + CAVVResult);
			
			
			
//			AtmLocation atm2 = new AtmLocation();
//		
//					atm.setName(idCode);
//					atm.setDescription(Approvalcode);
//					atm.setStreet(CAVVResult);
								
//					results.add(atm2);

			String approvalcode = "Approved";
			
		
			final Integer approvalID = root.path("actionCode").asInt();
			LOG.debug("Action code integer value " + approvalID);			
//		    switch (approvalID) {
//	        case 0:{
//	            approvalcode = "Approved";}
//	        case 51:{
//	        	approvalcode = "Insufficient Funds";}
//	    }
			
		    
		    if (approvalID == 0) {
		    	approvalcode = "Approved";}
			else if (approvalID == 51) {
		    	approvalcode = "Insufficient Funds";}
			else if (approvalID == 57) {
		    	approvalcode = "Transaction Not Approved";}
			else if (approvalID == 03) {
		    	approvalcode = "Denied Invalid Merchant";}
	
						
					AtmLocation atm = new AtmLocation();
						
//						atm.setName("Action Code = " + root.path("actionCode").asText());
						atm.setName("Approval Status = " + approvalcode);
						atm.setDescription("Approval Code = " + root.path("approvalCode").asText());
						atm.setStreet("CAVV Result Code = " + root.path("cavvResultCode").asText());
						atm.setCity("VISA Response Code" + root.path("responseCode").asText());
						atm.setState("VISA Transaction Identifier" + root.path("transactionIdentifier").asText());
						atm.setZipcode(root.path("postalCode").asText());
						atm.setCountry(root.path("country").asText());
						results.add(atm);

					
		}
		catch (HttpStatusCodeException ex) {
			LOG.debug("VISA API Service: Unable to successfully get Visa Account");
			LOG.debug(ex.getMessage());
			LOG.debug(ex.getResponseBodyAsString());
			
			throw ex;
			
		}
		catch (ResourceAccessException ex) {
			LOG.error("VISA API Service: Unable to reach VISA API Service endpoint");
			LOG.error(ex.getMessage());
			
			throw ex;
			
		} catch (IOException ex) {
			LOG.error("VISA API Service: Unable to read response");
			LOG.error(ex.getMessage());
			
			throw ex;
		}
		
		return results;
	}
	
	
	
	/*
	 * Get VISA API Service details from application.properties
	 */
	private boolean getConnectionProperties () {
		
		String protocol = environment.getProperty(Constants.APP_VISA_PROTOCOL);
		String host = environment.getProperty(Constants.APP_VISA_HOST);
		String port = environment.getProperty(Constants.APP_VISA_PORT);
		
		VisaService.apiBaseUrl 	= protocol + "://"
				 				 	+ host + ":"
				 				 	+ port
				 				 	+ Constants.APP_VISA_URI_API_BASE;
		

		
		// Make sure values were passed in for these properties
		if (protocol == null ||
			host == null ||
			port == null) {
			
			LOG.error("VISA API Service: Connection properties are missing in the configuration.");
			
			return false;
		}
		
		// Check the URL properties to ensure a valid URL can be formed
		try {
			UriComponentsBuilder.fromHttpUrl(VisaService.apiBaseUrl);
			
			return true;
		}
		catch (IllegalArgumentException ex) {
			LOG.error("VISA API Service: Connection properties for protocol, host, and port are not correct in the configuration.");
			LOG.error(ex.getMessage());
		}
		
		return false;
	}

}
