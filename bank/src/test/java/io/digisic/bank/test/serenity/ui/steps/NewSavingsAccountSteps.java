package io.digisic.bank.test.serenity.ui.steps;


import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import io.digisic.bank.test.serenity.ui.pom.NewSavingsAccountPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;


public class NewSavingsAccountSteps extends ScenarioSteps{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9217777745579627128L;
	
	NewSavingsAccountPage newSavingsAccountPage;
	
	@Step ("Select Account Type '{0}'")
	public void selectAccountType(String accountType) {
		newSavingsAccountPage.selectAccountType(accountType);
	}
	
	@Step ("Select Ownership Type '{0}'")
	public void selectOwnershipType(String ownershipType) {
		newSavingsAccountPage.selectOwnershipType(ownershipType);
	}
	
	@Step ("Enter Account Name '{0}'")
	public void enterAccountName(String accountName) {
		newSavingsAccountPage.enterAccountName(accountName);
	}
	
	@Step ("Enter Initial Balance '{0}'")
	public void enterInitialBalance(String initialBalance) {
		newSavingsAccountPage.enterInitialBalance(initialBalance);
	}
	
	@Step ("Validate minimum balance displays amount of '{0}")
	public void validateMinBalanceDisplayed(int minBalance) {
		assertTrue(newSavingsAccountPage.validateMinBalanceDisplayed(minBalance));
	}
	
	@Step ("Click the Submit button")
	public void clickSubmit() {
		newSavingsAccountPage.clickSubmit();
	}
	
	@Step ("Validate insufficient initial balance alert appears")
	public void validateInsufficientBalAlertPresent() {
		assertTrue(newSavingsAccountPage.insufficientDepositAlertDisplayed());
	}
	
	@Step ("User is expected to be redirected to the View Savings Accounts page with the new account visible")
	public void redirectedToViewSavingsPage() {
		assertTrue(newSavingsAccountPage.atViewSavingsPage());
	}
	
	@Step ("User is not redirected to the View Savings Accounts page")
	public void notRedirectedToViewSavingsPage() {
		assertFalse(newSavingsAccountPage.atViewSavingsPage());
	}

}
