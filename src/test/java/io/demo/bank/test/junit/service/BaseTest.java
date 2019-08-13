package io.demo.bank.test.junit.service;

import org.junit.After;
import org.junit.Before;

public abstract class BaseTest {

    static final String KEYSTORE_PATH = BaseTest.class.getClassLoader()
            .getResource("keystore.jks").getPath();

    static final String KEYSTORE_PASSWORD = "password";

    @Before
    public void setUpAppKeystoreForTest() {
        System.setProperty("javax.net.ssl.trustStore", "src/test/resources/keystore.jks");
        System.setProperty("javax.net.ssl.trustStorePassword", "password");
    }
    @After
    public void resetKeystore() {
        System.clearProperty("javax.net.ssl.trustStore");
        System.clearProperty("javax.net.ssl.trustStorePassword");
    }

}