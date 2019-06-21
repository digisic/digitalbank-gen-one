package io.demo.bank.test.api.steps;

import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;

public class UserAuthentication {
	
	public String authToken;
	
	
	@Step("Authenticate '{0}'")
	public void authenticateUser(String persona) {
		
		String username = "";
		String password = "";
		
		switch (persona) {
		case "Josh":
			username = "jsmith@demo.io";
			password = "Demo123!";
			break;
		
		case "Nicole":
			username = "nsmith@demo.io";
			password = "Demo123!";
			break;
		
		default:
			username = "jsmith@demo.io";
			password = "Demo123!";
			break;
		}
		
		SerenityRest.given()
					.queryParams("username", username)
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
