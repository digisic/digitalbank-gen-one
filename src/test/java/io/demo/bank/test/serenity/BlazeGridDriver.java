package io.demo.bank.test.serenity;

import java.net.MalformedURLException;
import java.net.URL;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import net.thucydides.core.util.EnvironmentVariables;
import net.thucydides.core.util.SystemEnvironmentVariables;
import net.thucydides.core.webdriver.DriverSource;

public class BlazeGridDriver implements DriverSource {
	
    private final static String BASE = "a.blazemeter.com";
    private final static String curl = String.format("https://%s/api/v4/grid/wd/hub", BASE);
    private static RemoteWebDriver driver;
    private EnvironmentVariables env = SystemEnvironmentVariables.createEnvironmentVariables();

	@Override
	public WebDriver newDriver() {
		
		try {
			
			URL url = new URL(curl);
			DesiredCapabilities capabilities = new DesiredCapabilities();
			
			// Pass capabilities as defined in the serenity.properties file
			capabilities.setCapability("blazemeter.apiKey", env.getProperty("blazemeter.api.key"));
			capabilities.setCapability("blazemeter.apiSecret", env.getProperty("blazemeter.api.secret"));
			capabilities.setCapability("blazemeter.reportName", env.getProperty("blazemeter.report.name"));
	        capabilities.setCapability("blazemeter.sessionName", env.getProperty("blazemeter.session.name"));
	        capabilities.setCapability("blazemeter.sessionTimeout", env.getProperty("blazemeter.session.timeout"));
	        capabilities.setCapability("blazemeter.videoEnabled", env.getProperty("blazemeter.video.enabled"));
	        capabilities.setCapability("browserName", env.getProperty("blazemeter.browser.name"));
	        capabilities.setCapability("browserVersion", env.getProperty("env.browser.version"));
	        capabilities.setCapability("blazemeter.testName", env.getProperty("blazemeter.test.name"));
	        capabilities.setCapability("blazemeter.locationId", env.getProperty("blazemeter.location.id"));
	        capabilities.setCapability("blazemeter.projectId", env.getProperty("blazemeter.project.id"));
	        capabilities.setCapability("blazemeter.testId", env.getProperty("blazemeter.test.id"));
	        capabilities.setCapability("blazemeter.buildId", env.getProperty("blazemeter.build.id"));
	        

	        driver = new RemoteWebDriver(url, capabilities);
	        
	        return driver;
			
		} catch (MalformedURLException ex) {
			System.out.printf(ex.getMessage());
		}	
		return null;
	}

	@Override
	public boolean takesScreenshots() {
		// TODO Auto-generated method stub
		return false;
	}

}
