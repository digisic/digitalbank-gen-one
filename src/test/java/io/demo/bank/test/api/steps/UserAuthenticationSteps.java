package io.demo.bank.test.api.steps;

import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;

public class UserAuthenticationSteps {
	
	public String authToken;
	private final String password = "Demo123!";
	
	
	@Step("Authenticate '{0}' using email '{1}'")
	public void authenticateUser(String persona, String email) {
		
		SerenityRest.given()
					.queryParams("username", email)
					.queryParams("password", password)
					.contentType("application/json")
					.baseUri("http://localhost:8080")
					.basePath("/api/v1/auth")
					.when()
					.post()
					.then()
					.assertThat()
					.statusCode(200);
	}

}
