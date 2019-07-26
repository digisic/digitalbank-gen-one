package io.demo.bank.test.ui.steps;


import static com.ca.codesv.protocols.http.fluent.HttpFluentInterface.*;

import java.io.*;
import java.net.*;

import com.ca.codesv.engine.junit4.VirtualServerRule;
import com.ca.codesv.protocols.transaction.TxnRepoStore;
import com.ca.codesv.protocols.transaction.TxnRepoStoreBuilder;
import com.ca.codesv.sdk.annotation.TransactionCloudRepository;

import org.junit.*;

 @TransactionCloudRepository(
        workspaces = {"SWAT Workspace"},
        apiKey = "d8b314f66965170c27c3f6d7",
        apiSecret = "225f3c25a6b3c496a302def814e230e115501d6e3b5374c2b6f1ba16e471a4b4d27af7a6",
        uri = "https://ac-1400-bzctjenkins-develop.blazemeter.net"
 )

public class VISAPaymentTestexporttotransactionrepository {

@Rule
  public VirtualServerRule vs = new VirtualServerRule();

  private static final String URL_EXAMPLE = "http://api.visa.com/visadirect/fundstransfer/v1/pullfundstransactions";

  @Before
 
  public void setupVirtualService() {
	// virtual service definition
	    //forGet("http://api.visa.com/visadirect/fundstransfer/v1/pullfundstransactions")
	    //.doReturn(okMessage().withJsonBody (
	    //UseTransactionRule rule = new UseTransactionRule.RuleBuilder("Default Service")
	    //    .forTransaction("Demo transaction 1")
	    //    .build();
	    //  store.applyUseTransactionRule(rule);
	    		
	    //	)
	    //);
  }
    
  @Test
  public void visaPaymentTest() throws IOException  {
	  

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
