package io.demo.bank.test.ui;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.demo.bank.test.ui.steps.LoginSteps;
import net.thucydides.core.annotations.Steps;


public class LoginUserTests {
	
	@Steps
	private LoginSteps login;
	
	/** Given **/
	@Given("^(.*) is a registered user$")
	public void registeredUser (String persona) {
		// TODO Data provisioning to get or define a registered user
		// for now, we will assume a default known user
	}
	
	@And("^he or she has an expired account$")
	public void expiredAccount (){
		// TODO Data provisioning to get or define user with this criteria
	}
	
	@And("^he or she has an account with expired credentials$")
	public void expiredAccountCredentials (){
		// TODO Data provisioning to get or define user with this criteria
	}
	
	@And("^he or she has a locked account$")
	public void lockedAccount (){
		// TODO Data provisioning to get or define user with this criteria
	}
	
	@And("^he or she has a disabled account$")
	public void disabledAccount (){

	}
	
	/** When **/
	@When("^(.*) navigates to the Login page$")
	public void userAtLoginPage (String persona) {
		login.navigateToLoginPage();
	}

	@When("^he or she enters '(.*)' into the login Username field$")
	public void enterUserName (String username) {
		login.enterUsername (username);
	}
	
	@And("^he or she enters '(.*)' into the login Password field$")
	public void enterPassword (String password){
		login.enterPassword (password);
	}
	
	@And("^he or she clicks the Remember Me checkbox$")
	public void clickRememberMe (){
		login.clickRememberMe();
	}
	
	@And("^he or she submits the login request$")
	public void clickSubmit (){
		login.clickSubmit ();
	}
	
	/** Then **/
	
	@Then("^(.*) verifies he or she is presented with a error message indicating invalid credentials or access denied$")
	public void presentedErrorMessage (String persona){
		login.presentedErrorMessage();
	}
	
	@Then("^(.*) verifies he or she is at the Home page$")
	public void redirectToHomePage (String persona){
		login.redirectedToHomePage();
	}
	
	@And("^he or she verifies the remember-me cookie is not present$")
	public void rememberMeNotPresent (){
		login.remeberMeCookieNotPresent();
	}
	
	@And("^he or she verifies the remember-me cookie is present$")
	public void rememberMeIsPresent (){
		login.remeberMeCookiePresent();
	}
	
	@And("^he or she verifies login (.*) contains (.*)$")
	public void fieldContainsValue (String field, String value){
		login.assertFieldContainsValue(field, value);
	}

		
}
