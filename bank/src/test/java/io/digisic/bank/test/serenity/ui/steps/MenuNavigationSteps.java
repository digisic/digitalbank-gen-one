package io.digisic.bank.test.serenity.ui.steps;

import io.digisic.bank.test.serenity.ui.pom.HomePage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

public class MenuNavigationSteps extends ScenarioSteps{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1792964493067605787L;
	HomePage homePage;
	
	
	@Step ("Click User Profile menu")
	public void clickUserProfileMenu () {
		homePage.clickUserProfileMenu();
	}
	
	@Step ("Click Logout menu option")
	public void clickLogoutMenuOption () {
		homePage.clickLogoutMenuOption();;
	}
	
	@Step ("Click Change Password menu option")
	public void clickChangePasswordMenuOption () {
		homePage.clickChangePasswordMenuOption();
	}
	
	@Step ("Click Savings Menu")
	public void clickSavingsMenu () {
		homePage.clickSavingsMenu();
	}

	@Step ("Click New Savings Menu Option")
	public void clickNewSavingsMenuOption () {
		homePage.clickNewSavingsMenuOption();
	}
}
