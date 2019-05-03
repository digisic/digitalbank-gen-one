package io.demo.bank.controller.rest;

import java.net.URI;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import io.demo.bank.config.exception.RestNotAcceptableException;
import io.demo.bank.model.UserProfile;
import io.demo.bank.model.security.User;
import io.demo.bank.service.UserService;
import io.demo.bank.util.Constants;
import io.demo.bank.util.Messages;
import io.demo.bank.util.Patterns;


@Validated
@RestController
public class RestUserController extends RestCommonController{
	
	private static final Logger LOG = LoggerFactory.getLogger(RestUserController.class);
	
	@Autowired
	UserService userService;
	
	
	/*
	 * ADMIN Role
	 * Get All Users
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ALL)
	public ResponseEntity<?> GetAllUsers(){
		return ResponseEntity.ok(userService.findUserList());
	}
	
	/*
	 * API Role
	 * Get Current User
	 */
	@GetMapping(Constants.URI_API_USR)
	public ResponseEntity<?> GetMyUser(){		
		return ResponseEntity.ok(getAuthenticatedUser());
	}
	
	/*
	 * ADMIN Role
	 * Create a new User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PostMapping(Constants.URI_API_USR)
	public ResponseEntity<?> CreateNewUser(@RequestParam(defaultValue=Patterns.ROLE_USER)
										   @Pattern (regexp=Patterns.USER_ROLE, 
										             message=Messages.USER_ROLE_FORMAT) String role, 
										  @RequestBody @Valid User newUser) {	
		
		LOG.debug("REST Create User -> Check email for uniqueness.");
		
		// Make sure email is not already registered with another account
		if (userService.checkEmailAdressExists(newUser.getUserProfile().getEmailAddress())) {
			throw new RestNotAcceptableException (Messages.USER_EMAIL_EXISTS);
		}
		
		LOG.debug("REST Create User -> Check SSN for uniqueness.");
		
		// Make sure SSN is not already registered with another account
		if(userService.checkSsnExists(newUser.getUserProfile().getSsn())) {
			throw new RestNotAcceptableException (Messages.USER_SSN_EXISTS);
		}
		
		LOG.debug("REST Create User -> Create user with username = '" + newUser.getUserProfile().getEmailAddress() + "'");
		userService.createUser(newUser, userService.findRoleName(role));
		
		// build location header for newly created user
		URI location = ServletUriComponentsBuilder.fromCurrentServletMapping()
												  .path(Constants.URI_API_USR + "/{id}").build()
												  .expand(newUser.getId())
												  .toUri();
		
		return ResponseEntity.created(location).body(newUser);
	}
	
	/*
	 * ADMIN role
	 * Get a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ID)
	public ResponseEntity<?> GetUser(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		return ResponseEntity.ok(getUser(id));
	}
	
	/*
	 * ADMIN role
	 * Delete a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@DeleteMapping(Constants.URI_API_USR_ID)
	public ResponseEntity<?> DeleteUser(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		
		User user = getUser(id);
		
		// Prevent the user from deleting their own account
		if (getAuthenticatedUser().getId() == user.getId()) {
			throw new RestNotAcceptableException (Messages.USER_DELETE_SELF);
		}
		
		userService.deleteUser(user);
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * ADMIN role
	 * Get a Users Profile
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_PROF)
	public ResponseEntity<?> GetUserProfile(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		return ResponseEntity.ok(getUser(id).getUserProfile());
	}
	
	/*
	 * API Role
	 * Get Current User's Profile
	 */
	@GetMapping(Constants.URI_API_USR_PROF_CURR)
	public ResponseEntity<?> GetMyProfile() {		
		return ResponseEntity.ok(getAuthenticatedUser().getUserProfile());
	}
	
	/*
	 * ADMIN Role
	 * Update a User's Profile
	 */
	@PutMapping(Constants.URI_API_USR_PROF)
	public ResponseEntity<?> UpdateUserProfile(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										       @RequestBody @Valid UserProfileBody profile) {
		
		return ResponseEntity.ok(userService.updateUserProfile(getUser(id), convertBodytoProfile(profile)));
	}
	
	/*
	 * API Role
	 * Update Current User's Profile
	 */
	@PutMapping(Constants.URI_API_USR_PROF_CURR)
	public ResponseEntity<?> UpdateMyProfile(@RequestBody @Valid UserProfileBody profile) {
		return ResponseEntity.ok(userService.updateUserProfile(getAuthenticatedUser(), convertBodytoProfile(profile)));
	}
	
