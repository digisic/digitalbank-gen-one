package io.digisic.bank.test.serenity.ui;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.digisic.bank.test.serenity.common.TestDataService;
import io.digisic.bank.test.serenity.ui.steps.RegisterUserSteps;
import net.thucydides.core.annotations.Steps;

public class RegisterUserTests {
	
	@Steps
	private RegisterUserSteps registerUser;
	
	@Steps
	private TestDataService data;
	
	/** Given **/
	@Given("^(.*) is a new customer")
	public void registeredUser (String persona) {
		// TODO Determine whether we need to do anything specific for a new customer
	}
	
	/** When **/
	@When("^(.*) navigates to the Registration page$")
	public void userNavigatesToRegistrationPage (String persona) {
		registerUser.navigateToRegistrationPage();
	}
	
	@And("^they select '(.*)' from the Title radio button$")
	public void selectsTitle (String title) {
		registerUser.selectTitle(title);
	}
	
	@And("^they enter '(.*)' into the First Name field$")
	public void entersFirstName (String firstName) {
		registerUser.enterFirstName(firstName);
	}
	
	@And("^they enter '(.*)' into the Last Name field$")
	public void entersLastName (String lastName) {
		registerUser.enterLastName(lastName);
	}
	
	@And("^they select '(.*)' from the Gender radio button$")
	public void entersGender (String gender) {
		registerUser.selectGender(gender);
	}
	
	@And("^they enter '(.*)' into the Date of Birth field$")
	public void entersDateofBirth (String dob) {
		registerUser.enterDateOfBirth(dob);
	}
	
	@And("^they enter '(.*)' into the Social Security Number field$")
	public void entersSSN(String ssn) {
		
		if (ssn.equals("existing")) {
			ssn = data.getExistingSsn();
		}
		registerUser.enterSSN(ssn);
	}
	
	@And("^they enter '(.*)' into the Email Address field$")
	public void entersEmailAddress(String emailAddress) {
		
		if (emailAddress.equals("existing")) {
			emailAddress = data.getExistingEmail();
		}
		registerUser.enterEmailAddress(emailAddress);
	}
	
	@And("^they enter '(.*)' into the registration Password field$")
	public void entersPassword(String password) {
		registerUser.enterPassword(password);
	}
	
	@And("^they enter '(.*)' into the registration Confirm Password field$")
	public void entersConfirmPassword(String confirmPassword) {
		registerUser.enterConfirmPassword(confirmPassword);
	}
	
	@And("^they navigate to the Contact Details page$")
	public void clicksNext() {
		registerUser.clickNextButton();
	}
	
	@And("^they verify they are at the Contact Details page$")
	public void atContactDetialsPage() {
		registerUser.assertAtContactDetailsPage();
	}
	
	@And("^they enter '(.*)' into the registration Address field$")
	public void entersAddress(String address) {
		registerUser.enterAddress(address);
	}
	
	@And("^they enter '(.*)' into the registration Locality field$")
	public void entersLocality(String locality) {
		registerUser.enterLocality(locality);
	}
	
	@And("^they enter '(.*)' into the registration Region field$")
	public void entersRegion(String region) {
		registerUser.enterRegion(region);
	}
	
	@And("^they enter '(.*)' into the registration Postal Code field$")
	public void enterPostalCode(String postalCode) {
		registerUser.enterPostalCode(postalCode);
	}
	
	@And("^they enter '(.*)' into the registration Country field$")
	public void entersCountry(String country) {
		registerUser.enterCountry(country);
	}
	
	@And("^they enter '(.*)' into the registration Home Phone field$")
	public void entersHomePhone(String homePhone) {
		registerUser.enterHomePhone(homePhone);
	}
	
	@And("^they enter '(.*)' into the registration Work Phone field$")
	public void entersWorkPhone(String workPhone) {
		registerUser.enterWorkPhone(workPhone);
	}
	
	@And("^they enter '(.*)' into the registration Mobile Phone field$")
	public void entersMobilePhone(String mobilePhone) {
		registerUser.enterMobilePhone(mobilePhone);
	}
	
	@And("^they select '(.*)' from the Agree to Terms and Policy checkbox$")
	public void selectsTerms(String terms) {
		registerUser.selectAgreeTerms(terms);
	}
	
	@And("^they submit the Registration request$")
	public void clicksRegister() {
		registerUser.clickRegisterButton();
	}
	
	/** Then **/
	@Then("^(.*) verifies they are presented with a Error Message indicating the field is required$")
	public void presenterErrorMessageForRequireField(String persona) {
		// TODO:  Need to determine an efficient strategy for asserting the specific field is required
	}
	
	@Then("^(.*) verifies they are presented with a Error Message indicating input value does not meet required format for the field$")
	public void presenterErrorMessageForRequireFormat(String persona) {
		// TODO:  Need to determine an efficient strategy for asserting the specific field has required format
	}
	
	@Then("^(.*) verifies they are presented with a Error Message indicating the input value entered matches an existing Registered User Account")
	public void presenterErrorMessageForExistingAccount(String persona) {
		registerUser.assertErrorMessage();
	}
	
	@And("^they verify they are presented with a Registration Success Message$")
	public void presentedSuccessMessage() {
		registerUser.assertSuccessMessage();
	}

}
