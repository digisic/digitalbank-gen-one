package io.digisic.bank.test.serenity.ui;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.digisic.bank.test.serenity.ui.steps.LoginSteps;
import io.digisic.bank.test.serenity.ui.steps.MenuNavigationSteps;
import io.digisic.bank.test.serenity.ui.steps.NewSavingsAccountSteps;
import net.thucydides.core.annotations.Steps;


public class NewSavingsAccountTests {
	
	@Steps
	private LoginSteps login;
	
	@Steps
	private MenuNavigationSteps menu;
	
	@Steps
	private NewSavingsAccountSteps newSavings;
	

	@And("^they attempt to open a new 'Savings Account'$")
	public void openSavingsAccount() throws Throwable {
		menu.clickSavingsMenu();
		menu.clickNewSavingsMenuOption();
	}

	@When("^(.*) enters '(.*)' into the Account Name field$")
	public void enterAccountName(String perosna, String accountName) throws Throwable {
		newSavings.enterAccountName(accountName);
	}

	@And("^they select '(.*)' from the Ownership radio button$")
	public void selectOwnership(String ownershipType) throws Throwable {
		newSavings.selectOwnershipType(ownershipType);
	}

	@And("^they select '(.*)' from the Account Type radio button$")
	public void selectAccountType(String accountType) throws Throwable {
		newSavings.selectAccountType(accountType);
	}

	@And("^they enter '(.*)' into the Money Market Inital Deposit field$")
	public void enterMoneyMarketInitialDeposit(String initialDeposit) throws Throwable {
		newSavings.validateMinBalanceDisplayed(2500);
		newSavings.enterInitialBalance(initialDeposit);
	}
	
	@And("^they enter '(.*)' into the Savings Inital Deposit field$")
	public void enterRegularSavingsInitialDeposit(String initialDeposit) throws Throwable {
		newSavings.validateMinBalanceDisplayed(25);
		newSavings.enterInitialBalance(initialDeposit);
	}

	@And("^they click the Submit button$")
	public void clickSubmit() throws Throwable {
		newSavings.clickSubmit();
	}

	@Then("^(.*) verifies the account coould not be created$")
	public void accountNotCreated(String persona) throws Throwable {
		newSavings.notRedirectedToViewSavingsPage();
	}
	
	@Then("^(.*) verifies a '(.*)' should be created$")
	public void accountCreated(String personal, String accountType) throws Throwable {
		newSavings.redirectedToViewSavingsPage();
	}

	@And("^they verify they are presented with a message indicating insufficient balance$")
	public void insufficientBalanceWarningDisplayed() throws Throwable {
		newSavings.validateInsufficientBalAlertPresent();
	}

	@And("^they verify account balance should be '(\\d+)'$")
	public void newAccountBalanceValidation(int initialBalance) throws Throwable {
		//TODO: Validate new account has balance matching initial deposit
	}

	@And("^they verify they are presented with a message indicating form validation error$")
	public void formValidationErrorAppears() throws Throwable {
		//TODO: Validate that error messages appear for invalid fields
	}

}
