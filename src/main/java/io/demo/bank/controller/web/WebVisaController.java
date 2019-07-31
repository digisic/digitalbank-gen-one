package io.demo.bank.controller.web;

import java.security.Principal;
import java.util.List;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import io.demo.bank.model.AtmLocation;
import io.demo.bank.service.VisaService;
import io.demo.bank.util.Constants;
import io.demo.bank.util.Messages;

@Controller
@RequestMapping(Constants.URI_SEARCH)
public class WebVisaController extends WebCommonController {
	
	private static final Logger LOG = LoggerFactory.getLogger(VisaService.class);

	@Autowired
	private VisaService visaService;
	
	@PostMapping(Constants.URI_SEARCH_VISA)
	
	public String searchvisa(Principal principal, Model model, 
							 @ModelAttribute(MODEL_SEARCH_ZIPCODE) String zipcode,
							 @ModelAttribute(MODEL_SEARCH_AMOUNT) String visaamount) {

		LOG.debug("Visa Amount = " + visaamount );
		LOG.debug("Visa Account = " + zipcode );
		
				// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		try {
				
			List<AtmLocation> locations = visaService.searchATMLocations(zipcode, visaamount);
						
			model.addAttribute(MODEL_ATT_ATM_LIST, locations);
		}
		catch (Exception ex) {
			model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.VISA_SEARCH_UNAVAILABLE);
		}

		
		return Constants.VIEW_VISASEARCH;
	}

}
