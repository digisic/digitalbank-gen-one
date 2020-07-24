package io.digisic.bank.test.serenity.ui.pom;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;

@DefaultUrl ("http://localhost:8080/login")
public class LoginPage extends PageObject{
	
	@FindBy(id="username")
	private WebElementFacade userField;
	
	@FindBy(id="password")
	private WebElementFacade passwordField;
	
	@FindBy(id="remember-me")
	private WebElementFacade rememberMeCheckBox;
	
	@FindBy(id="submit")
	private WebElementFacade submitButton;
	
	@FindBy(tagName="form")
	private WebElementFacade loginForm;
	
	@FindBy(className="alert-danger")
	private WebElementFacade errorMessage;
	
	@FindBy(className="alert-success")
	private WebElementFacade successMessage;
	

	private static String rememberMeCookie = "remember-me";
	
	
	public void enterUsername (String username) {
		userField.type(username);
	}
	
	public void enterPassword (String password) {
		passwordField.type(password);
	}
	
	public void clickRememberMe () {
		rememberMeCheckBox.click();
	}
	
	public void clickSubmit() {
		submitButton.click();
	}
	
	public boolean errorMessagePresent () {
		return errorMessage.isPresent();
	}
	
	public boolean successMessagePresent () {
		return successMessage.isPresent();
	}
	
	public boolean cookiePresent() {
		 
		if (getDriver().manage().getCookieNamed(rememberMeCookie) != null)
			return true;
		else
			return false;
	}
	
	public boolean atLoginPage() {
		return loginForm.getAttribute("action").contains("/login");
	}
	
	public boolean fieldContainsValue (String field, String value) {
		
		switch (field) {
			case "Username":
				return userField.containsValue(value);
			case "Password":
				return passwordField.containsValue(value);
			default:
				return false;
				
		}
	}

}
