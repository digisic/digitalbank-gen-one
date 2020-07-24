package io.digisic.bank.test.junit.search;

import static com.ca.codesv.protocols.http.fluent.HttpFluentInterface.*;

import java.util.List;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.EnabledOnJre;
import org.junit.jupiter.api.condition.JRE;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.web.client.HttpStatusCodeException;
import com.ca.codesv.engine.junit5.VirtualServerResolver;
import com.ca.codesv.protocols.transaction.TransactionException;
import com.ca.codesv.protocols.transaction.TxnRepoStore;
import com.ca.codesv.protocols.transaction.UseTransactionRule;
import com.ca.codesv.sdk.CloudRepositoryConfig.ConfigBuilder;

import io.digisic.bank.model.AtmLocation;
import io.digisic.bank.service.SearchService;


@SpringBootTest
@ContextConfiguration(classes = SearchService.class)
@ExtendWith(SpringExtension.class)
@ExtendWith(VirtualServerResolver.class)
public class AtmLocationSearchTrnxRepoTest extends BaseTest {
	
	private static final Logger LOG = LoggerFactory.getLogger(AtmLocationSearchTrnxRepoTest.class);

	public VirtualServerResolver vs = new VirtualServerResolver();
	
	private static TxnRepoStore store;
	
	// Initialize Cloud Transaction Repository
	static {
		
		// try 
		try {
		
			store = new TxnRepoStore(new ConfigBuilder().withUri(BLAZEMETER_TRN_REPO_URI)
														.withApiKey(BLAZEMETER_API_KEY) 
														.withApiSecret(BLAZEMETER_API_SECRET)
														.withWorkspace(BLAZEMETER_WORKSPACE) .build(), AtmLocationSearchTrnxRepoTest.class);
		} catch (TransactionException e) {
			LOG.error("ATM Location Search Test: Could not connect to Cloud Transaction Repository.");
		}
	}
		
	
	@Autowired
	private SearchService searchService;
	
	@BeforeAll
    public static void testSetup() {
		
		setUpAppKeystoreForTest();
		
		// Only run test if these conditions are true
		Assumptions.assumeTrue(connectionDetailProvided());

    }
    
    @AfterAll
    public static void testTearDown() {
    	resetKeystore();
    }

	/**
     * This method calls method requesting synapsefi API and tests whether it can handle synapsefi response correctly.
     *
     * In this test case, the scenario expects correct response from the synapsefi API.
     *
     * @throws Exception
     */
	@Test
	@EnabledOnJre({JRE.JAVA_8})
	public void positiveResultTest() throws Exception {
		
		final String zipcode = "11749"; 
		final int expResultSize = 2;
		  
		UseTransactionRule rule = new UseTransactionRule.RuleBuilder(BLAZEMETER_TRN_SVC_NAME)
														.forTransaction(BLAZEMETER_TRN_NAME_POSITIVE)
														.withHttps(withSecureProtocol(TLS)
																   .keystorePath(KEYSTORE_PATH)
																   .keystorePassword(KEYSTORE_PASSWORD) 
																   .keyPassword(KEYSTORE_PASSWORD))
														.build();

		store.useTransactionWithRule(rule);
		
		
		List<AtmLocation> locations = searchService.searchATMLocations(zipcode);
		  
		LOG.debug("Number of ATMs: " + locations.size());
		  
		Assertions.assertEquals(expResultSize, locations.size());
		 

	}
	
	
	/**
	 * This method calls method requesting synapsefi API and tests whether it can handle synapsefi response correctly.
	 *
	 * In this test case, the scenario expects correct response, but with no ATMs found.
	 *
	 * @throws Exception
	 */
	@Test
	@EnabledOnJre({JRE.JAVA_8})
	public void zeroResultTest() throws Exception {
				
		final String zipcode = "12345";
		
		TxnRepoStore store = new TxnRepoStore(new ConfigBuilder().withUri(BLAZEMETER_TRN_REPO_URI)
				 .withApiKey(BLAZEMETER_API_KEY) 
				 .withApiSecret(BLAZEMETER_API_SECRET)
				 .withWorkspace(BLAZEMETER_WORKSPACE) .build(), this);
		
		UseTransactionRule rule = new UseTransactionRule.RuleBuilder(BLAZEMETER_TRN_SVC_NAME)
														.forTransaction(BLAZEMETER_TRN_NAME_ZERO)
														.withHttps(withSecureProtocol(TLS)
																   .keystorePath(KEYSTORE_PATH)
																   .keystorePassword(KEYSTORE_PASSWORD) 
																   .keyPassword(KEYSTORE_PASSWORD))
														.build();		
		  
		store.useTransactionWithRule(rule);
		  
		List<AtmLocation> locations = searchService.searchATMLocations(zipcode);
		  
		LOG.debug("Number of ATMs: " + locations.size());
		  
		Assertions.assertTrue(locations.isEmpty());
		 
	}
	
	
	/**
	 * This method calls method requesting synapsefi API and tests whether it can handle synapsefi response correctly.
	 *
	 * In this test case, the scenario expects the API returns 404 and application should throw expected <code>HttpStatusCodeException</code>.
	 *
	 * @throws Exception
	 */
	@Test
	@EnabledOnJre({JRE.JAVA_8})
	public void unavilableServiceTest() throws Exception {
		
		final String zipcode = "54321";
		
		TxnRepoStore store = new TxnRepoStore(new ConfigBuilder().withUri(BLAZEMETER_TRN_REPO_URI)
				 .withApiKey(BLAZEMETER_API_KEY) 
				 .withApiSecret(BLAZEMETER_API_SECRET)
				 .withWorkspace(BLAZEMETER_WORKSPACE) .build(), this);
		
		UseTransactionRule rule = new UseTransactionRule.RuleBuilder(BLAZEMETER_TRN_SVC_NAME)
														.forTransaction(BLAZEMETER_TRN_NAME_NO_SVC)
														.withHttps(withSecureProtocol(TLS)
																   .keystorePath(KEYSTORE_PATH)
				 						  						   .keystorePassword(KEYSTORE_PASSWORD) 
				 						  						   .keyPassword(KEYSTORE_PASSWORD))
														.build();
												
		store.useTransactionWithRule(rule);
		  
		Assertions.assertThrows(HttpStatusCodeException.class, () -> {
			searchService.searchATMLocations(zipcode);
		});

	}

		
}
