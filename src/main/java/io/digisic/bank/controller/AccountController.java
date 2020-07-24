package io.digisic.bank.controller;

import java.math.BigDecimal;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

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

import io.digisic.bank.exception.RestBadRequestException;
import io.digisic.bank.exception.RestForbiddenException;
import io.digisic.bank.exception.RestNotAcceptableException;
import io.digisic.bank.exception.RestObjectNotFoundException;
import io.digisic.bank.model.Account;
import io.digisic.bank.model.AccountTransaction;
import io.digisic.bank.model.AccountType;
import io.digisic.bank.model.OwnershipType;
import io.digisic.bank.model.TransactionType;
import io.digisic.bank.model.security.Role;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.AccountService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;


@Validated
@RestController
public class AccountController extends CommonController {


	private static final Logger LOG = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	AccountService accountService;
	
	
	/*
	 * ADMIN Role
	 * Get All Accounts
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_ACCT_ALL)
	public ResponseEntity<?> getAllAccounts() {		
		return ResponseEntity.ok(accountService.getAllAccounts());
	}
	
	/*
	 * API Role
	 * Get All Accounts
	 */
	@GetMapping(Constants.URI_API_ACCT)
	public ResponseEntity<?> getAccount(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {	
		
		Users authUser = getAuthenticatedUser();
		Account account = getAccountById(id);
		
		// If this is not an ADMIN user, then make sure the account belongs to the user
		if (!hasRole(authUser, Role.ROLE_ADMIN)) {
			if (!(account.getOwner().getId() == authUser.getId() || account.getCoowner().getId() == authUser.getId())) {
				throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
			}
		}
		
		return ResponseEntity.ok(account);
	}
	
	/*
	 * ADMIN Role
	 * Get Account Owner
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_ACCT_OWNER)
	public ResponseEntity<?> getOwner(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {			
		return ResponseEntity.ok(getAccountById(id).getOwner());
	}
	
	/*
	 * ADMIN Role
	 * Get Account Co-owner
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_ACCT_COOWNER)
	public ResponseEntity<?> getCoOwner(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {			
		return ResponseEntity.ok(getAccountById(id).getCoowner());
	}
	
	/*
	 * ADMIN Role
	 * Set Account Co-owner
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PutMapping(Constants.URI_API_ACCT_COOWNER)
	public ResponseEntity<?> setCoOwner(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										@RequestParam(required=true) Long userId) {	
		
		Account account = getAccountById(id);
		
		account.setCoowner(getUserById(userId));
		
		return ResponseEntity.ok(accountService.save(account));
	}
	
	/*
	 * ADMIN Role
	 * Delete Account
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@DeleteMapping(Constants.URI_API_ACCT)
	public ResponseEntity<?> deleteAccount(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {	
		
		accountService.deleteAccount(getAccountById(id));
		
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * ADMIN Role
	 * Get All Checking Accounts
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_ACCT_CHK_ALL)
	public ResponseEntity<?> getAllCheckingAccounts() {		
		return ResponseEntity.ok(accountService.getCheckingAccounts());
	}
	
	/*
	 * ADMIN Role
	 * Get All Checking Accounts
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_ACCT_SAV_ALL)
	public ResponseEntity<?> getAllSavingsAccounts() {		
		return ResponseEntity.ok(accountService.getSavingsAccounts());
	}
	
	/*
	 * ADMIN Role
	 * Get User's Accounts
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ACCT)
	public ResponseEntity<?> getAccounts(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {		
		return ResponseEntity.ok(accountService.getAllAccounts(getUserById(id)));
	}
	
	/*
	 * API Role
	 * Get Current User's Accounts
	 */
	@GetMapping(Constants.URI_API_USR_ACCT_CURR)
	public ResponseEntity<?> getAccounts() {	
		return ResponseEntity.ok(accountService.getAllAccounts(getAuthenticatedUser()));
	}
	
	/*
	 * ADMIN Role
	 * Get User's Checking Accounts
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ACCT_CHK)
	public ResponseEntity<?> getCheckingAccounts(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {		
		return ResponseEntity.ok(accountService.getCheckingAccounts(getUserById(id)));
	}
	
	/*
	 * API Role
	 * Get Current User's Checking Accounts
	 */
	@GetMapping(Constants.URI_API_USR_ACCT_CHK_CURR)
	public ResponseEntity<?> getCheckingAccounts() {		
		return ResponseEntity.ok(accountService.getCheckingAccounts(getAuthenticatedUser()));
	}
	
	/*
	 * ADMIN Role
	 * Get User's Savings Accounts
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_USR_ACCT_SAV)
	public ResponseEntity<?> getSavingsAccounts(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {		
		return ResponseEntity.ok(accountService.getSavingsAccounts(getUserById(id)));
	}
	
	/*
	 * API Role
	 * Get Current User's Savings Accounts
	 */
	@GetMapping(Constants.URI_API_USR_ACCT_SAV_CURR)
	public ResponseEntity<?> getSavingsAccounts() {		
		return ResponseEntity.ok(accountService.getSavingsAccounts(getAuthenticatedUser()));
	}
	
	/*
	 * API Role
	 * Add New Account
	 */
	@PostMapping(Constants.URI_API_USR_ACCT_CURR)
	public ResponseEntity<?> createAccount(@RequestBody @Valid NewAccount account) {		
		
		Account newAccount = new Account();
		AccountType at = accountService.getAccoutTypeByCode(account.getAccountTypeCode());
	
		// if we meet the minimum balance requirement, then open account
		if (account.getOpeningDeposit().compareTo(at.getMinDeposit()) >= 0) {
			
			OwnershipType ot = accountService.getOwnershipTypeByCode(account.getOwnerTypeCode());
			
			newAccount.setName(account.getAccountName());
			newAccount.setOpeningBalance(account.getOpeningDeposit());
			newAccount.setAccountType(at);
			newAccount.setOwnershipType(ot);
			newAccount.setOwner(getAuthenticatedUser());
			accountService.createNewAccount(newAccount);
			
		} else {
			throw new RestNotAcceptableException("The initial deposit ($" 
					 + account.getOpeningDeposit() 
					 + ") entered does not meet the minimum amount ($" 
					 + at.getMinDeposit() 
					 + ") required. Please enter a valid deposit amount.");
		}
		
		return ResponseEntity.ok(newAccount);
	}
	
	/*
	 * ADMIN Role
	 * Add New Account
	 */
	@PostMapping(Constants.URI_API_USR_ACCT)
	public ResponseEntity<?> createAccount(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										   @RequestBody @Valid NewAccount account) {		
		
		Account newAccount = new Account();
		AccountType at = accountService.getAccoutTypeByCode(account.getAccountTypeCode());
	
		// if we meet the minimum balance requirement, then open account
		if (account.getOpeningDeposit().compareTo(at.getMinDeposit()) >= 0) {
			
			OwnershipType ot = accountService.getOwnershipTypeByCode(account.getOwnerTypeCode());
			
			newAccount.setName(account.getAccountName());
			newAccount.setOpeningBalance(account.getOpeningDeposit());
			newAccount.setAccountType(at);
			newAccount.setOwnershipType(ot);
			newAccount.setOwner(getUserById(id));
			accountService.createNewAccount(newAccount);
			
		} else {
			throw new RestNotAcceptableException("The initial deposit ($" 
					 + account.getOpeningDeposit() 
					 + ") entered does not meet the minimum amount ($" 
					 + at.getMinDeposit() 
					 + ") required. Please enter a valid deposit amount.");
		}
		
		return ResponseEntity.ok(newAccount);
	}
	
	/*
	 * API Role
	 * Update Account
	 */
	@PutMapping(Constants.URI_API_ACCT)
	public ResponseEntity<?> updateAccount(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										   @RequestParam(required=true) @Size(min = 1, max = 40) String newName) {	
		
		Users authUser = getAuthenticatedUser();
		Account account = getAccountById(id);
		
		// If this is not an ADMIN user, then make sure the account belongs to the user
		if (!hasRole(authUser, Role.ROLE_ADMIN)) {
			if (!(account.getOwner().getId() == authUser.getId() || account.getCoowner().getId() == authUser.getId())) {
				throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
			}
		}
		
		account.setName(newName);

		return ResponseEntity.ok(accountService.updateAccount(account));
	}
	
	
	
	/*
	 * API Role
	 * Get Current User's Savings Accounts
	 */
	@GetMapping(Constants.URI_API_ACCT_TRAN)
	public ResponseEntity<?> getAccountTransactions(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {		
		
		Users authUser = getAuthenticatedUser();
		Account account = getAccountById(id);
		
		// If this is not an ADMIN user, then make sure the account belongs to the user
		if (!hasRole(authUser, Role.ROLE_ADMIN)) {
			if (!(account.getOwner().getId() == authUser.getId() || account.getCoowner().getId() == authUser.getId())) {
				throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
			}
		}
		
		return ResponseEntity.ok(account.getAcountTransactionList());
	}
	
	/*
	 * API Role
	 * Get Current User's Savings Accounts
	 */
	@PostMapping(Constants.URI_API_ACCT_TRAN)
	public ResponseEntity<?> newTransaction(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
											@RequestBody @Valid NewTransaction newTransaction,
											@RequestParam(required=false)
		 									@Pattern(regexp=Patterns.ACCT_TRAN_ACTION, 
		 											 message=Messages.ACCT_TRAN_ACTION) String action) {		
		
		Users authUser = getAuthenticatedUser();
		Account account = getAccountById(id);
		
		// If this is not an ADMIN user, then make sure the account belongs to the user
		if (!hasRole(authUser, Role.ROLE_ADMIN)) {
			if (!(account.getOwner().getId() == authUser.getId() || account.getCoowner().getId() == authUser.getId())) {
				throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
			}
		}
		
		AccountTransaction transaction = new AccountTransaction();
		TransactionType transactionType = accountService.getTransactionTypeByCode(newTransaction.getTransactionTypeCode());
		
		transaction.setAmount(newTransaction.getAmount());
		transaction.setDescription(newTransaction.getDescription());
		transaction.setTransactionType(transactionType);
		
		// Assume the request is for Debit
		boolean bDebit = true;
		
		LOG.debug("REST New Transaction: Transaction Type Code is '" + newTransaction.getTransactionTypeCode() + "'");

		// Determine whether the request is for a CREDIT or DEBIT Transaction
		if (transactionType.getCategory().equals(TransactionType.CAT_EITHER)) {

			LOG.debug("REST New Transaction: Transaction Type Category is EITHER");
			LOG.debug("REST New Transaction: Transaction Action is -> '" + action + "'");
			
			
			// If transaction type category is EITHER, then action must be provided
			if (action != null) {
				if (action.equals(TransactionType.CAT_CREDIT)) {
					bDebit = false;
					
					LOG.debug("REST New Transaction: Transaction Action will be CREDIT");
				}
			}
			else {
				LOG.debug("REST New Transaction: Transaction Action not specified.");
				throw new RestNotAcceptableException (Messages.ACCT_TRAN_ACTION);
			}			
		} else if (transactionType.getCategory().equals(TransactionType.CAT_CREDIT)) {
			
			bDebit = false;
			LOG.debug("REST New Transaction: Transaction Type Category is CREDIT");
			LOG.debug("REST New Transaction: Transaction Action will be CREDIT");
		}
		
		// if it is a DEBIT Transaction
		if (bDebit) {
			
			// check that amount is not greater than available
			BigDecimal maxAvailable = account.getCurrentBalance().add(account.getAccountType().getOverdraftLimit());
			
			if (transaction.getAmount().compareTo(maxAvailable) == 1) {
				throw new RestNotAcceptableException ("The withdraw amount ($" 
						 							  + transaction.getAmount()
						 							  + ") is greater than the available balance ($"
						 							  + account.getCurrentBalance() + ") and overdraft limit ($"
						 							  + account.getAccountType().getOverdraftLimit() + ").");
			}
			
			// Add new Debit Transaction
			accountService.debitTransaction(account, transaction);
			
			LOG.debug("REST New Transaction: Add new DEBIT Transaction");
		} 
		else {
			
			// Add new Credit Transaction
			accountService.creditTransaction(account, transaction);
			
			LOG.debug("REST New Transaction: Add new CREDIT Transaction");
		}
		
		// Return the last 2 transactions. This is done in case there is an overdraft fee. This allows the user
		// to see the transaction and the fee from the transaction if it occurs.
		return ResponseEntity.ok(accountService.getLastTwoAccountTransactions(account));
	}
	
	/*
	 * API Role
	 * Transfer Funds to Another Account
	 */
	@PostMapping(Constants.URI_API_ACCT_XFER)
	public ResponseEntity<?> transferFunds(@PathVariable(Constants.PATH_VARIABLE_ID) Long id,
										   @RequestBody @Valid TransferFunds transfer){
		
		Users authUser = getAuthenticatedUser();
		Account fromAccount = getAccountById(id);
		Account toAccount = getAccountById(transfer.getToAccountId());
		AccountTransaction transaction = new AccountTransaction();
		transaction.setAmount(transfer.getAmount());
		
		// If this is not an ADMIN user, then make sure the account belongs to the user
		if (!hasRole(authUser, Role.ROLE_ADMIN)) {
			if (!(fromAccount.getOwner().getId() == authUser.getId() || fromAccount.getCoowner().getId() == authUser.getId())) {
				throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
			}
		}
		
		accountService.transfer(fromAccount, toAccount, transaction);
		
		return ResponseEntity.ok(accountService.getLastTwoAccountTransactions(fromAccount));
	}
	
	/*
	 * Find the Account by Id
	 */
	private Account getAccountById(Long id) {
		
		if (id < 0) {
			throw new RestBadRequestException (Messages.INVALID_OBJECT_ID);
		}
	
		Account account = accountService.getAccountById(id);
		
		if (account == null) {
			throw new RestObjectNotFoundException (Messages.OBJECT_NOT_FOUND + id);
		}
		
		return account;
	}
	
	
	/*
	 * New Account
	 */
	private static class NewAccount {
		
		@Size(min = 1, max = 40)
		@NotEmpty (message=Messages.ACCT_NAME_REQ)
		private String accountName;
		
		public String getAccountName() {
			return accountName;
		}

		public BigDecimal getOpeningDeposit() {
			return openingDeposit;
		}

		public String getAccountTypeCode() {
			return accountTypeCode;
		}

		public String getOwnerTypeCode() {
			return ownerTypeCode;
		}

		@NotNull (message=Messages.ACCT_OPEN_DEPOSIT_REQ)
		@Positive (message=Messages.ACCT_TRAN_AMT_POSITIVE)
		private BigDecimal openingDeposit;
		
		@NotEmpty (message=Messages.ACCT_TYPE_REQ)
		@Pattern(regexp=Patterns.ACCT_TYPE_CODE, message=Messages.ACCT_TYPE_FORMAT)
		private String accountTypeCode;
		
		@NotEmpty (message=Messages.ACCT_OWN_TYPE_REQ)
		@Pattern(regexp=Patterns.ACCT_OWN_TYPE_CODE, message=Messages.ACCT_OWN_TYPE_FORMAT)
		private String ownerTypeCode;
	}
	
	/*
	 * New Transaction
	 */
	private static class NewTransaction {
		
		@Positive (message=Messages.ACCT_TRAN_AMT_POSITIVE)
		private BigDecimal amount;
		
		@NotEmpty (message=Messages.ACCT_TRAN_TYPE_CODE_REQ)
		@Pattern(regexp=Patterns.ACCT_TRAN_TYPE_CODE, message=Messages.ACCT_TRAN_TYPE_FORMAT)
		private String transactionTypeCode;
		
		@NotEmpty (message=Messages.ACCT_TRAN_DESC_REQ)
		private String description;

		/**
		 * @return the amount
		 */
		public BigDecimal getAmount() {
			return amount;
		}

		/**
		 * @return the transactionTypeCode
		 */
		public String getTransactionTypeCode() {
			return transactionTypeCode;
		}

		/**
		 * @return the description
		 */
		public String getDescription() {
			return description;
		}
	}
	
	/*
	 * Transfer Funds
	 */
	private static class TransferFunds {
		
		@NotNull (message="To Account is required")
		private Long toAccountId;
		
		@Positive (message=Messages.ACCT_TRAN_AMT_POSITIVE)
		private BigDecimal amount;

		/**
		 * @return the toAccountId
		 */
		public Long getToAccountId() {
			return toAccountId;
		}

		/**
		 * @return the amount
		 */
		public BigDecimal getAmount() {
			return amount;
		}
		
	}
}
