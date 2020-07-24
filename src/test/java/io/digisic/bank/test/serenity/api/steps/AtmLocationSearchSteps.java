package io.digisic.bank.test.serenity.api.steps;

import static org.junit.Assert.assertTrue;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;

public class AtmLocationSearchSteps {
	
	// Get the base URL from the environment
	private String baseURL = (System.getProperty("webdriver.base.url") != null) 
						   ? System.getProperty("webdriver.base.url")
						   : "http://localhost:8080";
	
	private String zipcode;
	
	
	@Step("Set zip code '{0}' into request")
	public void setZipcode (String zipcode) {
		this.zipcode = zipcode;
	}
	
	@Step("Submit Search request")
	public void submitRequest () {
		
		String authToken = SerenityRest.lastResponse().then().extract().jsonPath().getString("authToken");
		
		SerenityRest.given()
					.contentType("application/json")
					.header("Authorization", "Bearer " + authToken)
					.baseUri(baseURL)
					.basePath("/api/v1/search/atm")
					.params("zipcode", this.zipcode)
					.when()
					.get();
		
	}
	
	@Step("Assert response code is '{0}'")
	public void assertResponseCode (int responseCode) {
		SerenityRest.lastResponse()
					.then()
					.assertThat()
					.statusCode(responseCode);
	}
	
	@Step("Assert error message returned")
	public void assertResponseErrorMessage() {
		assertTrue(SerenityRest.lastResponse()
							   .then()
							   .extract()
							   .jsonPath()
							   .getString("message")
							   .length() > 0);
	}
	
	@Step ("Assert response contains a list of results")
	public void assertResponseResults () {
		assertTrue(SerenityRest.lastResponse()
							   .then()
							   .extract()
							   .jsonPath()
							   .getList("$")
							   .size() > 0);
	}
	
	@Step ("Assert response contains a list of results with a size of ")
	public void assertResponseResults (int size) {
		assertTrue(SerenityRest.lastResponse()
							   .then()
							   .extract()
							   .jsonPath()
							   .getList("$")
							   .size() == size);
	}
	
	@Step ("Assert response contains an empty list of results")
	public void assertResponseResultsEmpty () {
		assertTrue(SerenityRest.lastResponse()
				   			   .then()
				   			   .extract()
				   			   .jsonPath()
				   			   .getList("$")
				   			   .size() == 0);
	}

}
