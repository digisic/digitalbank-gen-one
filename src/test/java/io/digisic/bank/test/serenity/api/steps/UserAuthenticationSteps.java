package io.digisic.bank.test.serenity.api.steps;

import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;

public class UserAuthenticationSteps {
	
	// Get the base URL from the environment
	private String baseURL = (System.getProperty("webdriver.base.url") != null) 
						   ? System.getProperty("webdriver.base.url")
						   : "http://localhost:8080";
	
	public String authToken;
	private final String password = "Demo123!";
	
	
	@Step("Authenticate '{0}' using email '{1}'")
	public void authenticateUser(String persona, String email) {
		
		SerenityRest.given()
					.queryParams("username", email)
					.queryParams("password", password)
					.contentType("application/json")
					.baseUri(baseURL)
					.basePath("/api/v1/auth")
					.when()
					.post()
					.then()
					.assertThat()
					.statusCode(200);
	}

}
