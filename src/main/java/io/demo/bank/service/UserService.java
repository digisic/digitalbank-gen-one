package io.demo.bank.service;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import io.demo.bank.model.Notification;
import io.demo.bank.model.UserProfile;
import io.demo.bank.model.enums.NotificationType;
import io.demo.bank.model.security.UserRole;
import io.demo.bank.model.security.User;
import io.demo.bank.repository.RoleRepository;
import io.demo.bank.repository.UserProfileRepository;
import io.demo.bank.repository.UserRepository;

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
	private BCryptPasswordEncoder encoder;
	
	public User findByUsername(String username) {
	
		return this.userRepository.findByUsername(username);
	}
	  
	public boolean checkEmailAdressExists(String emailAddress) {
	    
		if (userProfileRepository.findByEmailAddress(emailAddress) != null) {
			return true;
		}
		
	    return false;
	}
	  
	public boolean checkSsnExists(String ssn) {
	    
		if (userProfileRepository.findBySsn(ssn) != null) {
			
			return true;
	    }
	    
		return false;
	}
	  
	public void save(User user) {
		
		userRepository.save(user);
	}
	  
	public List<User> findUserList() {
	    
		return this.userRepository.findAll();
	}
	  
	public User createUser(User newUser, String role) {
	
		newUser.setPassword(encoder.encode(newUser.getPassword()));
	    
	    UserProfile newProfile = newUser.getUserProfile();
	    newProfile.setDom(new Date());
	    newUser.setUserProfile(newProfile);
	    
	    Set<UserRole> userRoles = new HashSet<>();
	    UserRole userRole = new UserRole(newUser, roleRepository.findByName(role));
	    userRoles.add(userRole);
	    newUser.setUserRoles(userRoles);
	    
	    newUser = userRepository.save(newUser);
	    
	    LOG.debug("Create User: New User Created.");
	    
	    return newUser;
	}
	
	public boolean passwordMatches (User user, String password) {
		
		return encoder.matches(password, user.getPassword());
	}
	
	public void changePassword (User user, String newPassword) {
		
		user.setPassword(encoder.encode(newPassword));
		
		userRepository.save(user);
		
		LOG.debug("Change Password: Password Changed.");
		
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
	

}