	/*
	 * ADMIN Role
	 * Get a User's Authorities
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ROLE)
	public ResponseEntity<?> GetUserAuthority(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		return ResponseEntity.ok(getUser(id).getAuthorities());
	}
	
	/*
	 * API Role
	 * Get Current User's Authorities
	 */
	@GetMapping(Constants.URI_API_USR_ROLE_CURR)
	public ResponseEntity<?> GetMyAuthority() {
		return ResponseEntity.ok(getAuthenticatedUser().getAuthorities());
	}
	
	/*
	 * ADMIN Role
	 * Add new Authority for User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_ROLE)
	public ResponseEntity<?> AddUserAuthority(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										      @RequestParam(required= true)
										      @Pattern (regexp=Patterns.USER_ROLE,
										  			    message=Messages.USER_ROLE_FORMAT) String role) {
		User user = getUser(id);
		String selRole = userService.findRoleName(role);
		
		// Check to see if the user already has the role requested
		if (userService.hasRole(user, selRole)) {
			throw new RestNotAcceptableException (Messages.USER_ROLE_EXISTS + "'" + role + "'");
		}
		
		// Add Role
		userService.addRole(user, selRole);
		
		return ResponseEntity.ok(user.getAuthorities());
	}
	
	/*
	 * ADMIN Role
	 * Remove Authority from User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@DeleteMapping(Constants.URI_API_USR_ROLE)
	public ResponseEntity<?> RemoveUserAuthority(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										         @RequestParam(required= true)
										         @Pattern (regexp=Patterns.USER_ROLE,
										  			       message=Messages.USER_ROLE_FORMAT) String role) {
		User user = getUser(id);
		String selRole = userService.findRoleName(role);
		
		// Check to see if the user even has the role to be deleted
		if (!userService.hasRole(user, selRole)) {
			throw new RestNotAcceptableException (Messages.USER_ROLE_NOT_EXISTS + "'" + role + "'");
		}
		
		// Check to see if it is the last role
		if (user.getAuthorities().size() < 2) {
			throw new RestNotAcceptableException (Messages.USER_ROLE_LAST + "'" + role + "'");
		}
		
		// Delete Role
		userService.removeRole(user, selRole);
		
		return ResponseEntity.ok(user.getAuthorities());
	}
	
	/*
	 * API Role
	 * Change Current User's Password
	 */
	@PutMapping(Constants.URI_API_USR_CHG_PASS)
	public ResponseEntity<?> ChangeMyPassword(@RequestBody @Valid ChangePasswordBody changePassword) {
		
		User authUser = getAuthenticatedUser();
		
		// Check to see if the user provided the correct password
		if (userService.passwordMatches(authUser, changePassword.getCurrentPasword())) {
			
			// Check to see if the new password is the same as the old password
			if (userService.passwordMatches(authUser, changePassword.getNewPassword())) {
				throw new RestNotAcceptableException (Messages.USER_PASSWORD_SAME);
			}
			
			// Change the password
			userService.changePassword(authUser, changePassword.getNewPassword());
		} else {
			// They did not provide the correct current password in the request
			throw new RestNotAcceptableException (Messages.USER_PASSWORD_NO_MATCH);
		}
		
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * ADMIN Role
	 * Set a User's Password
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_SET_PASS)
	public ResponseEntity<?> SetUserPassword(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
									         @RequestParam(required= true)
			  							     @Pattern(regexp=Patterns.USER_PASSWORD, 
			  							              message=Messages.USER_PASSWORD_FORMAT) String newPassword) {
		
		userService.changePassword(getUser(id), newPassword);	
		return ResponseEntity.noContent().build();
	}
	
	
	/*
	 * ADMIN Role
	 * Enable or Disable a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_ENABLE)
	public ResponseEntity<?> SetUserEnabled(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
	         								@RequestParam(required=true) boolean enabled) {

		userService.enableUser(getUser(id), enabled);
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * ADMIN Role
	 * Lock or Unlock a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_UNLOCK)
	public ResponseEntity<?> SetUserUnlocked(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
	         								@RequestParam(required=true) boolean unlock) {

		userService.unlockUser(getUser(id), unlock);
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * ADMIN Role
	 * Expire or Unexpire a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_UNEXPIRE)
	public ResponseEntity<?> SetUserUnexpired(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
	         								 @RequestParam(required=true) boolean unexpire) {

		userService.unexpireUser(getUser(id), unexpire);
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * ADMIN Role
	 * Expire or Unexpire Password
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_PASS_UNEXPIRE)
	public ResponseEntity<?> SetPasswordUnexpired(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
	         								      @RequestParam(required=true) boolean unexpire) {

		userService.unexpirePassword(getUser(id), unexpire);
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * Helper method to move the User Profile partial object into 
	 * a User Profile object
	 */
	private UserProfile convertBodytoProfile (UserProfileBody body) {
		
		UserProfile profile = new UserProfile();
		
		profile.setFirstName(body.getFirstName());
		profile.setLastName(body.getLastName());
		profile.setTitle(body.getTitle());
		profile.setGender(body.getGender());
		profile.setHomePhone(body.getHomePhone());
		profile.setMobilePhone(body.getMobilePhone());
		profile.setWorkPhone(body.getWorkPhone());
		profile.setAddress(body.getAddress());
		profile.setLocality(body.getLocality());
		profile.setRegion(body.getRegion());
		profile.setPostalCode(body.getPostalCode());
		profile.setCountry(body.getCountry());
		
		return profile;
	}
	
