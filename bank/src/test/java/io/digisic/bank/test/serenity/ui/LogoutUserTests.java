package io.digisic.bank.test.serenity.ui;

import cucumber.api.java.en.And;
import io.digisic.bank.test.serenity.ui.steps.LogoutSteps;
import net.thucydides.core.annotations.Steps;


public class LogoutUserTests {
	
	@Steps
	private LogoutSteps logout;

	@And ("^(.*) verifies they are at the Login page$")
	public void redirectedToLoginPage(String persona) {
		logout.redirectedToLoginPage();
	}
	
	@And ("^they verify they are presented with a successful message indicating he or she is logged out of the application$")
	public void presentedSuccessMessage() {
		logout.presentedSuccessMessage();
	}
	
}
