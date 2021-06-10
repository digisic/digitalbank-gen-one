package io.digisic.credit.jms;

import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.digisic.credit.model.CreditApplication;
import io.digisic.credit.util.Constants;

@Component
@ConditionalOnProperty(value="io.digisic.credit.app.process.enabled", havingValue = "true", matchIfMissing = false)
public class CreditProducer {
	
	private static final Logger LOG = LoggerFactory.getLogger(CreditProducer.class);
	
	@Autowired
    JmsTemplate jmsTemplate;

    @Value("${io.digisic.partner.credit.app.response}")
    String destinationQueue;

    public String sendCreditApplicationStatus(CreditApplication app){
    	
    	ObjectMapper mapper = new ObjectMapper();
    	
    	try {
    		
    		HashMap<String, String> map = new HashMap<String, String>();
	        map.put(Constants.STATUS_ATT_APP_ID, app.getId().toString());
	        map.put(Constants.STATUS_ATT_APP_NO, app.getApplicationNumber().toString());
	        map.put(Constants.STATUS_ATT_APP_STATUS, app.getApplicationStatus());
	        
	        if (app.getApplicationStatusDetails() != null)
	        	map.put(Constants.STATUS_ATT_APP_STATUS_DETAIL, app.getApplicationStatusDetails());
	        
	        if (app.getCreditScore() != null)
	        	map.put(Constants.STATUS_ATT_APP_CREDIT_SCORE, app.getCreditScore().toString());
	        
	        if (app.getRiskScore() != null)
	        	map.put(Constants.STATUS_ATT_APP_RISK_SCORE, app.getRiskScore().toString());
	        
	        if (app.getApprovedCardId() != null)
	        	map.put(Constants.STATUS_ATT_APP_CREDIT_ID, app.getApprovedCardId().toString());

    		
	        String jsonMessage = mapper.writeValueAsString(map);
			
			jmsTemplate.convertAndSend(destinationQueue, jsonMessage, m -> {
			      m.setJMSCorrelationID(app.getCorrelationId());
			      return m;
			});
			
			LOG.debug("Send Message Correlation Id: " + app.getCorrelationId());
			
		} catch (JsonProcessingException e) {
			
			LOG.error("Error: Could not send application status to credit consumer.");
			e.printStackTrace();
		}
    
    	return null;
    }

}
