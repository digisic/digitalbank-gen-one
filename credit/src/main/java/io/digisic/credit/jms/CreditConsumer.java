package io.digisic.credit.jms;

import java.io.IOException;
import java.util.HashMap;

import javax.jms.JMSException;
import org.springframework.jms.support.JmsHeaders;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.digisic.credit.model.CreditApplication;
import io.digisic.credit.service.CreditApplicationService;
import io.digisic.credit.util.Constants;


@Component
@ConditionalOnProperty(value="io.digisic.credit.app.process.enabled", havingValue = "true", matchIfMissing = false)
public class CreditConsumer {
	
	private static final Logger LOG = LoggerFactory.getLogger(CreditConsumer.class);
	
	@Autowired
	private CreditApplicationService creditApplicationService; 
	
	
	/*
	 * This method consumes any credit application JMS messages and
	 * begins the processing of the application. An acknowledgment response
	 * is place on the response queue with the application ID along with
	 * current status.
	 */
	@JmsListener(destination = "${io.digisic.partner.credit.app.request}")
	@SendTo("${io.digisic.partner.credit.app.response}")
	public String recieveCreditApplication(String application, @Header(JmsHeaders.CORRELATION_ID) String correlationId) throws JMSException {
		
		LOG.debug("New Credit Application Recieved -> " + application);
		LOG.debug("Application Correlation Id: " + correlationId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			
			CreditApplication app = mapper.readValue(application, CreditApplication.class);
			app.setCorrelationId(correlationId);
			
			creditApplicationService.submitCreditApplication(app);
			
			HashMap<String, String> map = new HashMap<String, String>();
	        map.put(Constants.STATUS_ATT_APP_ID, app.getId().toString());
	        map.put(Constants.STATUS_ATT_APP_NO, app.getApplicationNumber().toString());
	        map.put(Constants.STATUS_ATT_APP_STATUS, app.getApplicationStatus());
	        map.put(Constants.STATUS_ATT_APP_STATUS_DETAIL, app.getApplicationStatusDetails());
	        
	        return mapper.writeValueAsString(map);
			
		} catch (JsonParseException e) {
			
			LOG.error("CreditConsumer: Error - Unable to parse application as valid Json.");
			
			e.printStackTrace();
			
		} catch (JsonMappingException e) {
			
			LOG.error("CreditConsumer: Error - Unable to map application data to application object.");
			
			e.printStackTrace();
		} catch (IOException e) {
			
			LOG.error("CreditConsumer: Error - Unable to read application data.");
			
			e.printStackTrace();
		}
		
		LOG.error("CreditConsumer: Error - Unable to process application.");
		
		return "{application_status: ERROR: Unable to process application.}";

	}

}
