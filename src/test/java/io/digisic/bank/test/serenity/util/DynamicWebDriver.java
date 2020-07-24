package io.digisic.bank.test.serenity.util;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.phantomjs.PhantomJSDriver;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.opera.OperaDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import io.github.bonigarcia.wdm.DriverManagerType;
import io.github.bonigarcia.wdm.WebDriverManager;
import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;
import net.thucydides.core.webdriver.DriverSource;

public class DynamicWebDriver implements DriverSource {
	
   
    private static WebDriver driver;
    
    private EnvironmentVariables env = SystemEnvironmentVariables.createEnvironmentVariables();

	@Override
	public WebDriver newDriver() {
		
		String driverType = env.getProperty("dynamic.webdriver.driver", "chrome");
		
		switch (driverType.toUpperCase()) {
		case "CHROME":
			WebDriverManager.getInstance(DriverManagerType.CHROME).setup();
			driver = new ChromeDriver();
			break;
		case "FIREFOX":
			WebDriverManager.getInstance(DriverManagerType.FIREFOX).setup();
			driver = new FirefoxDriver();
			break;
		case "EDGE":
			WebDriverManager.getInstance(DriverManagerType.EDGE).setup();
			driver = new EdgeDriver();
			break;
		case "IEXPLORER":
			WebDriverManager.getInstance(DriverManagerType.IEXPLORER).setup();
			driver = new InternetExplorerDriver();
			break;
		case "OPERA":
			WebDriverManager.getInstance(DriverManagerType.OPERA).setup();
			driver = new OperaDriver();
			break;
		case "PHANTOMJS":
			WebDriverManager.getInstance(DriverManagerType.PHANTOMJS).setup();
			driver = new PhantomJSDriver();
			break;
		default:
			WebDriverManager.getInstance(DriverManagerType.CHROME).setup();
			driver = new ChromeDriver();
		}
		
        return driver;
			
	}

	@Override
	public boolean takesScreenshots() {
		return true;
	}

}
