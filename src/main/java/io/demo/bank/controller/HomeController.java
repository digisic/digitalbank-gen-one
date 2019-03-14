package io.demo.bank.controller;

import io.demo.bank.model.UserProfile;
import io.demo.bank.model.security.Users;
import io.demo.bank.service.UserService;
import io.demo.bank.util.Constants;
import java.security.Principal;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.time.ZoneId;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.info.BuildProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class HomeController {
	
	private static final Logger LOG = LoggerFactory.getLogger(HomeController.class);
	
	// model attribute constants
	private static final String MODEL_ATT_USER 					= "user";
	private static final String MODEL_ATT_USER_PROFILE 			= "userProfile";
	private static final String MODEL_ATT_FIRST_NAME 			= "firstName";
	private static final String MODEL_ATT_NOTIFICATIONS 		= "notifications";
//	private static final String MODEL_ATT_MESSAGES 				= "messages";
	private static final String MODEL_ATT_ERROR_MSG				= "errorMsg";
	private static final String MODEL_ATT_SUCCESS_MSG			= "successMsg";
	private static final String MODEL_ATT_AVATAR				= "avatar";
	private static final String MODEL_ATT_APP_VERSION			= "appVersion";
	private static final String MODEL_ATT_APP_NAME				= "appName";
	private static final String MODEL_ATT_APP_BUILD_DATE		= "appBuildDate";
	private static final String MODEL_VAL_AVATAR_MALE			= "/images/admin.jpg";
	private static final String MODEL_VAL_AVATAR_FEMALE			= "/images/avatar/5.jpg";
	
  
	@Autowired
	private UserService userService;
	
	@Autowired
	private BuildProperties buildProperties;
	
	private void setUserDisplayDefaults (Users user, Model model) {
		
		// Add name for Welcome header
		model.addAttribute(MODEL_ATT_FIRST_NAME, user.getUserProfile().getFirstName());
		
		// Add user's notifications for header
		model.addAttribute(MODEL_ATT_NOTIFICATIONS, user.getNotifications());
				
		// Add user's messages for header
//		model.addAttribute(MODEL_ATT_MESSAGES, user.getMessages());
		
		// Choose male or female avatar
		if (user.getUserProfile().getGender().equals(Constants.GENDER_MALE)) {
			model.addAttribute(MODEL_ATT_AVATAR, MODEL_VAL_AVATAR_MALE);
		}else {
			model.addAttribute(MODEL_ATT_AVATAR, MODEL_VAL_AVATAR_FEMALE);
		}
		
		// Get build date in a proper display format
		DateTimeFormatter dtFormatter = DateTimeFormatter.ofLocalizedDate(FormatStyle.MEDIUM)
														 .withLocale(Locale.US)
														 .withZone(ZoneId.systemDefault());
		
		// Add Application Version for About
		model.addAttribute(MODEL_ATT_APP_NAME, buildProperties.getName());
		model.addAttribute(MODEL_ATT_APP_VERSION, buildProperties.getVersion());
		model.addAttribute(MODEL_ATT_APP_BUILD_DATE, dtFormatter.format(buildProperties.getTime()));
		
		
	}
	
  
	@GetMapping(Constants.URI_ROOT)
	public String root() {
		
		return Constants.DIR_REDIRECT + Constants.URI_HOME;
	}
  
	@GetMapping(Constants.URI_LOGIN)
	public String login(Model model) {
		
		model.addAttribute(MODEL_ATT_USER, new Users());
    
		return Constants.VIEW_LOGIN;
	}
  
	@GetMapping(Constants.URI_SIGNUP)
	public String signup(Model model) {
		
		model.addAttribute(MODEL_ATT_USER, new Users());
		model.addAttribute(MODEL_ATT_USER_PROFILE, new UserProfile());
    
		return Constants.VIEW_SIGNUP;
	}
  
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
			model.addAttribute(MODEL_ATT_ERROR_MSG, "An account is already registered with the "
													+ "email address provided. Login with the existing "
													+ "account or provide another email address for registration.");
	    	bError = true;
	    }
	    
	    int firstSeparator = newProfile.getSsn().indexOf('-', 0);
	    int secondSeparator = newProfile.getSsn().indexOf('-', 4);
	    
	    // Check if SSN has separators or not
	    if (firstSeparator == -1 && secondSeparator == -1) {
	    	
	    	LOG.debug("Signup-> SSN is missing both separators");
	    	
	    	// no separator, so we need to add it
	    	String ssnPart1 = newProfile.getSsn().substring(0, 3);
	    	String ssnPart2 = newProfile.getSsn().substring(3, 5);
	    	String ssnPart3 = newProfile.getSsn().substring(5);
	    	
	    	newProfile.setSsn(ssnPart1 + "-" + ssnPart2 + "-" + ssnPart3); 
	    	
	    } else {
	    	
	    	// first separator is missing
	    	if (firstSeparator == 5) {
	    		
	    		LOG.debug("Signup-> SSN is missing 2nd separator");
	    		
	    		String ssnPart1 = newProfile.getSsn().substring(0,3);
		    	String ssnPart2 = newProfile.getSsn().substring(3);
		    	
		    	newProfile.setSsn(ssnPart1 + "-" + ssnPart2);
	    		
	    	}
	    	
	    	// second separator is missing
	    	if (firstSeparator == 3 && secondSeparator == -1) {
	    		
	    		LOG.debug("Signup-> SSN is missing 1st separator");
	    		
	    		String ssnPart1 = newProfile.getSsn().substring(0, 6);
		    	String ssnPart2 = newProfile.getSsn().substring(6);
		    	
		    	newProfile.setSsn(ssnPart1 + "-" + ssnPart2);
	    	}	
	    }
    
	    // If SSN already exists then return an error
	    if (userService.checkSsnExists(newProfile.getSsn())) {
	    	
	    	// Return error
			model.addAttribute(MODEL_ATT_ERROR_MSG, "An account is already registered with the "
													+ "Social Security Number provided. Login with "
													+ "the existing account or provide another SSN for registration.");
	    	bError = true;
	    }
	    
	    LOG.debug("Signup POST End: ");
    
	    // if we have an error go back to sign up page
	    if (bError) {
	    	return Constants.VIEW_SIGNUP;
	    }
	    
	    return Constants.VIEW_REGISTER;
	}
  
	@GetMapping(Constants.URI_REGISTER)
	public String register(Model model) {
    
		// Since this a a registration process, add user object and send them to signup
		model.addAttribute(MODEL_ATT_USER, new Users());
		model.addAttribute(MODEL_ATT_USER_PROFILE, new UserProfile());
    
		return Constants.VIEW_SIGNUP;
	}
  
	@PostMapping(Constants.URI_REGISTER)
	public String register(Model model,
						   @ModelAttribute(MODEL_ATT_USER) Users newUser, 
						   @ModelAttribute(MODEL_ATT_USER_PROFILE) UserProfile newProfile) {
		
		newUser.setUserProfile(newProfile);
    
		LOG.debug("Registering new User: " + newUser);
    
		newUser = userService.createUser(newUser);
		model.addAttribute(MODEL_ATT_USER, newUser);
		model.addAttribute(MODEL_ATT_SUCCESS_MSG, "Registration Successful. Please Login.");
    
		LOG.debug("User Registered: " + newUser);
    
		return Constants.VIEW_LOGIN;
	}
  
	@GetMapping(Constants.URI_HOME)
	public String home(Principal principal, Model model) {
    
		Users user = userService.findByUsername(principal.getName());
		this.setUserDisplayDefaults(user, model);
    
		return Constants.VIEW_HOME;
	}
	
}
