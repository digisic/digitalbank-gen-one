package io.demo.bank.service;

import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import io.demo.bank.model.Notification;
import io.demo.bank.model.UserProfile;
import io.demo.bank.model.enums.NotificationType;
import io.demo.bank.model.security.UserRole;
import io.demo.bank.model.security.Role;
import io.demo.bank.model.security.User;
import io.demo.bank.repository.RoleRepository;
import io.demo.bank.repository.UserProfileRepository;
import io.demo.bank.repository.UserRepository;
import io.demo.bank.repository.UserRoleRepository;
import io.demo.bank.util.Patterns;

@Service
@Transactional
public class UserService {
  
	private static final Logger LOG = LoggerFactory.getLogger(UserService.class);
  
	@Autowired
	private UserRepository userRepository;
  
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserProfileRepository userProfileRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;
	  
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	/*
	 * Find the user by the specified username. Returns the User object
	 * if found otherwise the User object will be null.
	 */
	public User findByUsername(String username) {
	
		return userRepository.findByUsername(username);
	}
	
	/*
	 * Find the user by the specified id. Returns the User object
	 * if found otherwise the User object will be null.
	 */
	public User findById(Long id) {
	
		Optional<User> opt = userRepository.findById(id);
		
		if (opt.isPresent()) {
			return opt.get();
		}
		
		return null;
	}
	
	/*
	 * Checks the data store to determine if a user account with the
	 * provided email address already exists in the data store.
	 */
	public boolean checkEmailAdressExists(String emailAddress) {
	    
		if (userProfileRepository.findByEmailAddress(emailAddress) != null) {
			return true;
		}
		
	    return false;
	}
	
	/*
	 * Checks the data store to determine if a user account with the
	 * provided SSN already exists in the data store.
	 */
	public boolean checkSsnExists(String ssn) {
		
		String normalizedSSN = normalizeSSNFormat(ssn);
	    
		if (userProfileRepository.findBySsn(normalizedSSN) != null) {
			
			return true;
	    }
	    
		return false;
	}
	
	/*
	 * Saves the User object to the data store
	 */
	public User save(User user) {
		
		return userRepository.save(user);
	}
	
	/*
	 * Gets a list of Users from the data store.
	 */
	public List<User> findUserList() {
	    
		return this.userRepository.findAll();
	}
	 
	/*
	 * Creates a new User account within the data store.
	 */
	public void createUser(User newUser, String role) {
	
		// Encode the password before storing user
		newUser.setPassword(encoder.encode(newUser.getPassword()));
		
	    // Set Date of Membership to current date the user account was created
	    newUser.getUserProfile().setDom(new Date());
	   
	    // Ensure the SSN format is consistent
	    newUser.getUserProfile().setSsn(normalizeSSNFormat(newUser.getUserProfile().getSsn()));
	    
	    // Set username to the email address
	    newUser.setUsername(newUser.getUserProfile().getEmailAddress());
	    	    
	    // Set the Role Authority for the user
	    Set<UserRole> userRoles = new HashSet<>();
	    UserRole userRole = new UserRole(newUser, roleRepository.findByName(role));
	    userRoles.add(userRole);
	    newUser.setUserRoles(userRoles);
	    
	    // Save the User to the data store
	    newUser = userRepository.save(newUser);
	    
	    LOG.debug("Create User: New User Created.");
	    
	}
	
	/*
	 * Delete the user
	 */
	public void deleteUser (User user) {
		userRepository.delete(user);
	}
	
	/*
	 * Updates an existing user profile with new profile data
	 */
	public User updateUserProfile(User user, UserProfile newProfile) {
		
		UserProfile up = user.getUserProfile();
		
		
		LOG.debug("Update User Profile: " + newProfile.toString());
		
		// Set updated fields into actual user profile
		up.setTitle(newProfile.getTitle());
		up.setFirstName(newProfile.getFirstName());
		up.setLastName(newProfile.getLastName());
		up.setHomePhone(newProfile.getHomePhone());
		up.setMobilePhone(newProfile.getMobilePhone());
		up.setWorkPhone(newProfile.getWorkPhone());
		up.setAddress(newProfile.getAddress());
		up.setLocality(newProfile.getLocality());
		up.setRegion(newProfile.getRegion());
		up.setPostalCode(newProfile.getPostalCode());
		up.setCountry(newProfile.getCountry());
		
		
		// Save Profile Updates
		user.setUserProfile(up);
		
		user = save(user);
		
		LOG.debug("Updated User Profile: " + user.getUserProfile().toString());
	
		return user;
	}
	
	/*
	 * Checks whether the provided password matches the password stored
	 * with the User object.
	 */
	public boolean passwordMatches (User user, String password) {
		
		return encoder.matches(password, user.getPassword());
	}
	
	/*
	 * Sets the password for the User object to the provided password.
	 */
	public void changePassword (User user, String newPassword) {
		
		user.setPassword(encoder.encode(newPassword));
		
		userRepository.save(user);
		
		LOG.debug("Change Password: Password Changed.");
		
	}
	
