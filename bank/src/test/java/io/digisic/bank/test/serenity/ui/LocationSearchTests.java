package io.digisic.bank.test.serenity.ui;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.digisic.bank.test.serenity.ui.steps.SearchLocationSteps;
import net.thucydides.core.annotations.Steps;

public class LocationSearchTests {
	
	@Steps
	private SearchLocationSteps	searchLocationSteps;
	
	@When ("^(.*) navigates to the Search page$")
	public void navigateToSearch (String persona) {
		searchLocationSteps.navigateToSearch();;
	}
	
	@And ("^they enter '(.*)' into the Zip Code field$")
	public void enterZipCode (String zipcode) {
		searchLocationSteps.enterZipCode(zipcode);;
	}
	
	@Then ("^(.*) verifies they are presented with a validation error message$")
	public void validateErrorMessage (String persona) {
		searchLocationSteps.validateFormatError();;
	}
	
	@Then ("^(.*) verifies they are presented with a list of results$")
	public void validateResults (String persona) {
		searchLocationSteps.validateResults();;
	}
	
	@Then ("^(.*) verifies they are presented with a message indicating zero results$")
	public void validateNoResults (String persona) {
		searchLocationSteps.validateNoResults();;
	}

}
