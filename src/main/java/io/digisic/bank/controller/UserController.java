package io.digisic.bank.controller;

import java.net.URI;
import java.util.Date;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
import com.fasterxml.jackson.annotation.JsonFormat;

import io.digisic.bank.exception.RestNotAcceptableException;
import io.digisic.bank.model.UserProfile;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.UserService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;


@Validated
@RestController
public class UserController extends CommonController{
	
	private static final Logger LOG = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	
	/*
	 * ADMIN Role
	 * Get All Users
	 */
	
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ALL)											
	public ResponseEntity<?> getAllUsers(){
		return ResponseEntity.ok(userService.findUserList());
	}
	
	/*
	 * API Role
	 * Get Current User
	 */
	@GetMapping(Constants.URI_API_USR)
	public ResponseEntity<?> getUser(){		
		return ResponseEntity.ok(getAuthenticatedUser());
	}
	
	/*
	 * ADMIN Role
	 * Get All Users
	 */
	
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_FIND)											
	public ResponseEntity<?> getUserByUsername(@RequestParam(required=true) String username){
		return ResponseEntity.ok(userService.findByUsername(username));
	}
	
	/*
	 * ADMIN Role
	 * Create a new User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PostMapping(Constants.URI_API_USR)
	public ResponseEntity<?> createNewUser(@RequestParam(defaultValue=Patterns.ROLE_USER)
										   @Pattern (regexp=Patterns.USER_ROLE, 
										             message=Messages.USER_ROLE_FORMAT) String role, 
										  @RequestBody @Valid NewUser newUser) {	
		
		LOG.debug("REST Create User -> Check email for uniqueness.");
		
		// Make sure email is not already registered with another account
		if (userService.checkEmailAdressExists(newUser.getEmailAddress())) {
			throw new RestNotAcceptableException (Messages.USER_EMAIL_EXISTS);
		}
		
		LOG.debug("REST Create User -> Check SSN for uniqueness.");
		
		// Make sure SSN is not already registered with another account
		if(userService.checkSsnExists(newUser.getSsn())) {
			throw new RestNotAcceptableException (Messages.USER_SSN_EXISTS);
		}
		
		Users user = this.getUserFromNewUser(newUser);
		
		LOG.debug("REST Create User -> Create user with username = '" + user.getUserProfile().getEmailAddress() + "'");
		userService.createUser(user, userService.findRoleName(role));
		
		// build location header for newly created user
		URI location = ServletUriComponentsBuilder.fromCurrentServletMapping()
												  .path(Constants.URI_API_USR + "/{id}").build()
												  .expand(user.getId())
												  .toUri();
		
		return ResponseEntity.created(location).body(user);
	}
	
	/*
	 * ADMIN role
	 * Get a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ID)
	public ResponseEntity<?> getUser(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		return ResponseEntity.ok(getUserById(id));
	}
	
	/*
	 * ADMIN role
	 * Delete a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@DeleteMapping(Constants.URI_API_USR_ID)
	public ResponseEntity<?> deleteUser(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		
		Users user = getUserById(id);
		
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
	public ResponseEntity<?> getUserProfile(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		return ResponseEntity.ok(getUserById(id).getUserProfile());
	}
	
	/*
	 * API Role
	 * Get Current User's Profile
	 */
	@GetMapping(Constants.URI_API_USR_PROF_CURR)
	public ResponseEntity<?> getUserProfile() {		
		return ResponseEntity.ok(getAuthenticatedUser().getUserProfile());
	}
	
	/*
	 * ADMIN Role
	 * Update a User's Profile
	 */
	@PutMapping(Constants.URI_API_USR_PROF)
	public ResponseEntity<?> updateUserProfile(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										       @RequestBody @Valid UpdateUser profile) {
		Users user = getUserById(id);
		
		userService.updateUserProfile(user, getProfileFromUpdateUser(profile));
		
		return ResponseEntity.ok(user.getUserProfile());
	}
	
	/*
	 * API Role
	 * Update Current User's Profile
	 */
	@PutMapping(Constants.URI_API_USR_PROF_CURR)
	public ResponseEntity<?> updateUserProfile(@RequestBody @Valid UpdateUser profile) {
		
		Users user = getAuthenticatedUser();
		
		userService.updateUserProfile(user, getProfileFromUpdateUser(profile));
		
		return ResponseEntity.ok(user.getUserProfile());
	}
	
	/*
	 * ADMIN Role
	 * Get a User's Authorities
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ROLE)
	public ResponseEntity<?> getAuthority(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		return ResponseEntity.ok(getUserById(id).getAuthorities());
	}
	
	/*
	 * API Role
	 * Get Current User's Authorities
	 */
	@GetMapping(Constants.URI_API_USR_ROLE_CURR)
	public ResponseEntity<?> getAuthority() {
		return ResponseEntity.ok(getAuthenticatedUser().getAuthorities());
	}
	
	/*
	 * ADMIN Role
	 * Add new Authority for User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_ROLE)
	public ResponseEntity<?> addAuthority(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										  @RequestParam(required= true)
										  @Pattern (regexp=Patterns.USER_ROLE,
										  			message=Messages.USER_ROLE_FORMAT) String role) {
		Users user = getUserById(id);
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
	public ResponseEntity<?> removeAuthority(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										     @RequestParam(required= true)
										     @Pattern (regexp=Patterns.USER_ROLE,
										  			   message=Messages.USER_ROLE_FORMAT) String role) {
		Users user = getUserById(id);
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
	public ResponseEntity<?> changePassword(@RequestBody @Valid ChangePassword changePassword) {
		
		Users authUser = getAuthenticatedUser();
		
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
	public ResponseEntity<?> setPassword(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
									     @RequestParam(required= true)
			  							 @Pattern(regexp=Patterns.USER_PASSWORD, 
			  							          message=Messages.USER_PASSWORD_FORMAT) String newPassword) {
		
		userService.changePassword(getUserById(id), newPassword);	
		return ResponseEntity.noContent().build();
	}
	
	
	/*
	 * ADMIN Role
	 * Enable or Disable a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_ENABLE)
	public ResponseEntity<?> setUserEnabled(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
	         								@RequestParam(required=true) boolean enabled) {

		userService.enableUser(getUserById(id), enabled);
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * ADMIN Role
	 * Lock or Unlock a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_UNLOCK)
	public ResponseEntity<?> setUserUnlocked(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
	         								@RequestParam(required=true) boolean unlock) {

		userService.unlockUser(getUserById(id), unlock);
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * ADMIN Role
	 * Expire or Unexpire a User
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_UNEXPIRE)
	public ResponseEntity<?> setUserUnexpired(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
	         								 @RequestParam(required=true) boolean unexpire) {

		userService.unexpireUser(getUserById(id), unexpire);
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * ADMIN Role
	 * Expire or Unexpire Password
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_USR_PASS_UNEXPIRE)
	public ResponseEntity<?> setPasswordUnexpired(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
	         								      @RequestParam(required=true) boolean unexpire) {

		userService.unexpirePassword(getUserById(id), unexpire);
		return ResponseEntity.noContent().build();
	}
	
	
	/*
	 * Helper method to move NewUser into a User
	 */
	private Users getUserFromNewUser (NewUser newUser) {
		
		Users user = new Users(newUser.getEmailAddress(), newUser.getPassword());
		UserProfile userProfile = getProfileFromUpdateUser ((UpdateUser) newUser);
		
		userProfile.setDob(newUser.getDob());
		userProfile.setSsn(newUser.getSsn());
		userProfile.setEmailAddress(newUser.getEmailAddress());
		
		user.setUserProfile(userProfile);
		
		return user;
	}
	/*
	 * Helper method to move the User Profile partial object into 
	 * a User Profile object
	 */
	private UserProfile getProfileFromUpdateUser (UpdateUser uup) {
		
		UserProfile profile = new UserProfile();
		
		profile.setFirstName(uup.getFirstName());
		profile.setLastName(uup.getLastName());
		profile.setTitle(uup.getTitle());
		profile.setGender(uup.getGender());
		profile.setHomePhone(uup.getHomePhone());
		profile.setMobilePhone(uup.getMobilePhone());
		profile.setWorkPhone(uup.getWorkPhone());
		profile.setAddress(uup.getAddress());
		profile.setLocality(uup.getLocality());
		profile.setRegion(uup.getRegion());
		profile.setPostalCode(uup.getPostalCode());
		profile.setCountry(uup.getCountry());
		
		return profile;
	}
	
	/*
	 * 
	 */
	private static class NewUser extends UpdateUser {
		
		@NotEmpty (message=Messages.USER_EMAIL_REQUIRED)
		@Pattern(regexp=Patterns.USER_EMAIL, message=Messages.USER_EMAIL_FORMAT)
		private String emailAddress;
		
		@NotEmpty (message=Messages.USER_SSN_REQUIRED)
		@Pattern(regexp=Patterns.USER_SSN, message=Messages.USER_SSN_FORMAT)
		private String ssn;
		
		@NotEmpty(message=Messages.USER_PASSWORD_REQUIRED)
	    @Pattern(regexp=Patterns.USER_PASSWORD, message=Messages.USER_PASSWORD_FORMAT)
		private String password;
		
		@NotNull (message=Messages.USER_DOB_REQUIRED)
		@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
		@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
		private Date dob;

		public Date getDob() {
			return dob;
		}

		public String getPassword() {
			return password;
		}
			
		public String getEmailAddress() {
			return emailAddress;
		}

		public String getSsn() {
			return ssn;
		}	
	}
	
	/*
	 * Custom Request Body for Updating User Profile
	 * This allows us to only focus validation on required
	 * fields that we are permitting update
	 */
	private static class UpdateUser {
		
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
	private static class ChangePassword {
		
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
