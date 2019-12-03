package io.demo.bank.controller.web;


import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import io.demo.bank.model.CreditApplication;
import io.demo.bank.model.CreditCardDetails;
import io.demo.bank.model.CreditReference;
import io.demo.bank.model.security.Users;
import io.demo.bank.service.CreditService;
import io.demo.bank.service.UserService;
import io.demo.bank.util.Constants;



@Controller
@RequestMapping(Constants.URI_CREDIT)
public class WebCreditController extends WebCommonController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CreditService creditService;
	
	
	
	@GetMapping(Constants.URI_CREDIT_APP)
	public String getCreditApp(Principal principal, Model model) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		// Pass in user profile details to prefill application
		Users user = userService.findByUsername(principal.getName());
		
		model.addAttribute(MODEL_CREDIT_APP, new CreditApplication(user.getUserProfile()));
		    
		return Constants.VIEW_CREDIT_APP;
	}
	
	@PostMapping(Constants.URI_CREDIT_APP)
	public String postCreditApp(Principal principal, Model model,
								@ModelAttribute(MODEL_CREDIT_APP) CreditApplication app) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		Users user = userService.findByUsername(principal.getName());
		
		creditService.submitCreditApplication(user, app);
		
		return Constants.DIR_REDIRECT + Constants.URI_CREDIT + Constants.URI_CREDIT_APP_STATUS;
	}
	
	@GetMapping(Constants.URI_CREDIT_APP_STATUS)
	public String getCreditAppStatus(Principal principal, Model model) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		Users user = userService.findByUsername(principal.getName());
		
		CreditReference creditReference = creditService.getCurrentCreditAppStatus(user);
		
		model.addAttribute(MODEL_CREDIT_APP_NUMBER, creditReference.getApplicationNumber());
		model.addAttribute(MODEL_CREDIT_APP_DATE, creditReference.getApplicationDate());
		model.addAttribute(MODEL_CREDIT_APP_CREDIT_SCORE, creditReference.getCreditScore());
		model.addAttribute(MODEL_CREDIT_APP_RISK_SCORE, creditReference.getRiskScore());
		model.addAttribute(MODEL_CREDIT_APP_STATUS_VALUE, creditReference.getApplicationStatus());
		model.addAttribute(MODEL_CREDIT_APP_STATUS_DETAIL, creditReference.getApplicationStatusDetail());
		
		
		    
		return Constants.VIEW_CREDIT_APP_ST;
	}
	
	@GetMapping(Constants.URI_CREDIT_VIEW)
	public String getCreditView(Principal principal, Model model) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		Users user = userService.findByUsername(principal.getName());
		CreditReference creditReference = creditService.getCurrentCreditAppStatus(user);
		CreditCardDetails ccDetails = creditService.getCreditCardDetails(creditReference.getCreditCardId());
		
		if (ccDetails != null) {
			
			model.addAttribute(MODEL_CREDIT_CARD_NO, Constants.CREDIT_CARD_NO_MASK + ccDetails.getCardNumber().substring(12));
			model.addAttribute(MODEL_CREDIT_CARD_LIMIT, ccDetails.getLimit().doubleValue());
			model.addAttribute(MODEL_CREDIT_CARD_APR, ccDetails.getApr().doubleValue());
			
			return Constants.VIEW_CREDIT_VIEW;
			
			
		} else {
			
			// return for a new credit application
			model.addAttribute(MODEL_CREDIT_APP, new CreditApplication(user.getUserProfile()));
			return Constants.VIEW_CREDIT_APP;
		}  // end if

	}
	
}
