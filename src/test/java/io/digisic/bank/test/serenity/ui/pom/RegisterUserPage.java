package io.digisic.bank.test.serenity.ui.pom;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;

@DefaultUrl ("http://localhost:8080/signup")
public class RegisterUserPage extends PageObject{
	
	@FindBy(id="title")
	private WebElementFacade titleField;
	
	@FindBy(id="firstName")
	private WebElementFacade firstNameField;
	
	@FindBy(id="lastName")
	private WebElementFacade lastNameField;
	
	@FindBy(id="dob")
	private WebElementFacade dobField;

	@FindBy(id="ssn")
	private WebElementFacade ssnField;
	
	@FindBy(id="emailAddress")
	private WebElementFacade emailAddressField;
	
	@FindBy(id="password")
	private WebElementFacade passwordField;
	
	@FindBy(id="confirmPassword")
	private WebElementFacade confirmPasswordField;
	
	@FindBy(id="address")
	private WebElementFacade addressField;
	
	@FindBy(id="locality")
	private WebElementFacade localityField;
	
	@FindBy(id="region")
	private WebElementFacade regionField;
	
	@FindBy(id="postalCode")
	private WebElementFacade postalCodeField;
	
	@FindBy(id="country")
	private WebElementFacade countryField;
	
	@FindBy(id="homePhone")
	private WebElementFacade homePhoneField;
	
	@FindBy(id="workPhone")
	private WebElementFacade workPhoneField;
	
	@FindBy(id="mobilePhone")
	private WebElementFacade mobilePhoneField;
	
	@FindBy(id="agree-terms")
	private WebElementFacade termsCheckbox;
	
	@FindBy(tagName="button")
	private WebElementFacade nextButton;
	
	@FindBy(tagName="button")
	private WebElementFacade registerButton;
	
	@FindBy(tagName="form")
	private WebElementFacade registerForm;
	
	@FindBy(className="alert-success")
	private WebElementFacade successMessage;
	
	@FindBy(className="alert-danger")
	private WebElementFacade errorMessage;
	
	public void selectTitle (String title) {
		titleField.selectByValue(title);
	}
	
	public void enterFirstName (String firstName) {
		firstNameField.type(firstName);
	}
	
	public void enterLastName (String lastName) {
		lastNameField.type(lastName);
	}
	
	public void selectGender (String gender) {
		
		List<WebElement> options = getDriver().findElements(By.id("gender"));
		
		for (WebElement option : options) {
			if (option.getAttribute("value").contains(gender))
				option.click();
		}
		
	}
	
	public void enterDateOfBirth (String dob) {
		dobField.type(dob);
	}
	
	public void enterSSN (String ssn) {
		ssnField.type(ssn);
	}
	
	public void enterEmailAddress (String emailAddress) {
		emailAddressField.type(emailAddress);
	}
	
	public void enterPassword (String password) {
		passwordField.type(password);
	}
	
	public void enterConfirmPassword (String confirmPassword) {
		confirmPasswordField.type(confirmPassword);
	}
	
	public void enterAddress (String address) {
		addressField.type(address);
	}
	
	public void enterLocality (String locality) {
		localityField.type(locality);
	}
	
	public void enterRegion (String region) {
		regionField.type(region);
	}
	
	public void enterPostalCode (String postalCode) {
		postalCodeField.type(postalCode);
	}
	
	public void enterCountry (String country) {
		countryField.type(country);
	}
	
	public void enterHomePhone (String homePhone) {
		homePhoneField.type(homePhone);
	}
	
	public void enterWorkPhone (String workPhone) {
		workPhoneField.type(workPhone);
	}
	
	public void enterMobilePhone (String mobilePhone) {
		mobilePhoneField.type(mobilePhone);
	}
	
	public void selectTermsCheckbox () {
		termsCheckbox.click();
	}
	
	public void clickNextButton () {
		nextButton.click();
	}
	
	public void clickRegisterButton () {
		registerButton.click();
	}
	
	public boolean atContactDetailsPage() {
		return registerForm.getAttribute("action").contains("/register");
	}
	
	public boolean successMessagePresent() {
		return successMessage.isPresent();
	}
	
	public boolean errorMessagePresent() {
		return errorMessage.isPresent();
	}
	
	public boolean confirmPasswordRequired() {
		if (confirmPasswordField.getAttribute("required") != null)
			return true;
		else
			return false;
	}

}
