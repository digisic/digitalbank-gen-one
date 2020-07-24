package io.digisic.bank.test.serenity.ui.steps;

import static org.junit.Assert.assertTrue;

import io.digisic.bank.test.serenity.ui.pom.SearchLocationPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class SearchLocationSteps extends ScenarioSteps {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9051606394473590799L;
	
	SearchLocationPage searchLocationPage;
	
	
	@Step ("Navigate to Search dialog")
	public void navigateToSearch () {
		searchLocationPage.openSearchForm();;
	}
	
	@Step ("Enter Zip Code '{0}'")
	public void enterZipCode (String zipcode) {
		searchLocationPage.enterZipCode(zipcode);
	}
	
	@Step ("Validate required format error")
	public void validateFormatError () {
		assertTrue(searchLocationPage.validateRequiredFormatError());
	}
	
	@Step ("Validate returned results")
	public void validateResults () {
		assertTrue(searchLocationPage.resultsPresent());
	}
	
	@Step ("Validate returned zero results")
	public void validateNoResults () {
		assertTrue(searchLocationPage.zeroResultsMessagePresent());
	}

}
