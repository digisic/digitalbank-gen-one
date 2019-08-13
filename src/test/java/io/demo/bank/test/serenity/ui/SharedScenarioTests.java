package io.demo.bank.test.serenity.ui;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import io.demo.bank.test.serenity.common.steps.DataServiceSteps;
import io.demo.bank.test.serenity.ui.steps.LoginSteps;
import io.demo.bank.test.serenity.ui.steps.MenuNavigationSteps;
import net.thucydides.core.annotations.Steps;

public class SharedScenarioTests {
	
	// User Profile Menu Options
	private final static String UserProfileLogout = "Logout";
	private final static String UserProfileChangePassword = "Change Password";
	private final static String password = "Demo123!";
	
	@Steps
	private LoginSteps login;
	
	@Steps
	private MenuNavigationSteps menu;
	
	@Steps
	private DataServiceSteps data;
	
	/** Given **/
	
	@Given ("^(.*) is logged into the application with (.*)$")
	public void authenticatedUser(String persona, String email) {
		
		if (!data.validateRegisteredUser(persona, email))
			data.registerUser();
		
		// Login with the identified persona that can authenticate
		login.navigateToLoginPage();
		login.enterUsername(email);
		login.enterPassword(password);
		login.clickSubmit();
	}
	
	/** When **/
	
	@When ("^(.*) navigates to the User Profile menu$")
	public void clickUserProfileMenu(String persona) {
		menu.clickUserProfileMenu();
	}
	
	@And ("^they select '(.*)' from the User Profile menu$")
	public void clickUserProfileMenuOption(String option) {
		
		switch (option){
			case UserProfileLogout:
				menu.clickLogoutMenuOption();
				break;
			case UserProfileChangePassword:
				menu.clickChangePasswordMenuOption();
			default:
				// Do not assume a menu option
				break;
		}
		
	}
	
	@And ("^they verify they are at the Home page$")
	public void verifyLocationHomePage() {
		login.redirectedToHomePage();
	}

}
