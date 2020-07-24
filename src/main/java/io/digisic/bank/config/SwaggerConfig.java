package io.digisic.bank.config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.digisic.bank.util.Constants;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.ApiKey;
import springfox.documentation.service.AuthorizationScope;
import springfox.documentation.service.Contact;
import springfox.documentation.service.SecurityReference;
import springfox.documentation.service.SecurityScheme;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
public class SwaggerConfig {
	
	private static String JWT_TOKEN_REF	= "Bearer %token";
	private static String API_REGEX_PATH = "/api.*";
	
	@Bean
    public Docket api() { 
		
		List<SecurityScheme> schemeList = new ArrayList<>();
		schemeList.add(new ApiKey(JWT_TOKEN_REF, Constants.API_AUTH_HEADER, "Header"));
		
        return new Docket(DocumentationType.SWAGGER_2)  
          .select()                                  
          .apis(RequestHandlerSelectors.basePackage("io.digisic.bank.controller"))              
          .paths(PathSelectors.regex(API_REGEX_PATH))
          .build()
          .apiInfo(apiInfo())
          .securitySchemes(schemeList)
          .securityContexts(Arrays.asList(securityContext()));
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
	
	private SecurityContext securityContext() {		
	    return SecurityContext.builder()
	      .securityReferences(
	        Arrays.asList(new SecurityReference(JWT_TOKEN_REF, new AuthorizationScope[0])))
	      .forPaths(PathSelectors.regex(API_REGEX_PATH))
	      .build();
	}
	

}
