package io.demo.bank.test.definition;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.demo.bank.test.steps.SearchLocationSteps;
import net.thucydides.core.annotations.Steps;

public class SearchLocationsTests {
	
	@Steps
	private SearchLocationSteps	searchLocationSteps;
	
	@When ("^(.*) navigates to the Search page$")
	public void navigateToSearch (String persona) {
		searchLocationSteps.navigateToSearch();;
	}
	
	@And ("^he or she enters '(.*)' into the Zip Code field$")
	public void enterZipCode (String zipcode) {
		searchLocationSteps.enterZipCode(zipcode);;
	}
	
	@Then ("^(.*) verifies he or she is presented with a validation error message$")
	public void validateErrorMessage (String persona) {
		searchLocationSteps.validateFormatError();;
	}
	
	@Then ("^(.*) verifies he or she is presented with a list of results$")
	public void validateResults (String persona) {
		searchLocationSteps.validateResults();;
	}
	
	@Then ("^(.*) verifies he or she is presented with a message indicating zero results$")
	public void validateNoResults (String persona) {
		searchLocationSteps.validateNoResults();;
	}

}
