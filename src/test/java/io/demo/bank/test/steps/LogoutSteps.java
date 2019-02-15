package io.demo.bank.test.steps;

import static org.junit.Assert.assertTrue;

import io.demo.bank.test.pageobject.HomePage;
import io.demo.bank.test.pageobject.LoginPage;
import net.thucydides.core.annotations.Step;

public class LogoutSteps {
	
	
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
	
	@Step ("User is redirected to Login Page")
	public void redirectedToLoginPage() {
		assertTrue (loginPage.atLoginPage());
	}

	@Step ("Assert the User is presented a Success Message for Logout complete.")
	public void presentedSuccessMessage() {
		assertTrue (loginPage.successMessagePresent());
	}
}
