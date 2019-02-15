package io.demo.bank.test.definition;

import cucumber.api.java.en.And;
import io.demo.bank.test.steps.LogoutSteps;
import net.thucydides.core.annotations.Steps;


public class LogoutTests {
	
	@Steps
	private LogoutSteps logout;
	

	@And ("I click the User Profile menu")
	public void clickUserProfileMenu() {
		logout.clickUserProfileMenu();
	}
	
	@And ("I click the Logout menu option")
	public void clickLogoutMenuOption() {
		logout.clickLogoutMenuOption();
	}

	
	@And ("I verify I am at the Login page")
	public void redirectedToLoginPage() {
		logout.redirectedToLoginPage();
	}
	
	@And ("I verify I am presented with a Success Message")
	public void presentedSuccessMessage() {
		logout.presentedSuccessMessage();
	}
	
}
