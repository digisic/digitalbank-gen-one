package io.demo.bank.test.junit.search;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static com.ca.codesv.protocols.http.fluent.HttpFluentInterface.*;

import io.demo.bank.model.AtmLocation;
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
import com.ca.codesv.engine.junit4.VirtualServerRule;
import com.ca.codesv.protocols.transaction.TxnRepoStore;
import com.ca.codesv.sdk.CloudRepositoryConfig.ConfigBuilder;
import net.serenitybdd.junit.spring.integration.SpringIntegrationSerenityRunner;
import net.thucydides.core.annotations.Narrative;
import net.thucydides.core.annotations.WithTagValuesOf;
import io.demo.bank.service.SearchService;
import io.demo.bank.test.junit.BaseTest;



@Narrative(text={"As an application user",                      
		 "I want to search for local ATM locations",
		 "So I can find a convenient ATM near me"})
@SpringBootTest
@WithTagValuesOf({"feature:search", "feature:atm", "feature:codesv", "feature:blazect"})
@ContextConfiguration(classes = SearchService.class)
@RunWith(SpringIntegrationSerenityRunner.class)
public class AtmLocationSearchTestBlazeRepo extends BaseTest {
	
	private static final Logger LOG = LoggerFactory.getLogger(AtmLocationSearchTestBlazeRepo.class);

	@Rule
	public VirtualServerRule vs = new VirtualServerRule();
	
	// BlazeCT Transaction Store
	private TxnRepoStore store = new TxnRepoStore(new ConfigBuilder().withUri(BLAZEMETER_TRN_REPO_URI)
			 														 .withApiKey(BLAZEMETER_API_KEY)
			 														 .withApiSecret(BLAZEMETER_API_SECRET)
			 														 .withWorkspace(BLAZEMETER_WORKSPACE)
			 														 .build(), this);
	
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
		
		String zipcode = "11749";
		int expResultSize = 2;
	
		store.useTransaction("ATM Search 11749 With 2 Results", "ATM Search By Zip Code", 
							 withSecureProtocol(TLS).keystorePath(KEYSTORE_PATH)
				                					.keystorePassword(KEYSTORE_PASSWORD)
				                					.keyPassword(KEYSTORE_PASSWORD));

		List<AtmLocation> locations = searchService.searchATMLocations(zipcode);

		LOG.debug("Number of ATMs: " + locations.size());

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
		
		String zipcode = "12345";
		
		store.useTransaction("ATM Search 12345 With Zero Results", "ATM Search By Zip Code", 
							 withSecureProtocol(TLS).keystorePath(KEYSTORE_PATH)
				                					.keystorePassword(KEYSTORE_PASSWORD)
				                					.keyPassword(KEYSTORE_PASSWORD));

		List<AtmLocation> locations = searchService.searchATMLocations(zipcode);

		LOG.debug("Number of ATMs: " + locations.size());

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
		
		String zipcode = "11749";
   
		
		store.useTransaction("ATM Search 11749 With Unavailable Service", "ATM Search By Zip Code", 
							 withSecureProtocol(TLS).keystorePath(KEYSTORE_PATH)
				                					.keystorePassword(KEYSTORE_PASSWORD)
				                					.keyPassword(KEYSTORE_PASSWORD));

		searchService.searchATMLocations(zipcode);
	}

}
