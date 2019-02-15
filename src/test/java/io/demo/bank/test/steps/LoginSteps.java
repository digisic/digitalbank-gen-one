package io.demo.bank.test.steps;


import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import io.demo.bank.test.pageobject.HomePage;
import io.demo.bank.test.pageobject.LoginPage;
import net.thucydides.core.annotations.Step;


public class LoginSteps {
	
	LoginPage loginPage;
	HomePage homePage;
	
	@Step ("Open Browser and Navigate to Login Page")
	public void navigateToLoginPage () {
		loginPage.open();
	}
	
	@Step ("Enter Username '{0}' for User to be Authenticated")
	public void enterUsername (String username) {
		loginPage.enterUsername(username);
	}
	
	@Step ("Enter Password '{0}' for User to be Authenticated")
	public void enterPassword (String password) {
		loginPage.enterPassword(password);
	}
	
	@Step ("Select the Remember Me check box to remember the Authenticated User")
	public void clickRememberMe () {
		loginPage.clickRememberMe();
	}
	
	@Step ("Submit credentials for User to be Authenticated")
	public void clickSubmit () {
		loginPage.clickSubmit();
	}
	
	@Step ("Authenticated User redirects to Home Page")
	public void redirectedToHomePage() {
		assertTrue (homePage.atHomePage());
	}
	
	@Step ("Assert the User is presented an Error Message for Failed Authentication")
	public void presentedErrorMessage() {
		assertTrue (loginPage.errorMessagePresent());
	}
	
	@Step ("Assert the Remember Me cookie is present")
	public void remeberMeCookiePresent() {
		assertTrue (loginPage.cookiePresent());
	}
	
	@Step ("Assert the Remember Me cookie is not present")
	public void remeberMeCookieNotPresent() {
		assertFalse (loginPage.cookiePresent());
	}

}
