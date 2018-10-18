package io.demo.bank;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/resources/features/login.feature", plugin = {"pretty", "html:target/cucumber"})
public class LoginTest {

}
