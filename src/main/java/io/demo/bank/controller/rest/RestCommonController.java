package io.demo.bank.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RestController;

import io.demo.bank.config.exception.RestBadRequestException;
import io.demo.bank.config.exception.RestObjectNotFoundException;
import io.demo.bank.model.security.Users;
import io.demo.bank.service.UserService;
import io.demo.bank.util.Messages;

@RestController
public class RestCommonController {
	
	@Autowired
	UserService userService;
	
	
	/*
	 * Find the user by Id
	 */
	public Users getUserById(Long id) {
		
		if (id < 0) {
			throw new RestBadRequestException (Messages.INVALID_OBJECT_ID);
		}
	
		Users user = userService.findById(id);
		
		if (user == null) {
			throw new RestObjectNotFoundException (Messages.OBJECT_NOT_FOUND + id);
		}
		
		return user;
	}
	
	/*
	 * Gets current authenticated user
	 */
	public Users getAuthenticatedUser () {
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		return userService.findByUsername(auth.getName());
	}
	
	/*
	 * Checks the current role of the user
	 */
	public boolean hasRole(Users user, String roleName) {
		return userService.hasRole(user, roleName);
	}

}
