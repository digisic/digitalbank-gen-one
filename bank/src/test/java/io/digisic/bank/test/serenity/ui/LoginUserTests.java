package io.digisic.bank.test.serenity.ui;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.digisic.bank.test.serenity.common.TestDataService;
import io.digisic.bank.test.serenity.ui.steps.LoginSteps;
import net.thucydides.core.annotations.Steps;


public class LoginUserTests {
	
	@Steps
	private LoginSteps login;
	
	@Steps
	private TestDataService data;
	
	/** Given **/
	@Given("^(.*) is a registered user with email address (.*)$")
	public void registeredUser (String persona, String email) {
		
		if (!data.validateRegisteredUser(persona, email))
			data.registerUser();
	}
	
	@And("^they have an expired account$")
	public void expiredAccount (){
		data.expireUserAccount();	
	}
	
	@And("^they have an account with expired credentials$")
	public void expiredAccountCredentials (){
		data.expireUserCredentials();
	}
	
	@And("^they have a locked account$")
	public void lockedAccount (){
		data.lockUserAccount();
	}
	
	@And("^they have a disabled account$")
	public void disabledAccount (){
		data.disableUserAccount();
	}
	
	/** When **/
	@When("^(.*) navigates to the Login page$")
	public void userAtLoginPage (String persona) {
		login.navigateToLoginPage();
	}

	@When("^they enter '(.*)' into the login Username field$")
	public void enterUserName (String username) {
		login.enterUsername (username);
	}
	
	@And("^they enter '(.*)' into the login Password field$")
	public void enterPassword (String password){
		login.enterPassword (password);
	}
	
	@And("^they click the Remember Me checkbox$")
	public void clickRememberMe (){
		login.clickRememberMe();
	}
	
	@And("^they submit the login request$")
	public void clickSubmit (){
		login.clickSubmit ();
	}
	
	/** Then **/
	
	@Then("^(.*) verifies they are presented with a error message indicating invalid credentials or access denied$")
	public void presentedErrorMessage (String persona){
		login.presentedErrorMessage();
	}
	
	@Then("^(.*) verifies they are at the Home page$")
	public void redirectToHomePage (String persona){
		login.redirectedToHomePage();
	}
	
	@And("^they verify the remember-me cookie is not present$")
	public void rememberMeNotPresent (){
		login.remeberMeCookieNotPresent();
	}
	
	@And("^they verify the remember-me cookie is present$")
	public void rememberMeIsPresent (){
		login.remeberMeCookiePresent();
	}
	
	@And("^they verify login (.*) contains (.*)$")
	public void fieldContainsValue (String field, String value){
		login.assertFieldContainsValue(field, value);
	}

		
}
