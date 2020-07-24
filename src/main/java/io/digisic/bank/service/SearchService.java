package io.digisic.bank.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.MathContext;
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

import io.digisic.bank.model.AtmLocation;
import io.digisic.bank.util.Constants;

@Service
@Transactional
public class SearchService {
	
	private static final Logger LOG = LoggerFactory.getLogger(SearchService.class);
	
	// ATM Location Service URL
	private static String apiBaseUrl;
	
	@Autowired
	private Environment environment;
	
	// Search Service Default properties
	private static final String DEFAULT_ATM_SEARCH_PROTOCOL 	= "https";
	private static final String DEFAULT_ATM_SEARCH_HOSTNAME 	= "bankingservices.io";
	
	public List<AtmLocation> searchATMLocations (String zipcode) throws Exception {
		
		if (SearchService.apiBaseUrl == null) {
			getConnectionProperties();
		}
		
		List<AtmLocation> results = new ArrayList<AtmLocation>();
				
		// Add query parameters for authentication credentials
		UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(SearchService.apiBaseUrl)
		                					.queryParam("zip", zipcode)
		                					.queryParam("radius", "10");
		
		LOG.debug("ATM Location Request: " + uriBuilder.toUriString());
		
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
			
			ObjectMapper mapper = new ObjectMapper();
			JsonNode root = mapper.readTree(responseEntity.getBody());
			int count = root.path("atms_count").asInt();
			
			// If we have some results
			if (count > 0) {
				
				JsonNode atmList = root.path("atms");
				
				LOG.debug("ATM Results Count = " + count);
				
				for (JsonNode location : atmList) {
					
					AtmLocation atm = new AtmLocation();
					
					JsonNode atmLocation = location.path("atmLocation");
					JsonNode address = atmLocation.path("address");
					JsonNode coordinates = atmLocation.path("coordinates");
					
					LOG.debug("ATM Location Name = " + atmLocation.path("name").asText());
					
					atm.setName(atmLocation.path("name").asText());
					atm.setDescription(atmLocation.path("locationDescription").asText());
					atm.setStreet(address.path("street").asText());
					atm.setCity(address.path("city").asText());
					atm.setState(address.path("state").asText());
					atm.setZipcode(address.path("postalCode").asText());
					atm.setCountry(address.path("country").asText());
					atm.setDistance(new BigDecimal(location.path("distance").doubleValue()).round(new MathContext(2)));
					atm.setLatitude(coordinates.path("latitude").asText());
					atm.setLongitude(coordinates.path("longitude").asText());
					
					results.add(atm);
				}
				
			}
			

			
		}
		catch (HttpStatusCodeException ex) {
			LOG.debug("ATM Location Service: Unable to successfully get ATM locations");
			LOG.debug(ex.getMessage());
			LOG.debug(ex.getResponseBodyAsString());
			
			throw ex;
			
		}
		catch (ResourceAccessException ex) {
			LOG.error("ATM Location Service: Unable to reach ATM Location Service endpoint");
			LOG.error(ex.getMessage());
			
			throw ex;
			
		} catch (IOException ex) {
			LOG.error("ATM Location Service: Unable to read response");
			LOG.error(ex.getMessage());
			
			throw ex;
		}
		
		return results;
	}
	
	
	
	/*
	 * Get ATM Location Service details from application.properties
	 */
	private boolean getConnectionProperties () {
		
		String protocol = environment.getProperty(Constants.APP_ATM_PROTOCOL, DEFAULT_ATM_SEARCH_PROTOCOL);
		String host = environment.getProperty(Constants.APP_ATM_HOST, DEFAULT_ATM_SEARCH_HOSTNAME);
		String port = environment.getProperty(Constants.APP_ATM_PORT, "");
		
		SearchService.apiBaseUrl = protocol + "://" + host;
		
		// check port values to see if it needs to be added to URL
		if (port != null && !port.isEmpty()) {
			if (!port.equals("443") && !port.equals("80")) { 
				SearchService.apiBaseUrl += ":" + port;
			}else {
				// if the port is a default of 443 or 80, then only add the port if 
				// it has been specified without the associated default protocol for the port.
				if (port.equals("443") && protocol.equals("http")) {
					SearchService.apiBaseUrl += ":" + port;
				}
				if (port.equals("80") && protocol.equals("https")) {
					SearchService.apiBaseUrl += ":" + port;
				}
			}
		}
		
		// Add ATM Search URI
		SearchService.apiBaseUrl += Constants.APP_ATM_URI_API_BASE;
		
		LOG.debug("ATM Location Service URL: " + SearchService.apiBaseUrl);
		

		// Make sure values were passed in for these properties
		if (protocol == null ||
			host == null) {
			
			LOG.error("ATM Location Service: Connection properties are missing in the configuration.");
			
			return false;
		}
		
		// Check the URL properties to ensure a valid URL can be formed
		try {
			UriComponentsBuilder.fromHttpUrl(SearchService.apiBaseUrl);
			
			return true;
		}
		catch (IllegalArgumentException ex) {
			LOG.error("ATM Location Service: Connection properties for protocol, host, and port are not correct in the configuration.");
			LOG.error("ATM Location Service URL: " + SearchService.apiBaseUrl);
			LOG.error(ex.getMessage());
		}
		
		return false;
	}

}
