package io.demo.bank.controller.rest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import io.demo.bank.service.UserService;
import io.demo.bank.util.Constants;

@Validated
@RestController
public class RestAccountController extends RestCommonController {

	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(RestAccountController.class);
	
	@Autowired
	UserService userService;
	
	/*
	 * ADMIN Role
	 * Get User's Accounts
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ACCT)
	public ResponseEntity<?> GetUserAccounts(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {		
		return ResponseEntity.ok(getUser(id).getOwnerAccounts());
	}
	
	
	/*
	 * API Role
	 * Get Current User's Accounts
	 */
	@GetMapping(Constants.URI_API_USR_ACCT_CURR)
	public ResponseEntity<?> GetMyAccounts() {	
		return ResponseEntity.ok(getAuthenticatedUser().getOwnerAccounts());
	}
}
