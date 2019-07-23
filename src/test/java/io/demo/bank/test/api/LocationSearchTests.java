package io.demo.bank.test.api;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.demo.bank.test.api.steps.AtmLocationSearchSteps;
import io.demo.bank.test.api.steps.UserAuthentication;
import net.thucydides.core.annotations.Steps;

public class LocationSearchTests {
	
	@Steps
	UserAuthentication userAuthentication;
	
	@Steps
	AtmLocationSearchSteps searchSteps;
	
	
	@Given("^(.*) is authenticated into the API$")
	public void authenticateUser(String persona) {
		userAuthentication.authenticateUser(persona);
	}
	
	@When ("^(.*) populates the Search request with zipcode equal to '(.*)'$")
	public void setZipcode (String persona, String zipcode) {
		searchSteps.setZipcode(zipcode);
	}
	
	@And ("^he or she submits the Search request$")
	public void submitRequest () {
		searchSteps.submitRequest();
	}
	
	@Then ("^(.*) verifies the return code is '(.*)'")
	public void checkReturnCode (String persona, int responseCode) {
		searchSteps.assertResponseCode(responseCode);
	}
	
	@And ("^he or she verifies he or she is presented with a validation error message$")
	public void verifyErrorResponse () {
		searchSteps.assertResponseErrorMessage();
	}
	
	@And ("^he or she verifies he or she is presented with a list of results$")
	public void verifyResponseHasResults () {
		searchSteps.assertResponseResults();
	}
	
	@And ("^he or she verifies he or she is presented with a empty list$")
	public void verifyResponseHasEmptyResults () {
		searchSteps.assertResponseResultsEmpty();
	}

}
