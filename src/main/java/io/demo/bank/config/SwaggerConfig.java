package io.demo.bank.config;

import java.util.Collections;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {
	
	@Bean
    public Docket api() { 
        return new Docket(DocumentationType.SWAGGER_2)  
          .select()                                  
          .apis(RequestHandlerSelectors.basePackage("io.demo.bank.controller.rest"))              
          .paths(PathSelectors.regex("/api.*"))
          .build()
          .apiInfo(apiInfo());
    }
	
	private ApiInfo apiInfo() {
		ApiInfo apiInfo = new ApiInfo ("Digital Bank API",
									   "Digial Bank API provides Administration and User functionality through API Endpoints.",
									   "API TOS",
									   "Terms of Service",
									   new Contact("Digital Bank",
											       "www.demo.io", 
											       "digitalbank@demo.io"),
									   "License of API",
									   "API License URL",
									   Collections.emptyList());
		return apiInfo;
	}
	

}
