package io.digisic.bank.test.serenity.ui.pom;

import org.openqa.selenium.WebElement;

import net.serenitybdd.core.annotations.findby.FindBy;
import net.serenitybdd.core.pages.PageObject;
import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;

@DefaultUrl ("http://localhost:8080/home")
public class HomePage extends PageObject {

	@FindBy(className="user-area")
	private WebElementFacade userProfileMenu;
	
	@FindBy(linkText="Logout")
	private WebElementFacade logoutMenuOption;
	
	@FindBy(linkText="Change Password")
	private WebElementFacade changePasswordMenuOption;
	
	@FindBy(id="savings-menu")
	private WebElementFacade savingsMenu;
	
	@FindBy(id="new-savings-menu-item")
	private WebElementFacade newSavingsMenuOption;
	
	@FindBy(id="checking-menu")
	private WebElement checkingMenu;
	
	@FindBy(id="new-checking-menu-item")
	private WebElement newCheckingMenuOption;

	private static String homePageURI = "/home";
	
	public void clickUserProfileMenu() {
		userProfileMenu.click();
	}
	
	public void clickLogoutMenuOption() {
		logoutMenuOption.click();
	}
	
	public void clickChangePasswordMenuOption() {
		changePasswordMenuOption.click();
	}
		
	public boolean atHomePage() {
		return getDriver().getCurrentUrl().contains(homePageURI);
	}
  
	public void clickSavingsMenu() {
		savingsMenu.click();
	}
	
	public void clickNewSavingsMenuOption() {
		newSavingsMenuOption.click();
	}
	
	public void clickCheckingMenu() {
		checkingMenu.click();
	}
	
	public void clickNewCheckingMenuOption() {
		newCheckingMenuOption.click();
	}
	
}
