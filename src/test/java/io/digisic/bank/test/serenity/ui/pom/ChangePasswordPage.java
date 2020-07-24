package io.digisic.bank.test.serenity.ui.pom;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;

@DefaultUrl ("http://localhost:8080/user/password")
public class ChangePasswordPage extends PageObject {

	@FindBy(id="currentPassword")
	private WebElementFacade currentPasswordField;
	
	@FindBy(id="newPassword")
	private WebElementFacade newPasswordField;
	
	@FindBy(id="confirmPassword")
	private WebElementFacade confirmPasswordField;
	
	@FindBy(id="payment-button-amount")
	private WebElementFacade updatePasswordButton;
	
	@FindBy(className="alert-success")
	private WebElementFacade successMessage;
	
	@FindBy(className="alert-danger")
	private WebElementFacade errorMessage;
	
	
	
	public void enterCurrentPassword (String password) {
		currentPasswordField.type(password);
	}
	
	public boolean currentPasswordRequired() {
		if (currentPasswordField.getAttribute("required") != null)
			return true;
		else
			return false;
	}
	
	public void enterNewPassword (String password) {
		newPasswordField.type(password);
	}
	
	public boolean newPasswordRequired() {
		if (newPasswordField.getAttribute("required") != null)
			return true;
		else
			return false;
	}
	
	public void enterConfirmPassword (String password) {
		confirmPasswordField.type(password);
	}
	
	public boolean confirmPasswordRequired() {
		if (confirmPasswordField.getAttribute("required") != null)
			return true;
		else
			return false;
	}
	
	
	public void clickUpdatePassword () {
		updatePasswordButton.click();
	}
	
	public boolean successMessagePresent() {
		return successMessage.isPresent();
	}
	
	public boolean errorMessagePresent() {
		return errorMessage.isPresent();
	}
}
