package io.digisic.bank.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import io.digisic.bank.service.AccountService;
import io.digisic.bank.util.Constants;

@Validated
@RestController
public class StaticDataController extends CommonController {

	@SuppressWarnings("unused")
	private static final Logger LOG = LoggerFactory.getLogger(StaticDataController.class);
	
	@Autowired
	AccountService accountService;
	
	/*
	 * ADMIN Role
	 * Get All Account Types
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_DATA_ACCT_TYP)
	public ResponseEntity<?> getAccountTypes() {		
		return ResponseEntity.ok(accountService.getAccountTypes());
	}
	
	/*
	 * ADMIN Role
	 * Get Checking Account Types
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_DATA_ACCT_TYP_CHK)
	public ResponseEntity<?> getCheckingAccountTypes() {		
		return ResponseEntity.ok(accountService.getCheckingAccountTypes());
	}
	
	/*
	 * ADMIN Role
	 * Get Savings Account Types
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_DATA_ACCT_TYP_SAV)
	public ResponseEntity<?> getSavingsAccountTypes() {		
		return ResponseEntity.ok(accountService.getSavingsAccountTypes());
	}
	
	/*
	 * ADMIN Role
	 * Get Account Ownership Types
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_DATA_ACCT_OWN_TYP)
	public ResponseEntity<?> getAccountOwndershipTypes() {		
		return ResponseEntity.ok(accountService.getOwnershipTypes());
	}
	
	/*
	 * ADMIN Role
	 * Get Account Standings
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_DATA_ACCT_STAND)
	public ResponseEntity<?> getAccountStandings() {		
		return ResponseEntity.ok(accountService.getAccountStanding());
	}
	
	/*
	 * ADMIN Role
	 * Get Account Transaction States
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_DATA_ACCT_TRAN_ST)
	public ResponseEntity<?> getAccountTransactionStates() {		
		return ResponseEntity.ok(accountService.getTransactionState());
	}
	
	/*
	 * ADMIN Role
	 * Get Account Transaction Types
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_DATA_ACCT_TRAN_TY)
	public ResponseEntity<?> getAccountTransactionTypes() {		
		return ResponseEntity.ok(accountService.getTransactionType());
	}
	
	/*
	 * ADMIN Role
	 * Get Account Transaction Categories
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_DATA_ACCT_TRAN_CT)
	public ResponseEntity<?> getAccountTransactionCategories() {		
		return ResponseEntity.ok(accountService.getTransactionCategory());
	}
}
