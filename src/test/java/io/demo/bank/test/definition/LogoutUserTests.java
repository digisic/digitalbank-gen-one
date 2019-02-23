package io.demo.bank.test.definition;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import io.demo.bank.test.steps.LoginSteps;
import io.demo.bank.test.steps.LogoutSteps;
import net.thucydides.core.annotations.Steps;


public class LogoutUserTests {
	
	@Steps
	private LogoutSteps logout;
	
	@Steps
	private LoginSteps login;
	
	/** Given **/
	
	@Given ("^I am an Authenticated User$")
	public void authenticatedUser() {
		// TODO determine best way to dynamically determine user 
		// to use for testing Logout scenarios
		
		String username = "jsmith@demo.io";
		String password = "Demo123!";
		
		// Login with a valid user that can authenticate
		login.navigateToLoginPage();
		login.enterUsername(username);
		login.enterPassword(password);
		login.clickSubmit();
	}
	
	@And ("^I am at the Home page$")
	public void atHomePage() {
		login.redirectedToHomePage();
	}
	
	@When ("^I click the User Profile menu$")
	public void clickUserProfileMenu() {
		logout.clickUserProfileMenu();
	}
	
	@And ("^I click the Logout menu option$")
	public void clickLogoutMenuOption() {
		logout.clickLogoutMenuOption();
	}

	
	@And ("^I verify I am at the Login page$")
	public void redirectedToLoginPage() {
		logout.redirectedToLoginPage();
	}
	
	@And ("^I verify I am presented with a Logout Success Message$")
	public void presentedSuccessMessage() {
		logout.presentedSuccessMessage();
	}
	
}
