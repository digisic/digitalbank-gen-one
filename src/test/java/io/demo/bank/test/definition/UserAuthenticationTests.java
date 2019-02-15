package io.demo.bank.test.definition;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.demo.bank.test.steps.LoginSteps;
import net.thucydides.core.annotations.Steps;


public class UserAuthenticationTests {
	
	@Steps
	private LoginSteps login;
	
	@Given("I am at the Login page")
	public void userAtLoginPage () {
		login.navigateToLoginPage();
	}
	
	@When("I enter '(.*)' into the Username field")
	public void enterUserName (String username) {
		login.enterUsername (username);
	}
	
	@And("I enter '(.*)' into the Password field")
	public void enterPassword (String password){
		login.enterPassword (password);
	}
	
	@And("I click the Remember Me checkbox")
	public void clickRememberMe (){
		login.clickRememberMe();
	}
	
	@And("I click the Submit button")
	public void clickSubmit (){
		login.clickSubmit ();
	}
	
	@Then("I verify I am at the Home page")
	public void redirectToHomePage (){
		login.redirectedToHomePage();
	}
	
	@And("I verify the Remember Me cookie is not present")
	public void rememberMeNotPresent (){
		login.remeberMeCookieNotPresent();
	}
	
	@And("I verify the Remember Me cookie is present")
	public void rememberMeIsPresent (){
		login.remeberMeCookiePresent();
	}
	
	@Then("I verify I am presented with a Error Message$")
	public void presentedErrorMessage (){
		login.presentedErrorMessage();
	}
		
}
