package io.demo.bank.test.definition;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import io.demo.bank.test.steps.ChangePasswordSteps;
import net.thucydides.core.annotations.Steps;


public class ChangePasswordTests {
	
	@Steps
	private ChangePasswordSteps changePassword;
		
	@And ("I click the Change Password menu option")
	public void clickChangePasswordMenuOption() {
		changePassword.clickChangePasswordMenuOption();
	}
	
	@And ("I enter '(.*)' into the Current Password field")
	public void enterCurrentPassword (String password) {
		changePassword.enterCurrentPassword(password);;
	}
	
	@And ("I enter '(.*)' into the New Password field")
	public void enterNewPassword (String password) {
		changePassword.enterNewPassword(password);;
	}
	
	@And ("I enter '(.*)' into the Confirm Password field")
	public void enterConfirmPassword (String password) {
		changePassword.enterConfirmPassword(password);;
	}
	
	@And("I click the Update Password button")
	public void clickUpdatePassword (){
		changePassword.clickUpdatePassword();
	}
	
	@Then("I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password")
	public void presentedErrorMessageConfirmPasswordDoesNotMatch (){
		changePassword.confirmPasswordErrorRequired();;
	}
	
	@Then("I verify I am presented with a Error Message indicating New Password does not meet format requirements")
	public void presentedErrorMessageNewPasswordFailsRequirements (){
		changePassword.newPasswordErrorRequired();;
	}
	
	@Then("I verify I am presented with a Error Message indicating New Password is the same as the Current Password")
	public void presentedErrorMessageNewPasswordSameAsCurrent (){
		changePassword.newPasswordErrorRequired();;
	}
	
	@Then("I verify I am presented with a Error Message indicating Current Password is not correct")
	public void presentedErrorMessageCurrentPasswordIncorrect (){
		changePassword.currentPasswordError();
	}
	
	@Then("I verify I am presented with a Error Message indicating Current Password is required")
	public void presentedErrorMessageCurrentPasswordRequired(){
		changePassword.currentPasswordErrorRequired();
	}
	
	
}
