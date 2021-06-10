package io.digisic.bank.jms;

import java.util.UUID;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.digisic.bank.model.CreditCardApplication;


@Component
@ConditionalOnProperty(value="io.digisic.credit.enabled", havingValue = "true", matchIfMissing = false)
public class CreditAppProducer {
	
	private static final Logger LOG = LoggerFactory.getLogger(CreditAppProducer.class);
	
	@Autowired
    JmsTemplate jmsTemplate;

    @Value("${io.digisic.partner.credit.app.request}")
    String destinationQueue;

    public String sendCreditApplication(CreditCardApplication app){
    	
    	String correlationId = UUID.randomUUID().toString();
    	ObjectMapper mapper = new ObjectMapper();
    	
    	try {
    		
			String jsonMessage = mapper.writeValueAsString(app);
			
			jmsTemplate.convertAndSend(destinationQueue, jsonMessage, m -> {
				m.setJMSCorrelationID(correlationId);  
			    return m;
			});
			    
			LOG.debug("Send Message Correlation Id: " + correlationId);

			return correlationId;
			
		} catch (JsonProcessingException e) {
			
			LOG.error("Error: Could not send application to credit provider.");
			e.printStackTrace();
		}
    
    	return null;
    }

}
