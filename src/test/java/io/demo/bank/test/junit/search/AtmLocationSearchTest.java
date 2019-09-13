package io.demo.bank.test.junit.search;

import static com.ca.codesv.protocols.http.fluent.HttpFluentInterface.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.web.client.HttpStatusCodeException;
import net.serenitybdd.junit.spring.integration.SpringIntegrationSerenityRunner;
import net.thucydides.core.annotations.Narrative;
import net.thucydides.core.annotations.WithTagValuesOf;
import com.ca.codesv.engine.junit4.VirtualServerRule;
import io.demo.bank.model.AtmLocation;
import io.demo.bank.service.SearchService;


/**
 * Tests integration between <code>SearchService</code> of Digital Bank and synapsefi ATM locator service.
 *
 */

@Narrative(text={"As an application user",                      
        		 "I want to search for local ATM locations",
        		 "So I can find a convenient ATM near me"})
@SpringBootTest
@WithTagValuesOf({"Search"})
@ContextConfiguration(classes = SearchService.class)
@RunWith(SpringIntegrationSerenityRunner.class)
public class AtmLocationSearchTest extends BaseTest {

	private static final Logger LOG = LoggerFactory.getLogger(AtmLocationSearchTest.class);
	
    @Rule
    public VirtualServerRule vs = new VirtualServerRule();
    
    @Autowired
	private SearchService searchService;
    
    /**
     * This method calls method requesting synapsefi API and tests whether it can handle synapsefi response correctly.
     *
     * In this test case, the scenario expects correct response from the synapsefi API.
     *
     * @throws Exception
     */
    @Test
    public void positiveResultTest() throws Exception {
    	
    	final String zipcode = "94203";
    	final int expResultSize = 2;
    	
    	try { // Setup Virtual Service with Code SV

	        forGet("https://bankingservices.io/v3.1/nodes/atms")
	        	.matchesQuery("zip", zipcode)
	        	.usingHttps(withSecureProtocol(TLS).keystorePath(KEYSTORE_PATH)
	                							     .keystorePassword(KEYSTORE_PASSWORD)
	                							     .keyPassword(KEYSTORE_PASSWORD))
	        	
	            .doReturn(okMessage().withJsonBody(POSITIVE_RESULTS_OK));

    	} catch (Exception ex) {
    		LOG.error("Error setting up Virtual Service: " + ex.getMessage());
    		
    		if (LOG.isDebugEnabled()) {
    			ex.printStackTrace();
    		}
    		throw new Exception(ex);
    	} // end try/catch
    	

		List<AtmLocation> locations = searchService.searchATMLocations(zipcode);

    	assertEquals(expResultSize, locations.size());
    }

    /**
	 * This method calls method requesting synapsefi API and tests whether it can handle synapsefi response correctly.
	 *
	 * In this test case, the scenario expects correct response, but with no ATMs found.
	 *
	 * @throws Exception
	 */
	@Test 
	public void zeroResultTest() throws Exception {
	  
		final String zipcode = "12345";
	  
		try { // Setup Virtual Service with Code SV
			forGet("https://bankingservices.io/v3.1/nodes/atms")
				.matchesQuery("zip", zipcode)
				.usingHttps(withSecureProtocol(TLS).keystorePath(KEYSTORE_PATH)
												   .keystorePassword(KEYSTORE_PASSWORD) 
												   .keyPassword(KEYSTORE_PASSWORD))
	  
				.doReturn(okMessage().withJsonBody(ZERO_RESULTS_OK));
	  
		} catch (Exception ex) { 
			
			LOG.error("Error setting up Virtual Service: " + ex.getMessage());
	  
			if (LOG.isDebugEnabled()) { 
				ex.printStackTrace(); 
			} 
			
			throw new Exception(ex);
		} // end try/catch
	  
		List<AtmLocation> locations = searchService.searchATMLocations(zipcode);

		assertTrue(locations.isEmpty());
	}

