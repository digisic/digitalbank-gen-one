package io.demo.bank.test.serenity;

import cucumber.api.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(plugin = "pretty", features = "classpath:features/api", glue = "io.demo.bank.test.serenity.api")
public class ApiAcceptanceTests {}
