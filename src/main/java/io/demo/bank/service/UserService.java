package io.demo.bank.service;

import io.demo.bank.model.UserProfile;
import io.demo.bank.model.security.User;
import io.demo.bank.model.security.UserRole;
import io.demo.bank.repository.RoleRepository;
import io.demo.bank.repository.UserProfileRepository;
import io.demo.bank.repository.UserRepository;
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
	  
	public User createUser(User newUser) {
	
		newUser.setPassword(encoder.encode(newUser.getPassword()));
	    
	    UserProfile newProfile = newUser.getUserProfile();
	    newProfile.setDom(new Date());
	    newUser.setUserProfile(newProfile);
	    
	    Set<UserRole> userRoles = new HashSet<>();
	    userRoles.add(new UserRole(newUser, roleRepository.findByName("ROLE_USER")));
	    newUser.setUserRoles(userRoles);
	    
	    newUser = userRepository.save(newUser);
	    
	    return newUser;
	}
	
}
