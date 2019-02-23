package io.demo.bank.test.definition;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.demo.bank.test.steps.LoginSteps;
import net.thucydides.core.annotations.Steps;


public class LoginUserTests {
	
	@Steps
	private LoginSteps login;
	
	/** Given **/
	@Given("^I am a Registered User$")
	public void registeredUser () {
		// TODO Data provisioning to get or define a registered user
		// for now, we will assume a default known user
	}
	
	@And("^I am at the Login page$")
	public void userAtLoginPage () {
		login.navigateToLoginPage();
	}
	
	/** When **/
	
	@When("^I enter '(.*)' into the Username field$")
	public void enterUserName (String username) {
		login.enterUsername (username);
	}
	
	@And("^I enter '(.*)' into the Password field$")
	public void enterPassword (String password){
		login.enterPassword (password);
	}
	
	@And("^I click the Remember Me checkbox$")
	public void clickRememberMe (){
		login.clickRememberMe();
	}
	
	@And("^I click the Submit button$")
	public void clickSubmit (){
		login.clickSubmit ();
	}
	
	/** Then **/
	
	@Then("^I verify I am presented with a Error Message$")
	public void presentedErrorMessage (){
		login.presentedErrorMessage();
	}
	
	@Then("^I verify I am at the Home page$")
	public void redirectToHomePage (){
		login.redirectedToHomePage();
	}
	
	@And("^I verify the Remember Me Cookie is not present$")
	public void rememberMeNotPresent (){
		login.remeberMeCookieNotPresent();
	}
	
	@And("^I verify the Remember Me Cookie is present$")
	public void rememberMeIsPresent (){
		login.remeberMeCookiePresent();
	}
		
}
