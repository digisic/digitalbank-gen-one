package io.digisic.bank.test.serenity.ui.steps;

import static org.junit.Assert.assertTrue;

import io.digisic.bank.test.serenity.ui.pom.LoginPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class LogoutSteps extends ScenarioSteps{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1395107659948452730L;
	
	LoginPage loginPage;
	
		
	@Step ("User is expected to be redirected to the Login page")
	public void redirectedToLoginPage() {
		assertTrue (loginPage.atLoginPage());
	}

	@Step ("Assert the User is presented a Success Message for Logout complete.")
	public void presentedSuccessMessage() {
		assertTrue (loginPage.successMessagePresent());
	}
}
