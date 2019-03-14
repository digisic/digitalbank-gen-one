package io.demo.bank.controller;

import java.security.Principal;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
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
import org.springframework.web.bind.annotation.RequestMapping;
import io.demo.bank.model.UserProfile;
import io.demo.bank.model.security.Users;
import io.demo.bank.service.UserService;
import io.demo.bank.util.Constants;

@Controller
@RequestMapping(Constants.URI_USER)
public class UserController {
	
	// Class Logger
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
	
	// model attribute constants
	private static final String MODEL_ATT_USER_PROFILE 			= "userProfile";
	private static final String MODEL_ATT_FIRST_NAME 			= "firstName";
	private static final String MODEL_ATT_NOTIFICATIONS 		= "notifications";
//	private static final String MODEL_ATT_MESSAGES 				= "messages";
	private static final String MODEL_ATT_NEW_PASS 				= "newPassword";
	private static final String MODEL_ATT_CUR_PASS 				= "currentPassword";
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

	@GetMapping(Constants.URI_USR_PASSWORD)
	public String password(Principal principal, Model model) {
    
		Users user = userService.findByUsername(principal.getName());
		this.setUserDisplayDefaults(user, model);
		    
		return Constants.VIEW_USR_PASSWORD;
	}
	
	@PostMapping(Constants.URI_USR_PASSWORD)
	public String password(Principal principal, Model model,
						   @ModelAttribute(MODEL_ATT_NEW_PASS) String newPassword,
						   @ModelAttribute(MODEL_ATT_CUR_PASS) String oldPassword) {
    
		Users user = userService.findByUsername(principal.getName());
		this.setUserDisplayDefaults(user, model);
		
		LOG.debug("Change Password: Validate Password Entries.");
		
		// Validate Password entries
		if (userService.passwordMatches(user, oldPassword)) {
			
			LOG.debug("Change Password: Current Password is correct.");
			
			if (newPassword.equals(oldPassword)) {
				
				// new password matches current password, throw error
				
				LOG.debug("Change Password: New Password is the same as the current password.");
				
				model.addAttribute(MODEL_ATT_ERROR_MSG, "New Password is the same as the current password. Please enter a new Password.");
				
			} else {
				
				// change password
				LOG.debug("Change Password: New Password is a actualy a new password. Update Password.");
				
				userService.changePassword(user, newPassword);
				model.addAttribute(MODEL_ATT_SUCCESS_MSG, "Password Updated Successfully.");
				
			}
			
		} else {
			
			LOG.debug("Change Password: Current Password is NOT correct.");
			
			// old password not correct, throw error
			model.addAttribute(MODEL_ATT_ERROR_MSG, "Current Password does not match what is on record. Please enter the correct current password.");
			
		}
		    
		return Constants.VIEW_USR_PASSWORD;
	}
	
	@GetMapping(Constants.URI_USR_PROFILE)
	public String profile(Principal principal, Model model) {
    
		Users user = userService.findByUsername(principal.getName());
		this.setUserDisplayDefaults(user, model);
		
		model.addAttribute(MODEL_ATT_USER_PROFILE, user.getUserProfile());
		    
		return Constants.VIEW_USR_PROFILE;
	}
	
	@PostMapping(Constants.URI_USR_PROFILE)
	public String profile(Principal principal, Model model,
			 			  @ModelAttribute(MODEL_ATT_USER_PROFILE) UserProfile updateProfile) {
    
		Users user = userService.findByUsername(principal.getName());
		this.setUserDisplayDefaults(user, model);
		
		UserProfile up = user.getUserProfile();
		
		
		LOG.debug("Update User Profile: " + updateProfile.toString());
		
		// Set updated fields into actual user profile
		up.setTitle(updateProfile.getTitle());
		up.setFirstName(updateProfile.getFirstName());
		up.setLastName(updateProfile.getLastName());
		up.setHomePhone(updateProfile.getHomePhone());
		up.setMobilePhone(updateProfile.getMobilePhone());
		up.setWorkPhone(updateProfile.getWorkPhone());
		up.setAddress(updateProfile.getAddress());
		up.setLocality(updateProfile.getLocality());
		up.setRegion(updateProfile.getRegion());
		up.setPostalCode(updateProfile.getPostalCode());
		up.setCountry(updateProfile.getCountry());
		
		
		// Save Profile Updates
		user.setUserProfile(up);
		userService.save(user);
		
		LOG.debug("Updated User Profile: " + user.getUserProfile().toString());
		
		
		model.addAttribute(MODEL_ATT_USER_PROFILE, user.getUserProfile());
		model.addAttribute(MODEL_ATT_SUCCESS_MSG, "Profile Updated Successfully.");
		    
		return Constants.VIEW_USR_PROFILE;
	}
}
