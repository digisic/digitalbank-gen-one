package io.demo.bank;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.client.RestTemplateBuilder;
//import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@SpringBootApplication
public class DigitalBankApplication {
//used for war distribution
// public class DigitalBankApplication extends SpringBootServletInitializer {

	// used for jar distribution
	public static void main(String[] args) {
		SpringApplication.run(DigitalBankApplication.class, args);
	}


//Use this for building a war file distribution
/*	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(DigitalBankApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(DigitalBankApplication.class, args);
	}
*/
	
	@Bean
	public RestTemplate restTemplate(RestTemplateBuilder builder) {
		return builder.build();
	}
}
