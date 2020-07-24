package io.digisic.bank.test.serenity.ui.steps;

import static org.junit.Assert.assertTrue;

import io.digisic.bank.test.serenity.ui.pom.RegisterUserPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class RegisterUserSteps extends ScenarioSteps{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3789953207057644675L;
	
	RegisterUserPage registerUserpage;
	
	@Step ("Navigate to Registration page")
	public void navigateToRegistrationPage () {
		registerUserpage.open();
	}
	
	@Step ("Select '{0}' for Title")
	public void selectTitle (String title) {
		registerUserpage.selectTitle(title);
	}
	
	@Step ("Enter '{0}' for First Name")
	public void enterFirstName (String firstName) {
		registerUserpage.enterFirstName(firstName);
	}
	
	@Step ("Enter '{0}' for Last Name")
	public void enterLastName (String lastName) {
		registerUserpage.enterLastName(lastName);
	}
	
	@Step ("Select '{0}' for Gender")
	public void selectGender (String gender) {
		registerUserpage.selectGender(gender);
	}
	
	@Step ("Enter '{0}' for Date of Birth")
	public void enterDateOfBirth (String dob) {
		registerUserpage.enterDateOfBirth(dob);
	}
	
	@Step ("Enter '{0}' for Social Security Number")
	public void enterSSN (String ssn) {
		registerUserpage.enterSSN(ssn);
	}
	
	@Step ("Enter '{0}' for Email Address")
	public void enterEmailAddress (String emailAddress) {
		registerUserpage.enterEmailAddress(emailAddress);
	}
	
	@Step ("Enter '{0}' for Password")
	public void enterPassword (String password) {
		registerUserpage.enterPassword(password);
	}
	
	@Step ("Enter '{0}' for Confirm Password")
	public void enterConfirmPassword (String confirmPassword) {
		registerUserpage.enterConfirmPassword(confirmPassword);
	}
	
	@Step ("Click Next Button")
	public void clickNextButton () {
		registerUserpage.clickNextButton();
	}
	
	@Step ("Assert user is on the Contact Details page")
	public void assertAtContactDetailsPage() {
		assertTrue (registerUserpage.atContactDetailsPage());
	}
	
	@Step ("Enter '{0}' for Address")
	public void enterAddress(String address) {
		registerUserpage.enterAddress(address);
	}
	
	@Step ("Enter '{0}' for Locality")
	public void enterLocality(String locality) {
		registerUserpage.enterLocality(locality);
	}
	
	@Step ("Enter '{0}' for Region")
	public void enterRegion(String region) {
		registerUserpage.enterRegion(region);
	}
	
	@Step ("Enter '{0}' for Postal Code")
	public void enterPostalCode(String postalCode) {
		registerUserpage.enterPostalCode(postalCode);
	}
	
	@Step ("Enter '{0}' for Country")
	public void enterCountry(String country) {
		registerUserpage.enterCountry(country);
	}
	
	@Step ("Enter '{0}' for Home Phone")
	public void enterHomePhone(String homePhone) {
		registerUserpage.enterHomePhone(homePhone);
	}
	
	@Step ("Enter '{0}' for Work Phone")
	public void enterWorkPhone(String workPhone) {
		registerUserpage.enterWorkPhone(workPhone);
	}
	
	@Step ("Enter '{0}' for Mobile Phone")
	public void enterMobilePhone(String mobilePhone) {
		registerUserpage.enterMobilePhone(mobilePhone);
	}
	
	@Step ("Select '{0}' for Agree to Terms and Policy")
	public void selectAgreeTerms(String terms) {
		
		if (terms.contains("True"))
			registerUserpage.selectTermsCheckbox();
	
	}
	
	@Step ("Click Register Button")
	public void clickRegisterButton () {
		registerUserpage.clickRegisterButton();
	}
	
	@Step ("Assert Success Message for Registration")
	public void assertSuccessMessage() {
		assertTrue(registerUserpage.successMessagePresent());
	}
	
	@Step ("Assert Error Message for Registration")
	public void assertErrorMessage() {
		assertTrue(registerUserpage.errorMessagePresent());
	}

}
