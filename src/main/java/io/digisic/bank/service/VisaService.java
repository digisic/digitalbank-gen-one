package io.digisic.bank.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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

import io.digisic.bank.util.Constants;


@Service
@Transactional
public class VisaService {
	
	private static final Logger LOG = LoggerFactory.getLogger(VisaService.class);
	
	// Visa Service URL
	private static String apiBaseUrl;
	
	@Autowired
	private Environment environment;
	
	// Visa Service Default properties
	private static final String DEFAULT_VISA_PROTOCOL 	= "https";
	private static final String DEFAULT_VISA_HOSTNAME 	= "creditservices.io"; 	
	
	public List<String> directVisaPayment (String extAccount, String extAmount)	throws Exception {
		
		
		LOG.debug("Visa Service :-> Visa Account = " + extAccount );
		LOG.debug("VVisa Service :-> Visa Amount  = " + extAmount );
			
		
		if (VisaService.apiBaseUrl == null) {
			getConnectionProperties();
		}

		
		List<String> results = new ArrayList<String>();
		

		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(VisaService.apiBaseUrl)
		                					.queryParam("idcode", extAccount)
											.queryParam("amount", extAmount);

		
		// Create required headers
		HttpHeaders requestHeaders = new HttpHeaders();
		requestHeaders.setContentType(MediaType.APPLICATION_JSON);
        requestHeaders.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        requestHeaders.set("User-Agent", "PostmanRuntime/7.13.0");
		
       LOG.debug("Visa Service :-> Request = " + uriBuilder.toUriString());
		
        // Create the Request
     	HttpEntity<?> requestEntity = new HttpEntity<>(requestHeaders);
     	
		
		RestTemplate restTemplate = new RestTemplate();
		
		try {
			
			ResponseEntity<String> responseEntity = restTemplate.exchange(uriBuilder.toUriString(), 
					 													  HttpMethod.GET, 
					 													  requestEntity, 
					 													  String.class);
			
			LOG.debug("Visa Service :-> Visa Response = " + responseEntity );
			
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(responseEntity.getBody());
		    
		    
			JsonNode idCode = root.path("actionCode");
			JsonNode Approvalcode = root.path("approvalCode");
			JsonNode CAVVResult = root.path("cavvResultCode");


			LOG.debug("Visa Service :-> Action Code from visa  = " + idCode);
			LOG.debug("Visa Service :-> Approval Code from visa  = " + Approvalcode);
			LOG.debug("Visa Service :-> CAVVResult Code from visa  = " + CAVVResult);
			
			
			String approvalcode = "Approved";
			int approvalID = root.path("actionCode").asInt();
			
			LOG.debug("Action code integer value " + approvalID);			
			
			switch (Integer.valueOf(approvalID)) {
				case 0:
					approvalcode = "Approved";
					break;
				case 51:
					approvalcode = "Insufficient Funds";
					break;
				case 57:
					approvalcode = "Transaction Not Approved";
					break;
				case 03:
					approvalcode = "Denied Invalid Merchant";
					break;
				default:
					approvalcode = "Approved";	
			}
		    
			results.add("Approval Status = " + approvalcode);
			results.add("Approval Code = " + root.path("approvalCode").asText());
			results.add("CAVV Result Code = " + root.path("cavvResultCode").asText());
			results.add("VISA Response Code = " + root.path("responseCode").asText());
			results.add("VISA Transaction Identifier = " + root.path("transactionIdentifier").asText());
				
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
		
		String protocol = environment.getProperty(Constants.APP_VISA_PROTOCOL, DEFAULT_VISA_PROTOCOL);
		String host = environment.getProperty(Constants.APP_VISA_HOST, DEFAULT_VISA_HOSTNAME);
		String port = environment.getProperty(Constants.APP_VISA_PORT, "");
		
		VisaService.apiBaseUrl = protocol + "://" + host;
		
		// check port values to see if it needs to be added to URL
		if (port != null && !port.isEmpty()) {
			if (!port.equals("443") && !port.equals("80")) { 
				VisaService.apiBaseUrl += ":" + port;
			} else {
				// if the port is a default of 443 or 80, then only add the port if 
				// it has been specified without the associated default protocol for the port.
				if (port.equals("443") && protocol.equals("http")) {
					VisaService.apiBaseUrl += ":" + port;
				}
				if (port.equals("80") && protocol.equals("https")) {
					VisaService.apiBaseUrl += ":" + port;
				}
			}
		}
		
		VisaService.apiBaseUrl += Constants.APP_VISA_URI_API_BASE;

		LOG.debug("VISA API Service URL: " + VisaService.apiBaseUrl);
		
		// Make sure values were passed in for these properties
		if (protocol == null ||
			host == null) {
			
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
			LOG.error("VISA API Service URL: " + VisaService.apiBaseUrl);
			LOG.error(ex.getMessage());
		}
		
		return false;
	}

}
