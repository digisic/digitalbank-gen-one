package io.digisic.credit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RestController;

import io.digisic.credit.exception.RestBadRequestException;
import io.digisic.credit.exception.RestObjectNotFoundException;
import io.digisic.credit.model.CreditApplication;
import io.digisic.credit.model.CreditCard;
import io.digisic.credit.model.security.Users;
import io.digisic.credit.service.CreditApplicationService;
import io.digisic.credit.service.CreditCardService;
import io.digisic.credit.service.UserService;
import io.digisic.credit.util.Messages;

@Validated
@RestController
public class CommonController {
	
	private static final Logger LOG = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	UserService userService;
	
	@Autowired
	CreditCardService creditCardService;
	
	@Autowired
	private CreditApplicationService creditApplicationService;
	
	
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
	
	/*
	 * Find the credit card by Id
	 */
	public CreditCard getCreditCardById(Long id) {
		
		LOG.debug("Get Credit Card with id = " + id);
		
		if (id < 0) {
			throw new RestBadRequestException (Messages.INVALID_OBJECT_ID);
		}
	
		CreditCard card = creditCardService.getCreditCard(id);
		
		if (card == null) {
			throw new RestObjectNotFoundException (Messages.OBJECT_NOT_FOUND + id);
		}
		
		return card;
	}
	
	/*
	 * Find the credit application by Id
	 */
	public CreditApplication getCreditApplicationById(Long id) {
		
		LOG.debug("Get Credit Application with id = " + id);
		
		if (id < 0) {
			throw new RestBadRequestException (Messages.INVALID_OBJECT_ID);
		}
	
		CreditApplication app = creditApplicationService.getCreditApplication(id);
		
		if (app == null) {
			throw new RestObjectNotFoundException (Messages.OBJECT_NOT_FOUND + id);
		}
		
		return app;
	}
	
	

}
