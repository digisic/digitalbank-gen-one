package io.digisic.bank.config;

import javax.net.ssl.SSLContext;

import org.apache.http.client.HttpClient;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContextBuilder;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.util.ResourceUtils;
import org.springframework.web.client.RestTemplate;

@Configuration
public class RestClientCertificateConfig {
	
	private static String DIGITAL_CREDIT_KEYSTORE="classpath:keystore/digisic.p12";
	private static String DIGITAL_CREDIT_KEYSTORE_PASS="digisic";
	
	@Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder) throws Exception {

        SSLContext sslContext = SSLContextBuilder
                .create()
                .loadKeyMaterial(ResourceUtils.getFile(DIGITAL_CREDIT_KEYSTORE), DIGITAL_CREDIT_KEYSTORE_PASS.toCharArray(), DIGITAL_CREDIT_KEYSTORE_PASS.toCharArray())
                .loadTrustMaterial(ResourceUtils.getFile(DIGITAL_CREDIT_KEYSTORE), DIGITAL_CREDIT_KEYSTORE_PASS.toCharArray())
                
                .build();
        
        SSLConnectionSocketFactory csf = new SSLConnectionSocketFactory(sslContext, NoopHostnameVerifier.INSTANCE);

        HttpClient client = HttpClients.custom()
        		.setSSLSocketFactory(csf).build();

        return builder
                .requestFactory(() -> new HttpComponentsClientHttpRequestFactory(client))
                .build();
    }

}
