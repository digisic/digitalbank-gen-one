package io.demo.bank.test.junit;

import org.junit.After;
import org.junit.Before;
import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;

public abstract class BaseTest {
	
	//private static final Logger LOG = LoggerFactory.getLogger(BaseTest.class);
	private static final EnvironmentVariables ENV = SystemEnvironmentVariables.createEnvironmentVariables();
	
	// CodeSV Java Keystore Properties
	protected static final String KEYSTORE_PATH = BaseTest.class.getClassLoader().getResource("keystore.jks").getPath();
    protected static final String KEYSTORE_PASSWORD = "password";
    protected static final String TLS = "TLS";
    
    
    // BlazeMeter Platform Properties
    protected static final String BLAZEMETER_TRN_REPO_URI = ENV.getProperty("blazemeter.trans.repo.uri", "https://mock.blazemeter.com");
    protected static final String BLAZEMETER_API_KEY = ENV.getProperty("blazemeter.api.key", "");
    protected static final String BLAZEMETER_API_SECRET = ENV.getProperty("blazemeter.api.secret", "");
    protected static final String BLAZEMETER_WORKSPACE = ENV.getProperty("blazemeter.workspace.name", "");
    
    @Before
    public void setUpAppKeystoreForTest() {        
        System.setProperty("javax.net.ssl.trustStore", KEYSTORE_PATH);
        System.setProperty("javax.net.ssl.trustStorePassword", KEYSTORE_PASSWORD);
    }
    
    @After
    public void resetKeystore() {
        System.clearProperty("javax.net.ssl.trustStore");
        System.clearProperty("javax.net.ssl.trustStorePassword");
    }
}