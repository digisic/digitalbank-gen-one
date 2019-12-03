package io.demo.bank.jms;

import java.util.concurrent.atomic.AtomicReference;

import javax.jms.JMSException;
import javax.jms.Message;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import io.demo.bank.model.CreditApplication;


@Component
public class CreditAppProducer {
	
	private static final Logger LOG = LoggerFactory.getLogger(CreditAppProducer.class);
	
	@Autowired
    JmsTemplate jmsTemplate;

    @Value("${io.demo.partner.credit.app.request}")
    String destinationQueue;

    public String sendCreditApplication(CreditApplication app){
    	
    	ObjectMapper mapper = new ObjectMapper();
    	final AtomicReference<Message> message = new AtomicReference<>();
    	
    	try {
    		
			String jsonMessage = mapper.writeValueAsString(app);
			
			jmsTemplate.convertAndSend(destinationQueue, jsonMessage, messagePostProcessor -> {
			      message.set(messagePostProcessor);
			      return messagePostProcessor;
			});

			/*
			 * Note the message Id of the sent message is copied to the correlation Id on the
			 * related responding message
			 */
			String messageId = message.get().getJMSMessageID();
			    
			LOG.debug("Send Message Correlation Id: " + messageId);

			return messageId;
			
		} catch (JsonProcessingException | JMSException e) {
			
			LOG.error("Error: Could not send application to credit provider.");
			e.printStackTrace();
		}
    
    	return null;
    }

}
