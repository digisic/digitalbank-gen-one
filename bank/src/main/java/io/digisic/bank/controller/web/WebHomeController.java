package io.digisic.bank.controller.web;

import java.security.Principal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import io.digisic.bank.model.UserProfile;
import io.digisic.bank.model.security.Role;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.AccountService;
import io.digisic.bank.service.UserService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;


@Controller
public class WebHomeController extends WebCommonController {
	
	private static final Logger LOG = LoggerFactory.getLogger(WebHomeController.class);
	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AccountService accountService;
	
	/*
	 * Root of application. Redirects to home.
	 */
	@GetMapping(Constants.URI_ROOT)
	public String root() {
		
		
		return Constants.DIR_REDIRECT + Constants.URI_HOME;
	}
  
	/*
	 * Login Page
	 */
	@GetMapping(Constants.URI_LOGIN)
	public String login(Model model) {
		
		model.addAttribute(MODEL_ATT_USER, new Users());
    
		return Constants.VIEW_LOGIN;
	}
	
	/*
	 * Registration Page
	 */
	@GetMapping(Constants.URI_SIGNUP)
	public String signup(Model model) {
		
		model.addAttribute(MODEL_ATT_USER, new Users());
		model.addAttribute(MODEL_ATT_USER_PROFILE, new UserProfile());
		
		// Add format patterns
	    model.addAttribute(MODEL_ATT_PATTERN_SSN, Patterns.USER_SSN);
	    model.addAttribute(MODEL_ATT_PATTERN_EMAIL, Patterns.USER_EMAIL);
	    model.addAttribute(MODEL_ATT_PATTERN_PASSWORD, Patterns.USER_PASSWORD);
	    model.addAttribute(MODEL_ATT_PATTERN_DOB, Patterns.USER_DOB);
	    model.addAttribute(MODEL_ATT_PATTERN_SSN_MSG, Messages.USER_SSN_FORMAT);
	    model.addAttribute(MODEL_ATT_PATTERN_PASSWORD_MSG, Messages.USER_PASSWORD_FORMAT);
    
		return Constants.VIEW_SIGNUP;
	}
  
	/*
	 * Registration Page
	 */
	@PostMapping(Constants.URI_SIGNUP)
	public String signup(Model model,
						 @ModelAttribute(MODEL_ATT_USER) Users newUser, 
						 @ModelAttribute(MODEL_ATT_USER_PROFILE) UserProfile newProfile) {
		
		boolean bError = false;
    
		// Set the email address to also be the username
		newUser.setUsername(newProfile.getEmailAddress());
    
	    LOG.debug("Signup POST begin: ");
	    LOG.debug("User: " + newUser);
	    LOG.debug("Profile: " + newProfile);
    
	    // Add user objects to the model
	    model.addAttribute(MODEL_ATT_USER, newUser);
	    model.addAttribute(MODEL_ATT_USER_PROFILE, newProfile);
	    
	    // If email already exists then return error
	    if (userService.checkEmailAdressExists(newProfile.getEmailAddress())) {
	    	
	    	// Return error
			model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.USER_EMAIL_EXISTS);
	    	bError = true;
	    }
	        
	    // If SSN already exists then return an error
	    if (userService.checkSsnExists(newProfile.getSsn())) {
	    	
	    	// Return error
			model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.USER_SSN_EXISTS);
	    	bError = true;
	    }
	    
	    LOG.debug("Signup POST End: ");
    
	    // if we have an error go back to sign up page
	    if (bError) {
	    	
	    	// Add format patterns
		    model.addAttribute(MODEL_ATT_PATTERN_SSN, Patterns.USER_SSN);
		    model.addAttribute(MODEL_ATT_PATTERN_EMAIL, Patterns.USER_EMAIL);
		    model.addAttribute(MODEL_ATT_PATTERN_PASSWORD, Patterns.USER_PASSWORD);
		    model.addAttribute(MODEL_ATT_PATTERN_DOB, Patterns.USER_DOB);
		    model.addAttribute(MODEL_ATT_PATTERN_SSN_MSG, Messages.USER_SSN_FORMAT);
		    model.addAttribute(MODEL_ATT_PATTERN_PASSWORD_MSG, Messages.USER_PASSWORD_FORMAT);
		    
	    	return Constants.VIEW_SIGNUP;
	    }
	    
	    // Add format patterns
	    model.addAttribute(MODEL_ATT_PATTERN_PHONE, Patterns.USER_PHONE_REQ);
	    model.addAttribute(MODEL_ATT_PATTERN_PHONE_MSG, Messages.USER_PHONE_GENERIC_FORMAT);
	    
	    return Constants.VIEW_REGISTER;
	}
  
	@GetMapping(Constants.URI_REGISTER)
	public String register(Model model) {
    
		// Since this a a registration process, add user object and send them to signup
		model.addAttribute(MODEL_ATT_USER, new Users());
		model.addAttribute(MODEL_ATT_USER_PROFILE, new UserProfile());
		
		// Add format patterns
	    model.addAttribute(MODEL_ATT_PATTERN_SSN, Patterns.USER_SSN);
	    model.addAttribute(MODEL_ATT_PATTERN_EMAIL, Patterns.USER_EMAIL);
	    model.addAttribute(MODEL_ATT_PATTERN_PASSWORD, Patterns.USER_PASSWORD);
	    model.addAttribute(MODEL_ATT_PATTERN_DOB, Patterns.USER_DOB);
	    model.addAttribute(MODEL_ATT_PATTERN_SSN_MSG, Messages.USER_SSN_FORMAT);
	    model.addAttribute(MODEL_ATT_PATTERN_PASSWORD_MSG, Messages.USER_PASSWORD_FORMAT);
    
		return Constants.VIEW_SIGNUP;
	}
  
	@PostMapping(Constants.URI_REGISTER)
	public String register(Model model,
						   @ModelAttribute(MODEL_ATT_USER) Users newUser, 
						   @ModelAttribute(MODEL_ATT_USER_PROFILE) UserProfile newProfile) {
		
		newUser.setUserProfile(newProfile);
    
		LOG.debug("Registering new User: " + newUser);
    
		userService.createUser(newUser, Role.ROLE_USER);
		model.addAttribute(MODEL_ATT_USER, newUser);
		model.addAttribute(MODEL_ATT_SUCCESS_MSG, Messages.USER_REGIST_SUCC);
   
		LOG.debug("User Registered: " + newUser);
    
		return Constants.VIEW_LOGIN;
	}
  
	@GetMapping(Constants.URI_HOME)
	public String home(Principal principal, Model model) {
    
		this.setDisplayDefaults(principal, model);
		
		// Get the user that has been authenticated
		Users user = userService.findByUsername(principal.getName());
		
		// Balance Summary Chart Data
		model.addAttribute(MODEL_ATT_CHART_ACCT_BAL, accountService.getChartDataAccountBalanceSummary(user));
		model.addAttribute(MODEL_ATT_CHART_CRED_VS_DEB, accountService.getChartDataCreditVsDebit(user));
		model.addAttribute(MODEL_ATT_CHART_TRANS_BY_CAT, accountService.getChartDataTransactionByCategory(user));
    
		return Constants.VIEW_HOME;
	}
	
}
