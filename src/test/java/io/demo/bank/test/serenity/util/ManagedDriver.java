package io.demo.bank.test.serenity.util;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.github.bonigarcia.wdm.WebDriverManager;
import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;
import net.thucydides.core.webdriver.DriverSource;

/*
 * Makes use of auto-updated "Managed Driver" which ensures/fixes consistency between 
browser and webdriver versions at runtime
*/
public class ManagedDriver implements DriverSource {
	
	private static final Logger LOG = LoggerFactory.getLogger(ManagedDriver.class);
	
	private EnvironmentVariables env = SystemEnvironmentVariables.createEnvironmentVariables();
	private String defaultDriver = env.getProperty("webdriver.driver");

	@Override
	public WebDriver newDriver() {
		WebDriver managedDriver;
		switch (defaultDriver) {
			case "chrome":
				WebDriverManager.chromedriver().setup();
				managedDriver = new ChromeDriver();
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
		}
		
	    return managedDriver;
			
	}

	@Override
	public boolean takesScreenshots() {
		// TODO Auto-generated method stub
		return false;
	}

}
