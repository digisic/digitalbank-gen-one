package io.demo.bank.controller;

import io.demo.bank.model.UserProfile;
import io.demo.bank.model.security.User;
import io.demo.bank.service.UserService;
import io.demo.bank.util.Mappings;
import java.security.Principal;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(Mappings.URI_ROOT)
public class UserController {
	
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
  
	@Autowired
	private UserService userService;
  
	@RequestMapping(value=Mappings.URI_ROOT, method=RequestMethod.GET)
	public String root() {
		
		return Mappings.DIR_REDIRECT + Mappings.URI_HOME;
	}
  
	@RequestMapping(value=Mappings.URI_LOGIN, method=RequestMethod.GET)
	public String login(Model model)
	{
		model.addAttribute("user", new User());
    
		return Mappings.VIEW_LOGIN;
	}
  
	@RequestMapping(value=Mappings.URI_SIGNUP, method=RequestMethod.GET)
	public String signupGet(Model model)
	{
		model.addAttribute("user", new User());
		model.addAttribute("userProfile", new UserProfile());
    
		return Mappings.VIEW_SIGNUP;
	}
  
	@RequestMapping(value=Mappings.URI_SIGNUP, method=RequestMethod.POST)
	public String signupPost(@ModelAttribute("user") User newUser, 
							 @ModelAttribute("userProfile") UserProfile newProfile, 
							 Model model) {
		
		boolean errorExists = false;
    
		// Set the email address to also be the username
		newUser.setUsername(newProfile.getEmailAddress());
    
	    LOG.debug("Signup POST begin: ");
	    LOG.debug("User: " + newUser);
	    LOG.debug("Profile: " + newProfile);
    
	    // Add user objects to the model
	    model.addAttribute("user", newUser);
	    model.addAttribute("userProfile", newProfile);
	    
	    // If email already exists then return error
	    if (userService.checkEmailAdressExists(newProfile.getEmailAddress())) {
	    	model.addAttribute("emailExists", true);
	    	errorExists = true;
	    }
    
	    // If SSN already exists then return an error
	    if (userService.checkSsnExists(newProfile.getSsn())) {
	    	model.addAttribute("ssnExists", true);
	    	errorExists = true;
	    }
	    
	    LOG.debug("Signup POST End: ");
    
	    // if we have an error go back to sign up page
	    if (errorExists) {
	    	return Mappings.VIEW_SIGNUP;
	    }
	    
	    return Mappings.VIEW_REGISTER;
	}
  
	@RequestMapping(value=Mappings.URI_REGISTER, method=RequestMethod.GET)
	public String registerGet(Model model) {
    
		// Since this a a registration process, add user object and send them to signup
		model.addAttribute("user", new User());
		model.addAttribute("userProfile", new UserProfile());
    
		return Mappings.VIEW_SIGNUP;
	}
  
	@RequestMapping(value=Mappings.URI_REGISTER, method=RequestMethod.POST)
	public String registerPost(@ModelAttribute("user") User newUser, 
							   @ModelAttribute("userProfile") UserProfile newProfile, 
							   Model model) {
		
		newUser.setUserProfile(newProfile);
    
		LOG.debug("Registering new User: " + newUser);
    
		newUser = userService.createUser(newUser);
		model.addAttribute("user", newUser);
    
		LOG.debug("User Registered: " + newUser);
    
		return Mappings.VIEW_LOGIN;
	}
  
	@RequestMapping(value=Mappings.URI_HOME, method=RequestMethod.GET)
	public String home(Principal principal, Model model) {
    
		User user = userService.findByUsername(principal.getName());
    
		model.addAttribute("firstname", user.getUserProfile().getFirstName());
    
		return Mappings.VIEW_HOME;
	}
}
