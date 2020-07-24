package io.digisic.bank.test.junit.search;

import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class BaseTest {
	
	private static final Logger LOG = LoggerFactory.getLogger(BaseTest.class);
	private static final EnvironmentVariables ENV = SystemEnvironmentVariables.createEnvironmentVariables();
	
	// CodeSV Java Key Store Properties
	protected static final String KEYSTORE_PATH = BaseTest.class.getClassLoader().getResource("keystore.jks").getPath();
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