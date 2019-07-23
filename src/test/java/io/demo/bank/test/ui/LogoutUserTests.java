package io.demo.bank.test.ui;

import cucumber.api.java.en.And;
import io.demo.bank.test.ui.steps.LogoutSteps;
import net.thucydides.core.annotations.Steps;


public class LogoutUserTests {
	
	@Steps
	private LogoutSteps logout;

	@And ("^(.*) verifies he or she is at the Login page$")
	public void redirectedToLoginPage(String persona) {
		logout.redirectedToLoginPage();
	}
	
	@And ("^he or she verifies he or she is presented with a successful message indicating he or she is logged out of the application$")
	public void presentedSuccessMessage() {
		logout.presentedSuccessMessage();
	}
	
}
