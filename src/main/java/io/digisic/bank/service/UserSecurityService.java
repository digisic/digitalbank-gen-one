package io.digisic.bank.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import io.digisic.bank.model.security.Users;
import io.digisic.bank.repository.UserRepository;

@Service
public class UserSecurityService implements UserDetailsService {
	
	private static final Logger LOG = LoggerFactory.getLogger(UserSecurityService.class);
  
	@Autowired
	private UserRepository userRepository;
  
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		LOG.debug("Load User by Username: " + username);
    
		Users user = this.userRepository.findByUsername(username);
    
		if (user == null) {
			throw new UsernameNotFoundException("User having username " + username + " not found.");
		}
    
		LOG.debug("Load User by Username: Found user: " + user);
    
		return user;
	}
}
