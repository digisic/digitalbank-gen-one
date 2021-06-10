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
import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;


@SpringBootTest
@ContextConfiguration(classes = SearchService.class)
@ExtendWith(SpringExtension.class)
@ExtendWith(VirtualServerResolver.class)
public class AtmLocationSearchTrnxRepoTest {
	
	private static final Logger LOG = LoggerFactory.getLogger(AtmLocationSearchTrnxRepoTest.class);
	private static final EnvironmentVariables ENV = SystemEnvironmentVariables.createEnvironmentVariables();
	
	// CodeSV Java Key Store Properties
	protected static final String KEYSTORE_PATH = AtmLocationSearchTrnxRepoTest.class.getClassLoader().getResource("keystore.jks").getPath();
    protected static final String KEYSTORE_PASSWORD = "password";
    protected static final String TLS = "TLS";
    
    
    // BlazeMeter Platform Properties
    protected static final String BLAZEMETER_TRN_REPO_URI = ENV.getProperty("blazemeter.trans.repo.uri", "https://mock.blazemeter.com");
    protected static final String BLAZEMETER_API_KEY = ENV.getProperty("blazemeter.api.key", "");
    protected static final String BLAZEMETER_API_SECRET = ENV.getProperty("blazemeter.api.secret", "");
    protected static final String BLAZEMETER_WORKSPACE = ENV.getProperty("blazemeter.workspace.name", "");
    
    // BlazeMeter Mock Services Transactions
    protected static final String BLAZEMETER_TRN_SVC_NAME = "ATM Search By Zip Code";
    protected static final String BLAZEMETER_TRN_NAME_POSITIVE = "ATM Search 11749 With 2 Results";
    protected static final String BLAZEMETER_TRN_NAME_ZERO = "ATM Search 12345 With Zero Results";
    protected static final String BLAZEMETER_TRN_NAME_NO_SVC = "ATM Search 54321 With Service Unavailable";

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
	
	/*
     * Configure Key Store for Tests
     */
    public static void setUpAppKeystoreForTest() {	
        System.setProperty("javax.net.ssl.trustStore", KEYSTORE_PATH);
        System.setProperty("javax.net.ssl.trustStorePassword", KEYSTORE_PASSWORD);
    }
    
    /*
     * Clear configuration
     */
    public static void resetKeystore() {
        System.clearProperty("javax.net.ssl.trustStore");
        System.clearProperty("javax.net.ssl.trustStorePassword");
    }
    
    /*
     * Check to BlazeMeter Connection Provided
     */
    public static boolean connectionDetailProvided() {
    	
    	LOG.debug("BLAZEMETER_TRN_REPO_URI (length): " + BLAZEMETER_TRN_REPO_URI.length());
    	LOG.debug("BLAZEMETER_TRN_REPO_URI: " + BLAZEMETER_TRN_REPO_URI);
    	LOG.debug("BLAZEMETER_API_KEY (length): " + BLAZEMETER_API_KEY.length());
    	LOG.debug("BLAZEMETER_API_KEY: " + BLAZEMETER_API_KEY);
    	LOG.debug("BLAZEMETER_API_SECRET (length): " + BLAZEMETER_API_SECRET.length());
    	LOG.debug("BLAZEMETER_API_SECRET: " + BLAZEMETER_API_SECRET);
    	LOG.debug("BLAZEMETER_WORKSPACE (length): " + BLAZEMETER_WORKSPACE.length());
    	LOG.debug("BLAZEMETER_WORKSPACE: " + BLAZEMETER_WORKSPACE);
    	
    	if (BLAZEMETER_TRN_REPO_URI.isEmpty() ||
    		BLAZEMETER_API_KEY.isEmpty() ||
    		BLAZEMETER_API_SECRET.isEmpty() ||
    		BLAZEMETER_WORKSPACE.isEmpty()) {
    		
    		LOG.error("Connection Details for Cloud Transaction Repository have not been provided.");
    		
    		return false;
    	}
    	else
    		return true;
    }

		
}
