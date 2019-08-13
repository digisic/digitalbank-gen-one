package io.demo.bank.test.serenity.ui.pom;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;

@DefaultUrl ("http://localhost:8080/account/savings-add")
public class NewSavingsAccountPage extends PageObject {

	@FindBy(id="Savings")
	private WebElementFacade regularSavingsRadioSelection;
	
	@FindBy(id="Money Market")
	private WebElementFacade moneyMarketRadioSelection;
	
	@FindBy(id="Individual")
	private WebElementFacade individualRadioSelection;
	
	@FindBy(id="Joint")
	private WebElementFacade jointRadioSelection;
	
	@FindBy(id="name")
	private WebElementFacade accountNameInput;
	
	@FindBy(id="openingBalance")
	private WebElementFacade initialBalanceInput;
	
	@FindBy(id="newSavingsSubmit")
	private WebElementFacade submitButton;
	
	@FindBy(id="minDeposit")
	private WebElementFacade minBalanceMessage;
	
	@FindBy(className="sufee-alert alert with-close alert-danger")
	private WebElementFacade insufficientBalanceMessage;
	
	private static String newSavingsPageURI = "/account/savings-add";
	private static String viewSavingsAccountsPageURI = "/account/savings-view";
	
	public void selectAccountType(String accountType) {
		if (accountType.equals("None Selected")) {
			// Do nothing
		} else if (accountType.equals("Money Market")) {
			moneyMarketRadioSelection.click();
		} else if (accountType.equals("Savings")) {
			regularSavingsRadioSelection.click();
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
		accountNameInput.type(accountName);
	}
	
	public void enterInitialBalance(String initialBalance) {
		initialBalanceInput.type(initialBalance);
	}
	
	public void clickSubmit() {
		submitButton.click();
	}
	
	public boolean newAccountDisplayedWithBalance() {
		//TODO: Implement!
		return true;
	}
	
	public boolean validateMinBalanceDisplayed(int minBalance) {
		return minBalanceMessage.containsText("ex. Minimum opening deposit is $"+Integer.toString(minBalance)+".00");
	}
	
	public boolean validateInsufficientBalAlertPresent() {
		return insufficientBalanceMessage.isPresent();
	}
	
	public boolean atNewSavingsPage() {
		return getDriver().getCurrentUrl().contains(newSavingsPageURI);
	}
	
	public boolean atViewSavingsPage() {
		return getDriver().getCurrentUrl().contains(viewSavingsAccountsPageURI);
	}
	
}
