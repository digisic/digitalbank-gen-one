package io.demo.bank.test.definition;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import io.demo.bank.test.steps.LoginSteps;
import io.demo.bank.test.steps.MenuNavigationSteps;
import net.thucydides.core.annotations.Steps;

public class CommonTests {
	
	// User Profile Menu Options
	private final static String UserProfileLogout = "Logout";
	private final static String UserProfileChangePassword = "Change Password";
	
	@Steps
	private LoginSteps login;
	
	@Steps
	private MenuNavigationSteps menu;
	
	/** Given **/
	
	@Given ("^(.*) is logged into the application$")
	public void authenticatedUser(String persona) {
		// TODO determine best way to dynamically determine user 
		// to use for testing Logout scenarios
		
		
		String username;
		String password;
		
		switch (persona) {
			case "Josh":
				username = "jsmith@demo.io";
				password = "Demo123!";
				break;
			
			case "Nicole":
				username = "nsmith@demo.io";
				password = "Demo123!";
				break;
			
			default:
				username = "jsmith@demo.io";
				password = "Demo123!";
				break;
		}
		
		
		// Login with the identified persona that can authenticate
		login.navigateToLoginPage();
		login.enterUsername(username);
		login.enterPassword(password);
		login.clickSubmit();
	}
	
	/** When **/
	
	@When ("^(.*) navigates to the User Profile menu$")
	public void clickUserProfileMenu(String persona) {
		menu.clickUserProfileMenu();
	}
	
	@And ("^he or she selects '(.*)' from the User Profile menu$")
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

}
