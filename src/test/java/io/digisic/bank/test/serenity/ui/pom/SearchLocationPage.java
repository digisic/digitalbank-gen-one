package io.digisic.bank.test.serenity.ui.pom;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;

@DefaultUrl("http://localhost:8080/home")
public class SearchLocationPage extends PageObject {
	
	
	@FindBy(id="searchLocations")
	private WebElementFacade searchButton;
	
	@FindBy(id="zipcode")
	private WebElementFacade zipcodeField;
	
	@FindBy(id="submit")
	private WebElementFacade submitButton;
	
	@FindBy(id="atm_map")
	private WebElementFacade mapLink;
	
	@FindBy(className="alert-success")
	private WebElementFacade successMessage;
	
	public void openSearchForm () {
		searchButton.click();
	
	}
	
	public void enterZipCode (String zipcode) {
		zipcodeField.typeAndEnter(zipcode);
	}
	
	public void submitSearch() {
		submitButton.submit();
	}
	
	public boolean validateRequiredFormatError() {
		if (zipcodeField.getAttribute("required") != null)
			return true;
		else
			return false;
	}
	
	public boolean zeroResultsMessagePresent() {
		return successMessage.isPresent();
	}

	public boolean resultsPresent() {
		return mapLink.isPresent();
	}
}
