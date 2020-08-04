package io.digisic.bank.test.serenity.ui.pom;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import net.serenitybdd.core.pages.WebElementFacade;

public class NewCheckingAccountPage {
	
	@FindBy(id="Standard Checking")
	private WebElement standardCheckingRadioSelection;
	
	@FindBy(id="Interest Checking")
	private WebElement interestCheckingRadioSelection;
	
	@FindBy(id="Individual")
	private WebElement individualRadioSelection;
	
	@FindBy(id="Joint")
	private WebElement jointRadioSelection;
	
	@FindBy(id="name")
	private WebElement accountNameInput;
	
	@FindBy(id="openingBalance")
	private WebElement initialBalanceInput;
	
	@FindBy(id="newCheckingSubmit")
	private WebElement submitButton;
	
	@FindBy(id="newCheckingReset")
	private WebElementFacade resetButton;
	
	@FindBy(id="new-account-error-alert")
	private WebElement insufficientDepositAlert;
	
	@FindBy(id="new-account-error-msg")
	private WebElement insufficientDepostMessage;
	
	@FindBy(id="page-title")
	private WebElement pageTitle;
	
	public void selectAccountType(String accountType) {
		if (accountType.equals("None Selected")) {
			// Do nothing
		} else if (accountType.equals("Interest Checking")) {
			interestCheckingRadioSelection.click();
		} else if (accountType.equals("Standard Checking")) {
			standardCheckingRadioSelection.click();
		}
	}
	
	public void selectOwnershipType(String ownershipType) {
		if (ownershipType.equals("None Selected")) {
			// Do nothing
		} else if (ownershipType.equals("Individual")) {
			individualRadioSelection.click();
		} else if (ownershipType.equals("Joint")) {
			jointRadioSelection.click();
		}
	}
	
	public void enterAccountName(String accountName) {
		accountNameInput.sendKeys(accountName);
	}
	
	public void enterInitialBalance(String initialBalance) {
		initialBalanceInput.sendKeys(initialBalance);
	}
	
	public void clickSubmit() {
		submitButton.click();
	}
	
	public void clickReset() {
		resetButton.click();
	}
	
	public boolean expectedInsufficientDepositMsgDisplayed(String requiredDepositMin, String initialDeposit) {
		return insufficientDepostMessage.getText().equals("The initial deposit ($"+initialDeposit+".00) entered does not meet the minimum amount ($"+requiredDepositMin+".00) required. Please enter a valid deposit amount.");
	}
	
	public boolean insufficientDepositAlertDisplayed() {
		return insufficientDepositAlert.isDisplayed();
	}
	
	public boolean atNewCheckingPage() {
		return pageTitle.getText().equals("Create Checking");
	}
	
}
