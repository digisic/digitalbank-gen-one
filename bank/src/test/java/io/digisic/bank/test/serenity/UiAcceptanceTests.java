package io.digisic.bank.test.serenity;

import cucumber.api.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(plugin = "pretty", features = "classpath:features/ui", glue = "io.digisic.bank.test.serenity.ui")
public class UiAcceptanceTests {}
