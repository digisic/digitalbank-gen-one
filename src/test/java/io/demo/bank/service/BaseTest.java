package io.demo.bank.service;

public abstract class BaseTest {

    static final String KEYSTORE_PATH = BaseTest.class.getClassLoader()
            .getResource("keystore.jks").getPath();

    static final String KEYSTORE_PASSWORD = "password";

    public static void setUpAppKeystoreForTest() {
        System.setProperty("javax.net.ssl.trustStore","src/test/resources/keystore.jks");
        System.setProperty("javax.net.ssl.trustStorePassword", "password");
    }

}