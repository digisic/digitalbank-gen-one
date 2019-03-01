package io.demo.bank.test.definition;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.demo.bank.test.steps.RegisterUserSteps;
import net.thucydides.core.annotations.Steps;

public class RegisterUserTests {
	
	@Steps
	private RegisterUserSteps registerUser;
	
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
	
	@And("^he or she selects '(.*)' from the Title radio button$")
	public void selectsTitle (String title) {
		registerUser.selectTitle(title);
	}
	
	@And("^he or she enters '(.*)' into the First Name field$")
	public void entersFirstName (String firstName) {
		registerUser.enterFirstName(firstName);
	}
	
	@And("^he or she enters '(.*)' into the Last Name field$")
	public void entersLastName (String lastName) {
		registerUser.enterLastName(lastName);
	}
	
	@And("^he or she selects '(.*)' from the Gender radio button$")
	public void entersGender (String gender) {
		registerUser.selectGender(gender);
	}
	
	@And("^he or she enters '(.*)' into the Date of Birth field$")
	public void entersDateofBirth (String dob) {
		registerUser.enterDateOfBirth(dob);
	}
	
	@And("^he or she enters '(.*)' into the Social Security Number field$")
	public void entersSSN(String ssn) {
		registerUser.enterSSN(ssn);
	}
	
	@And("^he or she enters '(.*)' into the Email Address field$")
	public void entersEmailAddress(String emailAddress) {
		registerUser.enterEmailAddress(emailAddress);
	}
	
	@And("^he or she enters '(.*)' into the registration Password field$")
	public void entersPassword(String password) {
		registerUser.enterPassword(password);
	}
	
	@And("^he or she enters '(.*)' into the registration Confirm Password field$")
	public void entersConfirmPassword(String confirmPassword) {
		registerUser.enterConfirmPassword(confirmPassword);
	}
	
	@And("^he or she navigates to the Contact Details page$")
	public void clicksNext() {
		registerUser.clickNextButton();
	}
	
	@And("^he or she verifies he or she is the Contact Details page$")
	public void atContactDetialsPage() {
		registerUser.assertAtContactDetailsPage();
	}
	
	@And("^he or she enters '(.*)' into the registration Address field$")
	public void entersAddress(String address) {
		registerUser.enterAddress(address);
	}
	
	@And("^he or she enters '(.*)' into the registration Locality field$")
	public void entersLocality(String locality) {
		registerUser.enterLocality(locality);
	}
	
	@And("^he or she enters '(.*)' into the registration Region field$")
	public void entersRegion(String region) {
		registerUser.enterRegion(region);
	}
	
	@And("^he or she enters '(.*)' into the registration Postal Code field$")
	public void enterPostalCode(String postalCode) {
		registerUser.enterPostalCode(postalCode);
	}
	
	@And("^he or she enters '(.*)' into the registration Country field$")
	public void entersCountry(String country) {
		registerUser.enterCountry(country);
	}
	
	@And("^he or she enters '(.*)' into the registration Home Phone field$")
	public void entersHomePhone(String homePhone) {
		registerUser.enterHomePhone(homePhone);
	}
	
	@And("^he or she enters '(.*)' into the registration Work Phone field$")
	public void entersWorkPhone(String workPhone) {
		registerUser.enterWorkPhone(workPhone);
	}
	
	@And("^he or she enters '(.*)' into the registration Mobile Phone field$")
	public void entersMobilePhone(String mobilePhone) {
		registerUser.enterMobilePhone(mobilePhone);
	}
	
	@And("^he or she selects '(.*)' from the Agree to Terms and Policy checkbox$")
	public void selectsTerms(String terms) {
		registerUser.selectAgreeTerms(terms);
	}
	
	@And("^he or she submits the Registration request$")
	public void clicksRegister() {
		registerUser.clickRegisterButton();
	}
	
	/** Then **/
	@Then("^(.*) verifies he or she is presented with a Error Message indicating the field is required$")
	public void presenterErrorMessageForRequireField(String persona) {
		
	}
	
	@Then("^(.*) verifies he or she is presented with a Error Message indicating input value does not meet required format for the field$")
	public void presenterErrorMessageForRequireFormat(String persona) {
		
	}
	
	@Then("^(.*) verifies he or she is presented with a Error Message indicating the input value entered matches an existing Registered User Account")
	public void presenterErrorMessageForExistingAccount(String persona) {
		
	}
	
	@And("^he or she verifies he or she is presented with a Registration Success Message$")
	public void presentedSuccessMessage() {
		registerUser.assertSuccessMessage();
	}

}