	/*
	 * Custom Request Body for Updating User Profile
	 * This allows us to only focus validation on required
	 * fields that we are permitting update
	 */
	private static class UserProfileBody {
		
		@NotEmpty (message=Messages.USER_FIRST_NAME_REQUIRED)
		private String firstName;
		
		@NotEmpty (message=Messages.USER_LAST_NAME_REQUIRED)
		private String lastName;
		
		@NotEmpty (message=Messages.USER_TITLE_REQUIRED)
		@Pattern(regexp=Patterns.USER_TITLE, message=Messages.USER_TITLE_FORMAT)
		private String title;
		
		@NotEmpty (message=Messages.USER_GENDER_REQUIRED)
		@Pattern(regexp=Patterns.USER_GENDER, message=Messages.USER_GENDER_FORMAT)
		private String gender;
		
		@NotEmpty (message=Messages.USER_PHONE_HOME_REQUIRED)
		@Pattern(regexp=Patterns.USER_PHONE_REQ, message=Messages.USER_PHONE_HOME_FORMAT)
		private String homePhone;
		
		@Pattern(regexp=Patterns.USER_PHONE_NOT_REQ, message=Messages.USER_PHONE_MOBILE_FORMAT)
		private String mobilePhone;
		
		@Pattern(regexp=Patterns.USER_PHONE_NOT_REQ, message=Messages.USER_PHONE_WORK_FORMAT)
		private String workPhone;
		
		@NotEmpty (message=Messages.USER_ADDRESS_REQUIRED)
		private String address;
		
		@NotEmpty (message=Messages.USER_LOCALITY_REQUIRED)
		private String locality;
		
		@NotEmpty (message=Messages.USER_REGION_REQUIRED)
		private String region;
		
		@NotEmpty (message=Messages.USER_POSTAL_CODE_REQUIRED)
		private String postalCode;
		
		@NotEmpty (message=Messages.USER_COUNTRY_REQUIRED)
		private String country;
		
		public String getFirstName() {
			return firstName;
		}

		public String getLastName() {
			return lastName;
		}

		public String getTitle() {
			return title;
		}

		public String getGender() {
			return gender;
		}

		public String getHomePhone() {
			return homePhone;
		}

		public String getMobilePhone() {
			return mobilePhone;
		}

		public String getWorkPhone() {
			return workPhone;
		}

		public String getAddress() {
			return address;
		}

		public String getLocality() {
			return locality;
		}

		public String getRegion() {
			return region;
		}

		public String getPostalCode() {
			return postalCode;
		}

		public String getCountry() {
			return country;
		}
		
	}
	
	/*
	 * Custom Request Body for Change Password
	 */
	private static class ChangePasswordBody {
		
		@NotEmpty(message=Messages.USER_PASS_CUR_REQUIRED)
		private String currentPasword;
		
		@NotEmpty(message=Messages.USER_PASS_NEW_REQUIRED)
		@Pattern(regexp=Patterns.USER_PASSWORD, message=Messages.USER_PASSWORD_FORMAT)
		private String newPassword;
		
		public String getCurrentPasword() {
			return currentPasword;
		}

		public String getNewPassword() {
			return newPassword;
		}		
	}
		
}