	/**
	 * This method calls method requesting synapsefi API and tests whether it can handle synapsefi response correctly.
	 *
	 * In this test case, the scenario expects the API returns 404 and application should throw expected <code>HttpStatusCodeException</code>.
	 *
	 * @throws Exception
	 */
	@Test(expected = HttpStatusCodeException.class)
	public void unavilableServiceTest() throws Exception {
	  
		final String zipcode = "94203";
	  
		try { // Setup Virtual Service with Code SV
	  
			forGet("https://bankingservices.io/v3.1/nodes/atms")
				.matchesQuery("zip", zipcode)
				.usingHttps(withSecureProtocol(TLS).keystorePath(KEYSTORE_PATH)
												   .keystorePassword(KEYSTORE_PASSWORD) 
												   .keyPassword(KEYSTORE_PASSWORD))
	  
				.doReturn(notFoundMessage());
	  
		} catch (Exception ex) { 
			
			LOG.error("Error setting up Virtual Service: " + ex.getMessage());
	  
			if (LOG.isDebugEnabled()) { 
				ex.printStackTrace(); 
			} 
			
			throw new Exception(ex);
		} // end try/catch

		searchService.searchATMLocations(zipcode);
		
	}

	
	private static final String ZERO_RESULTS_OK = 	"{\n" + "    \"atms\": [],\n" +
													"    \"atms_count\": 0,\n" + "    \"error_code\": \"0\",\n" +
													"    \"http_code\": \"200\",\n" + "    \"limit\": 20,\n" +
													"    \"page\": 1,\n" + "    \"page_count\": 0,\n" + "    \"success\": true\n"
													+ "}";
	 

    private static final String POSITIVE_RESULTS_OK = 	"{\n" +
											            "    \"atms\": [\n" +
											            "        {\n" +
											            "            \"atmLocation\": {\n" +
											            "                \"address\": {\n" +
											            "                    \"city\": \"San Francisco\",\n" +
											            "                    \"country\": \"USA\",\n" +
											            "                    \"postalCode\": \"94114\",\n" +
											            "                    \"state\": \"CA\",\n" +
											            "                    \"street\": \"443 Castro Street\"\n" +
											            "                },\n" +
											            "                \"coordinates\": {\n" +
											            "                    \"latitude\": 37.761746,\n" +
											            "                    \"longitude\": -122.435024\n" +
											            "                },\n" +
											            "                \"id\": \"818850\",\n" +
											            "                \"isAvailable24Hours\": true,\n" +
											            "                \"isDepositAvailable\": true,\n" +
											            "                \"isHandicappedAccessible\": false,\n" +
											            "                \"isOffPremise\": false,\n" +
											            "                \"isSeasonal\": false,\n" +
											            "                \"languageType\": null,\n" +
											            "                \"locationDescription\": \"US BANK CASTRO\",\n" +
											            "                \"logoName\": \"PAS\",\n" +
											            "                \"name\": \"U.S. Bank Castro\"\n" +
											            "            },\n" +
											            "            \"distance\": 0.4101105159902258\n" +
											            "        },\n" +
											            "        {\n" +
											            "            \"atmLocation\": {\n" +
											            "                \"address\": {\n" +
											            "                    \"city\": \"San Francisco\",\n" +
											            "                    \"country\": \"USA\",\n" +
											            "                    \"postalCode\": \"94110\",\n" +
											            "                    \"state\": \"CA\",\n" +
											            "                    \"street\": \"2601 Mission Street\"\n" +
											            "                },\n" +
											            "                \"coordinates\": {\n" +
											            "                    \"latitude\": 37.755035,\n" +
											            "                    \"longitude\": -122.41803\n" +
											            "                },\n" +
											            "                \"id\": \"819134\",\n" +
											            "                \"isAvailable24Hours\": true,\n" +
											            "                \"isDepositAvailable\": true,\n" +
											            "                \"isHandicappedAccessible\": false,\n" +
											            "                \"isOffPremise\": false,\n" +
											            "                \"isSeasonal\": false,\n" +
											            "                \"languageType\": null,\n" +
											            "                \"locationDescription\": \"US BANK 22ND & MISSION\",\n" +
											            "                \"logoName\": \"PAS\",\n" +
											            "                \"name\": \"U.S. Bank 22nd & Mission Street\"\n" +
											            "            },\n" +
											            "            \"distance\": 0.7987523536486233\n" +
											            "        }\n" +
											            "    ],\n" +
											            "    \"atms_count\": 2,\n" +
											            "    \"error_code\": \"0\",\n" +
											            "    \"http_code\": \"200\",\n" +
											            "    \"limit\": 20,\n" +
											            "    \"page\": 1,\n" +
											            "    \"page_count\": 1,\n" +
											            "    \"success\": true\n" +
											            "}";

}