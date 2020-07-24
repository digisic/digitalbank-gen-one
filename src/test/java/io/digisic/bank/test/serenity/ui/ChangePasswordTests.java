package io.digisic.bank.test.serenity.ui;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import io.digisic.bank.test.serenity.ui.steps.ChangePasswordSteps;
import net.thucydides.core.annotations.Steps;

public class ChangePasswordTests {
	
	@Steps
	private ChangePasswordSteps changePassword;
		
	/** When **/
	
	@And ("^they enter '(.*)' into the change password Current Password field$")
	public void enterCurrentPassword (String password) {
		changePassword.enterCurrentPassword(password);;
	}
	
	@And ("^they enter '(.*)' into the change password New Password field$")
	public void enterNewPassword (String password) {
		changePassword.enterNewPassword(password);;
	}
	
	@And ("^they enter '(.*)' into the change password Confirm Password field$")
	public void enterConfirmPassword (String password) {
		changePassword.enterConfirmPassword(password);;
	}
	
	@And("^they submit the Update Password request$")
	public void clickUpdatePassword (){
		changePassword.clickUpdatePassword();
	}
	
	/** Then **/
	
	@Then("^(.*) verifies they are presented with a Error Message indicating Confirm Passsword does not match New Password$")
	public void presentedErrorMessageConfirmPasswordDoesNotMatch (String persona){
		changePassword.confirmPasswordErrorRequired();;
	}
	
	@Then("^(.*) verifies they are presented with a Error Message indicating New Password does not meet format requirements$")
	public void presentedErrorMessageNewPasswordFailsRequirements (String persona){
		changePassword.newPasswordErrorRequired();;
	}
	
	@Then("^(.*) verifies they are presented with a Error Message indicating New Password is the same as the Current Password$")
	public void presentedErrorMessageNewPasswordSameAsCurrent (String persona){
		changePassword.newPasswordErrorRequired();;
	}
	
	@Then("^(.*) verifies they are presented with a Error Message indicating Current Password is not correct$")
	public void presentedErrorMessageCurrentPasswordIncorrect (String persona){
		changePassword.currentPasswordError();
	}
	
	@Then("^(.*) verifies they are presented with a Error Message indicating Current Password is required$")
	public void presentedErrorMessageCurrentPasswordRequired(String persona){
		changePassword.currentPasswordErrorRequired();
	}
	
	@Then("^(.*) verifies they are presented with a Success Message indicating a successful change password$")
	public void presentedSuccessMessage(String persona){
		changePassword.changePasswordSuccess();
		
	}
	
}
