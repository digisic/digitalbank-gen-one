package io.demo.bank.service;

import com.ca.codesv.engine.junit4.VirtualServerRule;
import io.demo.bank.model.AtmLocation;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static com.ca.codesv.protocols.http.fluent.HttpFluentInterface.*;
import static org.junit.Assert.*;

/**
 * Tests integration between <code>SearchService</code> of Digital Bank and synapsefi ATM locator service.
 *
 */
@SpringBootTest
@ContextConfiguration(classes = SearchService.class)
@RunWith(SpringRunner.class)
public class SearchServiceTest extends BaseTest {

    @Rule
    public VirtualServerRule vs = new VirtualServerRule();

    @Autowired
    private SearchService searchService;

    /**
     * This methods calls method requesting synapsefi API and tests whether it can handle synapsefi response correctly.
     *
     * In this test case, the scenario expects correct response from the synapsefi API.
     *
     * @throws Exception
     */
    @Test
    public void testSearchATMLocations() throws Exception {

        forGet("https://uat-api.synapsefi.com:443/v3.1/nodes/atms")
                .matchesQuery("zip", "94203")
                .usingHttps(
                        withSecureProtocol("TLS")
                                .keystorePath(KEYSTORE_PATH)
                                .keystorePassword(KEYSTORE_PASSWORD)
                                .keyPassword(KEYSTORE_PASSWORD)
                )
                .doReturn(okMessage().withJsonBody(RESPONSE_OK));

        List<AtmLocation> results = searchService.searchATMLocations("94203");

        assertTrue(results.size() == 2);
    }

    private static final String RESPONSE_OK = "{\n" +
            "    \"atms\": [\n" +
            "        {\n" +
            "            \"atmLocation\": {\n" +
            "                \"address\": {\n" +
            "                    \"city\": \"San Francisco\",\n" +
            "                    \"country\": \"USA\",\n" +
            "                    \"postalCode\": \"94114\",\n" +
            "                    \"state\": \"CA\",\n" +
            "                    \"street\": \"443 Castro Street\"\n" +
            "                },\n" +
            "                \"coordinates\": {\n" +
            "                    \"latitude\": 37.761746,\n" +
            "                    \"longitude\": -122.435024\n" +
            "                },\n" +
            "                \"id\": \"818850\",\n" +
            "                \"isAvailable24Hours\": true,\n" +
            "                \"isDepositAvailable\": true,\n" +
            "                \"isHandicappedAccessible\": false,\n" +
            "                \"isOffPremise\": false,\n" +
            "                \"isSeasonal\": false,\n" +
            "                \"languageType\": null,\n" +
            "                \"locationDescription\": \"US BANK CASTRO\",\n" +
            "                \"logoName\": \"PAS\",\n" +
            "                \"name\": \"U.S. Bank Castro\"\n" +
            "            },\n" +
            "            \"distance\": 0.4101105159902258\n" +
            "        },\n" +
            "        {\n" +
            "            \"atmLocation\": {\n" +
            "                \"address\": {\n" +
            "                    \"city\": \"San Francisco\",\n" +
            "                    \"country\": \"USA\",\n" +
            "                    \"postalCode\": \"94110\",\n" +
            "                    \"state\": \"CA\",\n" +
            "                    \"street\": \"2601 Mission Street\"\n" +
            "                },\n" +
            "                \"coordinates\": {\n" +
            "                    \"latitude\": 37.755035,\n" +
            "                    \"longitude\": -122.41803\n" +
            "                },\n" +
            "                \"id\": \"819134\",\n" +
            "                \"isAvailable24Hours\": true,\n" +
            "                \"isDepositAvailable\": true,\n" +
            "                \"isHandicappedAccessible\": false,\n" +
            "                \"isOffPremise\": false,\n" +
            "                \"isSeasonal\": false,\n" +
            "                \"languageType\": null,\n" +
            "                \"locationDescription\": \"US BANK 22ND & MISSION\",\n" +
            "                \"logoName\": \"PAS\",\n" +
            "                \"name\": \"U.S. Bank 22nd & Mission Street\"\n" +
            "            },\n" +
            "            \"distance\": 0.7987523536486233\n" +
            "        }\n" +
            "    ],\n" +
            "    \"atms_count\": 2,\n" +
            "    \"error_code\": \"0\",\n" +
            "    \"http_code\": \"200\",\n" +
            "    \"limit\": 20,\n" +
            "    \"page\": 1,\n" +
            "    \"page_count\": 1,\n" +
            "    \"success\": true\n" +
            "}";

}