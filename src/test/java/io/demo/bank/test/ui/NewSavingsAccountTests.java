package io.demo.bank.test.ui;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.demo.bank.test.ui.steps.LoginSteps;
import io.demo.bank.test.ui.steps.MenuNavigationSteps;
import io.demo.bank.test.ui.steps.NewSavingsAccountSteps;
import net.thucydides.core.annotations.Steps;


public class NewSavingsAccountTests {
	
	@Steps
	private LoginSteps login;
	
	@Steps
	private MenuNavigationSteps menu;
	
	@Steps
	private NewSavingsAccountSteps newSavings;
	
	@Given("^a user is logged in to DigitalBank$")
	public void validUserLogin() throws Throwable {
		login.navigateToLoginPage();
		login.enterUsername("jsmith@demo.io");
		login.enterPassword("Demo123!");
		login.clickSubmit();
	}

	@And("^they attempt to open a new Savings Account$")
	public void openSavingsAccount() throws Throwable {
		menu.clickSavingsMenuOption();
		menu.clickNewSavingsMenuOption();
	}

	@When("^they enter '(.*)' as Account Name$")
	public void enterAccountName(String accountName) throws Throwable {
		newSavings.enterAccountName(accountName);
	}

	@And("^select '(.*)' for Ownership$")
	public void selectOwnership(String ownershipType) throws Throwable {
		newSavings.selectOwnershipType(ownershipType);
	}

	@And("^select '(.*)' for Account Type$")
	public void selectAccountType(String accountType) throws Throwable {
		newSavings.selectAccountType(accountType);
	}

	@And("^enter '(.*)' as Money Market Initial Deposit$")
	public void enterMoneyMarketInitialDeposit(String initialDeposit) throws Throwable {
		newSavings.validateMinBalanceDisplayed(2500);
		newSavings.enterInitialBalance(initialDeposit);
	}
	
	@And("^enter '(.*)' as Savings Initial Deposit$")
	public void enterRegularSavingsInitialDeposit(String initialDeposit) throws Throwable {
		newSavings.validateMinBalanceDisplayed(25);
		newSavings.enterInitialBalance(initialDeposit);
	}

	@And("^then click Submit$")
	public void clickSubmit() throws Throwable {
		newSavings.clickSubmit();
	}

	@Then("^the account should not be created$")
	public void accountNotCreated() throws Throwable {
		newSavings.notRedirectedToViewSavingsPage();
	}
	
	@Then("^a '(.*)' should be created$")
	public void accountCreated(String accountType) throws Throwable {
		newSavings.redirectedToViewSavingsPage();
	}

	@And("^insufficient balance warning should be displayed$")
	public void insufficientBalanceWarningDisplayed() throws Throwable {
		newSavings.validateInsufficientBalAlertPresent();
	}

	@And("^the account balance should match the initial deposit of '(\\d+)'$")
	public void newAccountBalanceValidation(int initialBalance) throws Throwable {
		//TODO: Validate new account has balance matching initial deposit
	}

	@And("^form validation error should appear$")
	public void formValidationErrorAppears() throws Throwable {
		//TODO: Validate that error messages appear for invalid fields
	}

	

}
