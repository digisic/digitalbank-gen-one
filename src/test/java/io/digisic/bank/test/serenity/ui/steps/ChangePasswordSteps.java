package io.digisic.bank.test.serenity.ui.steps;

import static org.junit.Assert.assertTrue;

import io.digisic.bank.test.serenity.ui.pom.ChangePasswordPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;


public class ChangePasswordSteps extends ScenarioSteps {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3473781951391128600L;
	
	ChangePasswordPage changePasswordPage;
	
	@Step ("Enter Current Password '{0}'")
	public void enterCurrentPassword (String password) {
		changePasswordPage.enterCurrentPassword(password);
	}
	
	@Step ("Enter New Password '{0}'")
	public void enterNewPassword (String password) {
		changePasswordPage.enterNewPassword(password);
	}
	
	@Step ("Enter Confirm Password '{0}'")
	public void enterConfirmPassword (String password) {
		changePasswordPage.enterConfirmPassword(password);
	}
	
	@Step ("Click Update Password")
	public void clickUpdatePassword () {
		changePasswordPage.clickUpdatePassword();
	}
	
	@Step ("Assert Current Password requirement Error Message")
	public void currentPasswordErrorRequired () {
		assertTrue (changePasswordPage.currentPasswordRequired());
	}
	
	@Step ("Assert New Password requirement Error Message")
	public void newPasswordErrorRequired () {
		assertTrue (changePasswordPage.newPasswordRequired());
	}
	
	@Step ("Assert Confirm Password requirement Error Message")
	public void confirmPasswordErrorRequired () {
		assertTrue (changePasswordPage.confirmPasswordRequired());
	}
	
	@Step ("Assert Current Password Error Message")
	public void currentPasswordError () {
		assertTrue (changePasswordPage.errorMessagePresent());
	}

	@Step ("Assert Change Password Success Message")
	public void changePasswordSuccess () {
		assertTrue (changePasswordPage.successMessagePresent());
	}


}
