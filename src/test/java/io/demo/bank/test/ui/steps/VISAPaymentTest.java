package io.demo.bank.test.ui.steps;


import static com.ca.codesv.protocols.http.fluent.HttpFluentInterface.*;

import java.io.*;
import java.net.*;

import com.ca.codesv.engine.junit4.VirtualServerRule;
import com.ca.codesv.protocols.transaction.TxnRepoStore;
import com.ca.codesv.protocols.transaction.TxnRepoStoreBuilder;

import org.junit.*;

public class VISAPaymentTest {

@Rule
  public VirtualServerRule vs = new VirtualServerRule();

  private static final String URL_EXAMPLE = "http://api.visa.com/visadirect/fundstransfer/v1/pullfundstransactions";

  @Before
 
  public void setupVirtualService() {
	// virtual service definition
	    forGet("http://api.visa.com/visadirect/fundstransfer/v1/pullfundstransactions")
	    .doReturn(okMessage().withJsonBody
	    	(
	    	"transactionIdentifier\": 875806056061895,\r\n" + 
	    	" \"actionCode\": \"00\",\r\n" + 
	    	"\"approvalCode\": \"98765X\",\r\n" + 
	    	"\"responseCode\": \"5\",\r\n" + 
	    	"\"transmissionDateTime\": \"2019-07-17T16:30:35.000Z\",\r\n" + 
	    	"\"cavvResultCode\": \"8\",\r\n" + 
	    	"\"cpsAuthorizationCharacteristicsIndicator\": \"3333\""
		
	    	)
	    );
  }
  
  private TxnRepoStore store = new TxnRepoStoreBuilder().exportDslAsFile("c:\\temp\\DBank").build(this);
  
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
