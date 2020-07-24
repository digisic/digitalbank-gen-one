package io.digisic.bank.jms;

import java.io.IOException;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.digisic.bank.model.CreditCardReference;
import io.digisic.bank.service.CreditCardService;
import io.digisic.bank.util.Constants;

import org.springframework.jms.support.JmsHeaders;



@Component
@ConditionalOnProperty(value="io.digisic.credit.enabled", havingValue = "true", matchIfMissing = false)
public class CreditAppConsumer {
	
	private static final Logger LOG = LoggerFactory.getLogger(CreditAppConsumer.class);
	
	@Autowired
	CreditCardService ccService;
	
	/*
	 * This method listens for credit application status updates from
	 * the credit provider
	 */
			
	@JmsListener(destination = "${io.digisic.partner.credit.app.response}")
	public void receiveCreditApplicationStatus(String msg, @Header(JmsHeaders.CORRELATION_ID) String correlationId){
		
		LOG.debug("Recieved New Message: " + msg);
		LOG.debug("Recieved Message Correlation Id: " + correlationId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			
			Map<?, ?> map = (Map<?, ?>) mapper.readValue(msg, Map.class);
			
			LOG.debug("Getting Credit Reference By Correlation: " + correlationId);
			CreditCardReference cr = ccService.getCreditReference(correlationId);
			
			// If we find a submitted application reference, then update it
			if (cr != null) {
				
				LOG.debug("Found Credit Reference: " + cr.getCorrelationId());
				
				// Set updated status
				cr.setApplicationId(Long.valueOf((String) map.get(Constants.STATUS_ATT_APP_ID)));
				cr.setApplicationNumber((String) map.get(Constants.STATUS_ATT_APP_NO));
				cr.setApplicationStatus((String) map.get(Constants.STATUS_ATT_APP_STATUS));
				
				if (map.containsKey(Constants.STATUS_ATT_APP_STATUS_DETAIL)) {
					cr.setApplicationStatusDetail((String) map.get(Constants.STATUS_ATT_APP_STATUS_DETAIL));
				}
				
				if (map.containsKey(Constants.STATUS_ATT_APP_CREDIT_SCORE)) {
					cr.setCreditScore((String) map.get(Constants.STATUS_ATT_APP_CREDIT_SCORE));
				}
				
				if (map.containsKey(Constants.STATUS_ATT_APP_RISK_SCORE)) {
					cr.setRiskScore((String) map.get(Constants.STATUS_ATT_APP_RISK_SCORE));
				}
				
				if (map.containsKey(Constants.STATUS_ATT_APP_CREDIT_ID)) {
					cr.setCreditCardId(Long.valueOf((String) map.get(Constants.STATUS_ATT_APP_CREDIT_ID)));
				}
				
				LOG.debug("Updating Credit Reference: " + cr.getCorrelationId());
				
				ccService.updateCreditReference(cr);
				
			} 
		
		} catch (IOException e) {
			LOG.error("Error: Could not proceses credit application status update.");
			e.printStackTrace();
		}
		
	}

}
