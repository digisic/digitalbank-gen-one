package io.digisic.bank.test.serenity.api;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.digisic.bank.test.serenity.api.steps.AtmLocationSearchSteps;
import io.digisic.bank.test.serenity.api.steps.UserAuthenticationSteps;
import io.digisic.bank.test.serenity.common.TestDataService;
import net.thucydides.core.annotations.Steps;

public class LocationSearchTests {
	
	@Steps
	UserAuthenticationSteps userAuthentication;
	
	@Steps
	AtmLocationSearchSteps searchSteps;
	
	@Steps
	private TestDataService data;
	
	
	@Given("^(.*) is authenticated into the API with email (.*)$")
	public void authenticateUser(String persona, String email) {
		
		if (!data.validateRegisteredUser(persona, email))
			data.registerUser();
			
		userAuthentication.authenticateUser(persona, email);
	}
	
	@When ("^(.*) populates the Search request with zipcode equal to '(.*)'$")
	public void setZipcode (String persona, String zipcode) {
		searchSteps.setZipcode(zipcode);
	}
	
	@And ("^they submit the Search request$")
	public void submitRequest () {
		searchSteps.submitRequest();
	}
	
	@Then ("^(.*) verifies the return code is '(.*)'")
	public void checkReturnCode (String persona, int responseCode) {
		searchSteps.assertResponseCode(responseCode);
	}
	
	@And ("^they verify they are presented with a validation error message$")
	public void verifyErrorResponse () {
		searchSteps.assertResponseErrorMessage();
	}
	
	@And ("^they verify they are presented with a list of results$")
	public void verifyResponseHasResults () {
		searchSteps.assertResponseResults();
	}
	
	@And ("^they verify they are presented with a empty list$")
	public void verifyResponseHasEmptyResults () {
		searchSteps.assertResponseResultsEmpty();
	}

}
