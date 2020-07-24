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
import org.springframework.web.bind.annotation.RequestMapping;

import io.digisic.bank.model.UserProfile;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.UserService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;

@Controller
@RequestMapping(Constants.URI_USER)
public class WebUserController extends WebCommonController {
	
	// Class Logger
	private static final Logger LOG = LoggerFactory.getLogger(WebUserController.class);
		  
	@Autowired
	private UserService userService;
		

	@GetMapping(Constants.URI_USR_PASSWORD)
	public String password(Principal principal, Model model) {
    
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		// Add format patterns
		model.addAttribute(MODEL_ATT_PATTERN_PASSWORD, Patterns.USER_PASSWORD);
		model.addAttribute(MODEL_ATT_PATTERN_PASSWORD_MSG, Messages.USER_PASSWORD_FORMAT);
		    
		return Constants.VIEW_USR_PASSWORD;
	}
	
	@PostMapping(Constants.URI_USR_PASSWORD)
	public String password(Principal principal, Model model,
						   @ModelAttribute(MODEL_ATT_NEW_PASS) String newPassword,
						   @ModelAttribute(MODEL_ATT_CUR_PASS) String oldPassword) {
    
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		Users user = userService.findByUsername(principal.getName());
		
		LOG.debug("Change Password: Validate Password Entries.");
		
		// Validate Password entries
		if (userService.passwordMatches(user, oldPassword)) {
			
			LOG.debug("Change Password: Current Password is correct.");
			
			if (newPassword.equals(oldPassword)) {
				
				// new password matches current password, throw error
				
				LOG.debug("Change Password: New Password is the same as the current password.");
				
				model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.USER_PASSWORD_SAME);
				
			} else {
				
				// change password
				LOG.debug("Change Password: New Password is a actualy a new password. Update Password.");
				
				userService.changePassword(user, newPassword);
				model.addAttribute(MODEL_ATT_SUCCESS_MSG, Messages.USER_PASSWORD_UPDATED);
				
			}
			
		} else {
			
			LOG.debug("Change Password: Current Password is NOT correct.");
			
			// old password not correct, throw error
			model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.USER_PASSWORD_NO_MATCH);
			
		}
		
		// Add format patterns
		model.addAttribute(MODEL_ATT_PATTERN_PASSWORD, Patterns.USER_PASSWORD);
		model.addAttribute(MODEL_ATT_PATTERN_PASSWORD_MSG, Messages.USER_PASSWORD_FORMAT);
		    
		return Constants.VIEW_USR_PASSWORD;
	}
	
	@GetMapping(Constants.URI_USR_PROFILE)
	public String profile(Principal principal, Model model) {
    
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		Users user = userService.findByUsername(principal.getName());
		
		model.addAttribute(MODEL_ATT_USER_PROFILE, user.getUserProfile());
		
		// Add format patterns
	    model.addAttribute(MODEL_ATT_PATTERN_PHONE, Patterns.USER_PHONE_REQ);
	    model.addAttribute(MODEL_ATT_PATTERN_PHONE_MSG, Messages.USER_PHONE_GENERIC_FORMAT);
		    
		return Constants.VIEW_USR_PROFILE;
	}
	
	@PostMapping(Constants.URI_USR_PROFILE)
	public String profile(Principal principal, Model model,
			 			  @ModelAttribute(MODEL_ATT_USER_PROFILE) UserProfile updateProfile) {
    
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		Users user = userService.findByUsername(principal.getName());
		
		user = userService.updateUserProfile(user, updateProfile);
		
		// Add format patterns
	    model.addAttribute(MODEL_ATT_PATTERN_PHONE, Patterns.USER_PHONE_REQ);
	    model.addAttribute(MODEL_ATT_PATTERN_PHONE_MSG, Messages.USER_PHONE_GENERIC_FORMAT);
	    
		model.addAttribute(MODEL_ATT_USER_PROFILE, user.getUserProfile());
		model.addAttribute(MODEL_ATT_SUCCESS_MSG, Messages.USER_PROFILE_UPDATED);
		    
		return Constants.VIEW_USR_PROFILE;
	}
}
