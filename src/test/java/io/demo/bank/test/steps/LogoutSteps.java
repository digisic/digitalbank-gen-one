package io.demo.bank.test.steps;

import static org.junit.Assert.assertTrue;

import io.demo.bank.test.pageobject.HomePage;
import io.demo.bank.test.pageobject.LoginPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class LogoutSteps extends ScenarioSteps{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1395107659948452730L;
	
	HomePage homePage;
	LoginPage loginPage;
	
	
	@Step ("Click User Profile menu")
	public void clickUserProfileMenu () {
		homePage.clickUserProfileMenu();
	}
	
	@Step ("Click Logout menu option")
	public void clickLogoutMenuOption () {
		homePage.clickLogoutMenuOption();;
	}
	
	@Step ("User is expected to be redirected to the Login page")
	public void redirectedToLoginPage() {
		assertTrue (loginPage.atLoginPage());
	}

	@Step ("Assert the User is presented a Success Message for Logout complete.")
	public void presentedSuccessMessage() {
		assertTrue (loginPage.successMessagePresent());
	}
}
