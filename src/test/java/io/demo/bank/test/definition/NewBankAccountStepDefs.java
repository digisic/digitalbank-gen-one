package io.demo.bank.test.definition;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import io.demo.bank.test.steps.NewBankAccountSteps;
import net.thucydides.core.annotations.Steps;

public class NewBankAccountStepDefs {
	
	@Steps
	private NewBankAccountSteps login;
	@Steps
	private NewBankAccountSteps newAccountPage;
	@Steps
	private NewBankAccountSteps dashboardPage;

	@Given("^a user is logged in to Online Banking$")
	public void userIsLoggedInToOnlineBanking() {
		login.navigateToLoginPage();
		login.enterValidUsernameAndPassword();
		login.clickSubmit();
	}

	@When("^they attempt to open a new Checking Account$")
	public void attemptOpenNewCheckingAccount() {
		dashboardPage.clickOpenNewAccount();
		dashboardPage.selectCheckingAccountFromDropdown();
	}

	@And("^they provide sufficient initial balance of \\$(\\d+)$")
	public void provideInitialBalance(int initialBal) {
		newAccountPage.enterInitialBalance(initialBal);
	}

	@And("^they accept the account terms$")
	public void acceptAccountTerms() {
		newAccountPage.clickAcceptTermsCheckbox();
	}
	
	@And("^they submit the application$")
	public void submitNewAccountRequest() {
		newAccountPage.clickSubmitApplication();
	}

	@Then("^a new Checking Account should be created$")
	public void verifyAccountCreated() {
		dashboardPage.verifyNewAccountVisible();
	}
	
	@And("^the balance should be \\$(\\d+)$")
	public void verifyAccountBalance(int expectedBal) {
		dashboardPage.selectNewestAccount();
		dashboardPage.verifyInitialBalance(expectedBal);
	}
	
	
	
	
	
	
	
	
	public void exampleTest() {
		
		login.navigateToLoginPage();
		login.enterValidUsernameAndPassword();
		login.clickSubmit();
		
		dashboardPage.clickOpenNewAccount();
		dashboardPage.selectCheckingAccountFromDropdown();
		
		newAccountPage.enterInitialBalance(200);
		
		newAccountPage.clickAcceptTermsCheckbox();
		
		newAccountPage.clickSubmitApplication();
		
		dashboardPage.verifyNewAccountVisible();
		
		dashboardPage.selectNewestAccount();
		dashboardPage.verifyInitialBalance(200);
		
	}

	
	
	
}
