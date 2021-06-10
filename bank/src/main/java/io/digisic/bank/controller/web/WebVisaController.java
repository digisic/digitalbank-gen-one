package io.digisic.bank.controller.web;

import java.security.Principal;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.digisic.bank.service.VisaService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping(Constants.URI_XFER_EXTERNAL)
public class WebVisaController extends WebCommonController {
	
	private static final Logger LOG = LoggerFactory.getLogger(VisaService.class);

	@Autowired
	private VisaService visaService;
	
	@GetMapping(Constants.URI_XFER_VISA)
	public String checkingAdd(Principal principal, Model model) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		// Add format patterns
		model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
		model.addAttribute(MODEL_ATT_EXT_ACCOUNT, new String());
		model.addAttribute(MODEL_ATT_EXT_AMOUNT, new String());
    
		return Constants.VIEW_XFER_VISA;
	}
	
	
	@PostMapping(Constants.URI_XFER_VISA_PROC)
	public String searchvisa(Principal principal, Model model, 
							 @ModelAttribute(MODEL_ATT_EXT_ACCOUNT) String extAccount,
							 @ModelAttribute(MODEL_ATT_EXT_AMOUNT) String extAmount) {

		
		LOG.debug("Visa Web Controller :-> Visa Account = " + extAccount);
		LOG.debug("Visa Web Controller :-> Visa Amount = " + extAmount);
		
		
				// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		try {
				
			List<String> results = visaService.directVisaPayment(extAccount, extAmount);
						
			model.addAttribute(MODEL_ATT_EXT_RESPONSE, results);
		}
		catch (Exception ex) {
			model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.VISA_SVC_UNAVAILABLE);
		}

		
		return Constants.VIEW_XFER_VISA_PROC;
	}
	
	

}