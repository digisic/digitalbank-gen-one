package io.digisic.bank.test.serenity.util;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.phantomjs.PhantomJSDriver;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.edge.EdgeOptions;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.ie.InternetExplorerOptions;
import org.openqa.selenium.opera.OperaDriver;
import org.openqa.selenium.opera.OperaOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
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
			
			// Handle SSL
			ChromeOptions chromeOptions = new ChromeOptions();
			chromeOptions.setAcceptInsecureCerts(true);
			
			driver = new ChromeDriver(chromeOptions);
			
			break;
			
		case "FIREFOX":
			
			WebDriverManager.getInstance(DriverManagerType.FIREFOX).setup();
			
			// Handle SSL
			FirefoxOptions fireFoxOptions = new FirefoxOptions();
			fireFoxOptions.setAcceptInsecureCerts(true);
			
			driver = new FirefoxDriver(fireFoxOptions);
			
			break;
			
		case "EDGE":
			
			WebDriverManager.getInstance(DriverManagerType.EDGE).setup();
			
			// Handle SSL
			EdgeOptions edgeOptions = new EdgeOptions();
			edgeOptions.setCapability(CapabilityType.ACCEPT_INSECURE_CERTS, true);
						
			driver = new EdgeDriver(edgeOptions);
			
			break;
			
		case "IEXPLORER":
			
			WebDriverManager.getInstance(DriverManagerType.IEXPLORER).setup();
			
			// Handle SSL
			InternetExplorerOptions ieOptions = new InternetExplorerOptions();
			ieOptions.setCapability(CapabilityType.ACCEPT_INSECURE_CERTS, true);
			
			driver = new InternetExplorerDriver(ieOptions);
			
			break;
			
		case "OPERA":
			
			WebDriverManager.getInstance(DriverManagerType.OPERA).setup();
			
			// Handle SSL
			OperaOptions operaOptions = new OperaOptions();
			operaOptions.setCapability(CapabilityType.ACCEPT_INSECURE_CERTS, true);
						
			driver = new OperaDriver(operaOptions);
			
			break;
			
		case "PHANTOMJS":
			// Did not find SSL Options for this driver
			WebDriverManager.getInstance(DriverManagerType.PHANTOMJS).setup();
			driver = new PhantomJSDriver();
			break;
		default:
			
			WebDriverManager.getInstance(DriverManagerType.CHROME).setup();
			
			// Handle SSL
			ChromeOptions options = new ChromeOptions();
			options.setAcceptInsecureCerts(true);
			
			driver = new ChromeDriver(options);
			
			break;
		}
		
        return driver;
			
	}

	@Override
	public boolean takesScreenshots() {
		return true;
	}

}
