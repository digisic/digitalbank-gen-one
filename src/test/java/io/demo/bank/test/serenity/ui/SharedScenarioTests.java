package io.demo.bank.test.serenity.ui;

import java.util.HashMap;
import java.util.Map;

import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cucumber.api.Result;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;
import io.demo.bank.test.serenity.common.TestDataService;
import io.demo.bank.test.serenity.ui.steps.LoginSteps;
import io.demo.bank.test.serenity.ui.steps.MenuNavigationSteps;
import io.demo.bank.test.serenity.util.BlazeGridDriver;
import io.demo.bank.test.serenity.util.ManagedDriver;
import io.github.bonigarcia.wdm.WebDriverManager;
import net.thucydides.core.annotations.Steps;
import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;
import net.thucydides.core.webdriver.ThucydidesWebDriverSupport;

/*
 * This class handles the WebDriver setup and common login functions for the UI tests. 
 * It is NOT actually referenced by any other class, but the assumption is that it will
 * always be called given there are no operations that can be performed on the UI unless
 * the user 'logs in'.
 * */
public class SharedScenarioTests {
	
	// User Profile Menu Options
	private final static String UserProfileLogout = "Logout";
	private final static String UserProfileChangePassword = "Change Password";
	private final static String password = "Demo123!";
	
	private static final Logger LOG = LoggerFactory.getLogger(SharedScenarioTests.class);
	
	// Environment 
	private EnvironmentVariables env = SystemEnvironmentVariables.createEnvironmentVariables();
	private String userSelectedDriver = env.getProperty("webdriver.provided.mydriver");
	private String defaultDriver = env.getProperty("webdriver.driver"); //added
	private String blazeGridDriver = BlazeGridDriver.class.getName();
	private String managedDriverName = ManagedDriver.class.getName(); //added
	
	public SharedScenarioTests() {
		
	}
	
	// Remote Driver used when testing with Selenium Grid
	private RemoteWebDriver remoteDriver = ThucydidesWebDriverSupport.getProxiedDriver();
	private RemoteWebDriver webDriver;
	
	@Steps
	private LoginSteps login;
	
	@Steps
	private MenuNavigationSteps menu;
	
	@Steps
	private TestDataService data;
	
	@Before
	public void setupTest(Scenario scenario) {
		
		// Only execute if we are executing against BlazeGrid
		if (userSelectedDriver != null && userSelectedDriver.equals(blazeGridDriver)) {
			
			if (remoteDriver != null) {
				
				 Map<String, String> map = new HashMap<>();
		         map.put("testCaseName", scenario.getName());
		         map.put("testSuiteName", scenario.getId().substring(scenario.getId().lastIndexOf("/") + 1, scenario.getId().lastIndexOf(".")));
		         
		         remoteDriver.executeAsyncScript("/* FLOW_MARKER test-case-start */", map);
			}
			
		} else if (userSelectedDriver != null && userSelectedDriver.equals(managedDriverName)) {
			
			LOG.info("!!!!!!!!Executing script with managed driver!!!!!!!!!");
			Map<String, String> map = new HashMap<>();
	         map.put("testCaseName", scenario.getName());
	         map.put("testSuiteName", scenario.getId().substring(scenario.getId().lastIndexOf("/") + 1, scenario.getId().lastIndexOf(".")));
	         
			webDriver = getManagedDriver();
			webDriver.executeScript("HI-ALEX-START-TEST", map);
			LOG.info("!!!!!!!!DONE executing script with managed driver [TEARDOWN]!!!!!!!!!");
		}
	}
	
	@After
	public void tearDownTest(Scenario scenario) {
		
		// Only execute if we are executing against BlazeGrid
		if (userSelectedDriver != null && userSelectedDriver.equals(blazeGridDriver)) {
			
			if (remoteDriver != null) {
		
				Map<String, String> map = new HashMap<>();
				
				if (scenario.getStatus().equals(Result.Type.FAILED)){
					map.put("status", "failed");
	                map.put("message", scenario.getStatus().toString());
				} 
				else if (scenario.getStatus().equals(Result.Type.PASSED)) {
					map.put("status", "passed");
	                map.put("message", scenario.getStatus().toString());
				} else {
					map.put("status", "broken");
	                map.put("message", scenario.getStatus().toString());
				}
				remoteDriver.executeAsyncScript("/* FLOW_MARKER test-case-stop */", map);
			} // end if remote driver
		} // end if blaze grid
		else if (userSelectedDriver != null && userSelectedDriver.equals(managedDriverName)) {
			LOG.info("!!!!!!!!DONE executing script with managed driver [TEARDOWN]!!!!!!!!!");
		}
	}
	
	private RemoteWebDriver getManagedDriver() {
		RemoteWebDriver managedDriver;
		switch (defaultDriver) {
			case "chrome":
				WebDriverManager.chromedriver().setup();
				managedDriver = new ChromeDriver();
				LOG.info("!!!!!!!!!!CHROME!!!!!!!!!!!");
				break;
			case "firefox":
				WebDriverManager.firefoxdriver().setup();
				managedDriver = new FirefoxDriver();
				LOG.info("!!!!!!!!!!FIREFOX!!!!!!!!!!!");
				break;
			case "ie":
				managedDriver = new InternetExplorerDriver();
				WebDriverManager.iedriver().setup();
				break;
			case "edge":
				WebDriverManager.edgedriver().setup();
				managedDriver = new EdgeDriver();
				break;
			default:
				WebDriverManager.firefoxdriver().setup();
				managedDriver = new FirefoxDriver();
				LOG.info("!!!!!!!!!!DEFAULT FIREFOX!!!!!!!!!!!");
		}
		
	    return managedDriver;
	}
	
	/** Given **/
	
	@Given ("^(.*) is logged into the application with (.*)$")
	public void authenticatedUser(String persona, String email) {
		
		if (!data.validateRegisteredUser(persona, email))
			data.registerUser();
		
		LOG.info("!!!!!!!!!!!!!!!!!!WTF!!!!!!!!!!!!!!!!!!!!!!");
		
		// Login with the identified persona that can authenticate
		login.navigateToLoginPage();
		login.enterUsername(email);
		login.enterPassword(password);
		login.clickSubmit();
	}
	
	/** When **/
	
	@When ("^(.*) navigates to the User Profile menu$")
	public void clickUserProfileMenu(String persona) {
		menu.clickUserProfileMenu();
	}
	
	@And ("^they select '(.*)' from the User Profile menu$")
	public void clickUserProfileMenuOption(String option) {
		
		switch (option){
			case UserProfileLogout:
				menu.clickLogoutMenuOption();
				break;
			case UserProfileChangePassword:
				menu.clickChangePasswordMenuOption();
			default:
				// Do not assume a menu option
				break;
		}
		
	}
	
	@And ("^they verify they are at the Home page$")
	public void verifyLocationHomePage() {
		login.redirectedToHomePage();
	}
	
}
