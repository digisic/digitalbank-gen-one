package io.demo.bank.test.ui.steps;


import static com.ca.codesv.protocols.http.fluent.HttpFluentInterface.*;

import java.io.*;
import java.net.*;

import com.ca.codesv.engine.junit4.VirtualServerRule;

import org.junit.*;

public class ExampleTest {

@Rule
  public VirtualServerRule vs = new VirtualServerRule();

  private static final String URL_EXAMPLE = "http://uat-api.synapsefi.com:443/v3.1/nodes/atms";

  @Before
  public void setupVirtualService() {
	// virtual service definition
	    forGet("http://uat-api.synapsefi.com:443/v3.1/nodes/atms")
	    .doReturn(okMessage().withJsonBody("limit\": 20,\r\n" + 
	    		"    \"atm_count\": 50,\r\n" + 
	    		"    \"atms\": [\r\n" + 
	    		"        {\r\n" + 
	    		"            \"atmLocation\": {\r\n" + 
	    		"                \"address\": {\r\n" + 
	    		"                    \"city\": \"SAN FRANCISCO\",\r\n" + 
	    		"                    \"country\": \"USA\",\r\n" + 
	    		"                    \"postalCode\": \"94114\",\r\n" + 
	    		"                    \"state\": \"CA\",\r\n" + 
	    		"                    \"street\": \"443 CASTRO STREET\"\r\n" + 
	    		"                },\r\n" + 
	    		"                \"coordinates\": {\r\n" + 
	    		"                    \"latitude\": 37.761746,\r\n" + 
	    		"                    \"longitude\": -122.435024\r\n" + 
	    		"                },\r\n" + 
	    		"                \"id\": \"398744\",\r\n" + 
	    		"                \"isAvailable24Hours\": true,\r\n" + 
	    		"                \"isDepositAvailable\": true,\r\n" + 
	    		"                \"isHandicappedAccessible\": false,\r\n" + 
	    		"                \"isOffPremise\": false,\r\n" + 
	    		"                \"isSeasonal\": false,\r\n" + 
	    		"                \"languageType\": null,\r\n" + 
	    		"                \"locationDescription\": \"US BANK CASTRO\",\r\n" + 
	    		"                \"logoName\": \"PAS\",\r\n" + 
	    		"                \"name\": \"U.S. Bank Castro\"\r\n" + 
	    		"            },\r\n" + 
	    		"            \"distance\": 0.12729728274872307\r\n" + 
	    		"        },\r\n" + 
	    		"        {\r\n" + 
	    		"            ...\r\n" + 
	    		"        }\r\n" + 
	    		"    ],\r\n" + 
	    		"    \"page\": 1,\r\n" + 
	    		"    \"page_count\": 3,\r\n" + 
	    		"    \"success\": true\r\n" + 
	    		"}")
	    );
  }

  @Test
  
  public void exampleTest() throws IOException  {
	  

{
	  
	URL obj = null;
	obj = new URL(URL_EXAMPLE);
	
	HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	
	con.setRequestMethod("GET");
	
	int responseCode = con.getResponseCode();

	
	System.out.println("\nSending 'GET' request to URL:" + URL_EXAMPLE);
	System.out.println("Response Code: " + responseCode);
	
	BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
	String inputLine;
	StringBuffer response = new StringBuffer();
	
	while((inputLine = in.readLine()) != null) {
		response.append(inputLine);
	}
	
	in.close();
	System.out.println(response.toString());
    
  }
 }}