	/*
	 * Adds a new role authority to the user
	 * 
	 */
	public void addRole(User user, String role) {
		
		// Get the user's roles
		Set<UserRole> userRoles = user.getUserRoles();
		
		Role newRole = roleRepository.findByName(role);
		userRoles.add(new UserRole(user, newRole));
		user.setUserRoles(userRoles);
		userRepository.save(user);
		
		LOG.debug("Add Role -> Added new role '" + role + "'");
		
	}
	
	
	/*
	 * Removes a role authority from the user
	 * 
	 */
	public void removeRole(User user, String roleName) {
		
		LOG.debug("Remove Role -> Remove existing role '" + roleName + "'");
		
		// Get the user's roles
		Set<UserRole> userRoles = user.getUserRoles();
		
		// First validate the user has the role
		if (hasRole(user, roleName)) {
			
			// Find the UserRole object we need to remove
			for (UserRole userRole: userRoles) {
				if (userRole.getRole().getName().equals(roleName)) {
					userRoles.remove(userRole);
					userRoleRepository.delete(userRole);
					break;
				} // end if
			} // end for

			userRepository.save(user);
			
			LOG.debug("Remove Role -> Completed UserRoles iteration.");
		}
		else {
			LOG.debug("Remove Role -> User does not have role '" + roleName + "' assigned. Nothing to remove.");
		}
		
	}
	
	
	
	public void addNotification(User user, String content) {
		
		Notification notif = new Notification();
		
		notif.setUsers(user);
		notif.setContent(content);
		notif.setTimestamp(new Date());
		notif.setNotificationType(NotificationType.NEW_ACCOUNT);
		
		List<Notification> notifications = user.getNotifications();
		notifications.add(notif);
		user.setNotifications(notifications);
		
		userRepository.save(user);
		
	}
	
	/*
	 * Checks SSN number to determine if separators "-" exist in the format.
	 * If the separators do not exist, they will be inserted to ensure 
	 * a consistent format when storing the SSN value. 
	 */
	private String normalizeSSNFormat (String ssn) {
		
		LOG.debug("Normalize SSN-> SSN passed in is '" + ssn + "'");
		
		int firstSeparator = ssn.indexOf('-', 0);
	    int secondSeparator = ssn.indexOf('-', 4);
	    
	    String normalizedSSN = ssn;
	    
	    // Check if SSN has separators or not
	    if (firstSeparator == -1 && secondSeparator == -1) {
	    	
	    	LOG.debug("Normalize SSN-> SSN is missing both separators");
	    	
	    	// no separator, so we need to add it
	    	String ssnPart1 = ssn.substring(0, 3);
	    	String ssnPart2 = ssn.substring(3, 5);
	    	String ssnPart3 = ssn.substring(5);
	    	
	    	normalizedSSN = ssnPart1 + "-" + ssnPart2 + "-" + ssnPart3; 
	    	
	    } else {
	    	
	    	// first separator is missing
	    	if (firstSeparator == 5) {
	    		
	    		LOG.debug("Normalize SSN-> SSN is missing 2nd separator");
	    		
	    		String ssnPart1 = ssn.substring(0,3);
		    	String ssnPart2 = ssn.substring(3);
		    	
		    	normalizedSSN = ssnPart1 + "-" + ssnPart2;
	    		
	    	}
	    	
	    	// second separator is missing
	    	if (firstSeparator == 3 && secondSeparator == -1) {
	    		
	    		LOG.debug("Normalize SSN-> SSN is missing 1st separator");
	    		
	    		String ssnPart1 = ssn.substring(0, 6);
		    	String ssnPart2 = ssn.substring(6);
		    	
		    	normalizedSSN = ssnPart1 + "-" + ssnPart2;
	    	}	
	    }
	    
	    LOG.debug("Normalize SSN-> SSN returned is '" + normalizedSSN + "'");
	    
	    return normalizedSSN;
		
	}
	
	
	/*
	 * Determine the Role Name based on the passed in Role
	 */
	public String findRoleName (String role) {
		
		LOG.debug("findRoleName -> Role passed in = '" + role + "'");
		
		String selRole = "";
		
		// Determine role to set for user based on optional parameter
		switch (role) {
		
			case Patterns.ROLE_API:
				selRole = Role.ROLE_API;
				break;
			case Patterns.ROLE_ADMIN:
				selRole = Role.ROLE_ADMIN;
				break;
			default:
				selRole = Role.ROLE_USER;
		}
		
		LOG.debug("findRoleName -> Role selected = '" + selRole + "'");
		
		return selRole;
	}
	
	/*
	 * Check to see if the user already has the passed in role
	 */
	public boolean hasRole(User user, String roleName) {
		  
		Collection<? extends GrantedAuthority> authorities = user.getAuthorities();
		
		boolean hasRole = false;
		
		// check each of the current authorities
		for (GrantedAuthority authority : authorities) {
			hasRole = authority.getAuthority().equals(roleName);
		     
			if (hasRole) {
				break;
		    }
		} // end for
		
		return hasRole;
	}
	
	/*
	 * Enable or Disable User
	 */
	public void enableUser (User user, boolean enabled) {
		user.setEnabled(enabled);
		userRepository.save(user);
	}
	
	/*
	 * Lock or Unlock User
	 */
	public void unlockUser (User user, boolean unlock) {
		user.setAccountNonLocked(unlock);
		userRepository.save(user);
	}
	
	/*
	 * Expire or Unexpire User
	 */
	public void unexpireUser (User user, boolean unexpire) {
		user.setAccountNonExpired(unexpire);
		userRepository.save(user);
	}
	
	/*
	 * Expire or Unexpire Password
	 */
	public void unexpirePassword (User user, boolean unexpire) {
		user.setCredentialsNonExpired(unexpire);
		userRepository.save(user);
	}

}
