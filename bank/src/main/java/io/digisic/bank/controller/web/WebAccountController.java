package io.digisic.bank.controller.web;

import java.math.BigDecimal;
import java.security.Principal;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import io.digisic.bank.model.Account;
import io.digisic.bank.model.AccountTransaction;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.AccountService;
import io.digisic.bank.service.UserService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;

@Controller
@RequestMapping(Constants.URI_ACCOUNT)
public class WebAccountController extends WebCommonController {
	
	private static final Logger LOG = LoggerFactory.getLogger(WebAccountController.class);
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private UserService userService;
	
		
	@GetMapping(Constants.URI_CHK_ADD)
	public String checkingAdd(Principal principal, Model model) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		// Add format patterns
		model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
		
		model.addAttribute(MODEL_ATT_ACCOUNT, new Account());	
		model.addAttribute(MODEL_ATT_ACCT_TYPE_LIST, accountService.getCheckingAccountTypes());
		model.addAttribute(MODEL_ATT_OWN_TYPE_LIST, accountService.getOwnershipTypes());
    
		return Constants.VIEW_CHK_ADD;
	}
	
	
	@PostMapping(Constants.URI_CHK_ADD)
	public String checkingAdd(Principal principal, Model model,
							  @ModelAttribute(MODEL_ATT_ACCOUNT) Account newAccount,
							  RedirectAttributes redirectAttrs) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		Users user = userService.findByUsername(principal.getName());
		
		String accountName = newAccount.getName();
		String accountType = newAccount.getAccountType().getName();
		
		LOG.debug("New Checking: Account Name -> " + accountName);
		LOG.debug("New Checking: Initial Deposit -> " + newAccount.getOpeningBalance());
		LOG.debug("New Checking: Account Type -> " + newAccount.getAccountType().getId());
		LOG.debug("New Checking: Owner Type -> " + newAccount.getOwnershipType().getId());
	
		// Check if minimum deposit has been met
		if (newAccount.getOpeningBalance().compareTo(newAccount.getAccountType().getMinDeposit()) >= 0) {
			
			LOG.debug("Add New Checking: Create Account");
			
			// Create Account
			newAccount.setOwner(user);
			accountService.createNewAccount(newAccount);
			
			// Add notification to user
			userService.addNotification(user, "New "+accountType+" account named "+accountName+" created");
			
			// Add "Flash" attribute, which survives a redirect initially and then automatically cleared (see PRG)
			redirectAttrs.addFlashAttribute(MODEL_NEW_ACCT_CONF_MSG, MessageFormat.format(Messages.ACCT_CREATE_MSG_FORMAT, accountType, accountName));
			
		} else {
			
			LOG.debug("New Checking: Error meeting minimum deposit requirement.");
			
			// Add format patterns
			model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
			
			// Return Error Message
			model.addAttribute(MODEL_ATT_ERROR_MSG, "The initial deposit ($" 
													 + newAccount.getOpeningBalance() 
													 + ") entered does not meet the minimum amount ($" 
													 + newAccount.getAccountType().getMinDeposit() 
													 + ") required. Please enter a valid deposit amount.");
			// Send back data
			model.addAttribute(MODEL_ATT_ACCT_TYPE_LIST, accountService.getCheckingAccountTypes());
			model.addAttribute(MODEL_ATT_OWN_TYPE_LIST, accountService.getOwnershipTypes());
			model.addAttribute(MODEL_ATT_ACCOUNT, newAccount);
			
			return Constants.VIEW_CHK_ADD;
		}
		
		return Constants.DIR_REDIRECT + Constants.VIEW_CHK_VIEW + "?" + MODEL_ATT_ACCT_SEL_SWITCH + "=" + newAccount.getId();
	}
	
	
	
	@GetMapping(Constants.URI_SAV_ADD)
	public String savingsAdd (Principal principal, Model model) {
		
		// Set Display Defaults
		this.setDisplayDefaults(principal, model);
		
		model.addAttribute(MODEL_ATT_ACCOUNT, new Account());
		model.addAttribute(MODEL_ATT_ACCT_TYPE_LIST, accountService.getSavingsAccountTypes());
		model.addAttribute(MODEL_ATT_OWN_TYPE_LIST, accountService.getOwnershipTypes());
		
		// Add format patterns
		model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
    
		return Constants.VIEW_SAV_ADD;
	}
	
	
	@PostMapping(Constants.URI_SAV_ADD)
	public String savingsAdd (Principal principal, Model model,
							  @ModelAttribute(MODEL_ATT_ACCOUNT) Account newAccount,
							  RedirectAttributes redirectAttrs) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		Users user = userService.findByUsername(principal.getName());
		
		String accountType = newAccount.getAccountType().getName();
		String accountName = newAccount.getName();
		
		LOG.debug("Add New Savings: Account Name -> " + accountName);
		LOG.debug("Add New Savings: Initial Deposit -> " + newAccount.getOpeningBalance());
		LOG.debug("Add New Savings: Account Type -> " + newAccount.getAccountType().getId());
		LOG.debug("Add New Savings: Owner Type -> " + newAccount.getOwnershipType().getId());
	
		// Check if minimum deposit has been met
		if (newAccount.getOpeningBalance().compareTo(newAccount.getAccountType().getMinDeposit()) >= 0) {
			
			LOG.debug("New Savings: Create Account");
			
			// Create Account
			newAccount.setOwner(user);
			
			newAccount = accountService.createNewAccount(newAccount);
			
			// Add notification to user
			userService.addNotification(user, "New "+accountType+" account named "+accountName+" created");
			
			// Add "Flash" attribute, which survives a redirect initially and then automatically cleared (see PRG)
			redirectAttrs.addFlashAttribute(MODEL_NEW_ACCT_CONF_MSG, MessageFormat.format(Messages.ACCT_CREATE_MSG_FORMAT, accountType, accountName));
			
		} else {
			
			LOG.debug("Savings: Error meeting minimum deposit requirement.");
			
			// Return Error 
			model.addAttribute(MODEL_ATT_ERROR_MSG, "The initial deposit ($" 
													 + newAccount.getOpeningBalance() 
													 + ") entered does not meet the minimum amount ($" 
													 + newAccount.getAccountType().getMinDeposit() 
													 + ") required. Please enter a valid deposit amount.");
			
			model.addAttribute(MODEL_ATT_OWN_TYPE_LIST, accountService.getOwnershipTypes());
			model.addAttribute(MODEL_ATT_ACCT_TYPE_LIST, accountService.getSavingsAccountTypes());
			model.addAttribute(MODEL_ATT_ACCOUNT, newAccount);
			
			// Add format patterns
			model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
			
			return Constants.VIEW_SAV_ADD;
		}
		
		return Constants.DIR_REDIRECT + Constants.VIEW_SAV_VIEW + "?" + MODEL_ATT_ACCT_SEL_SWITCH + "=" + newAccount.getId();
	}
	
	@PostMapping(Constants.URI_ACCOUNT_UPDATE)
	public ResponseEntity<?> updateAccount(Principal principal, Model model,
										  @RequestParam Long id, 
										  @RequestParam String newName){
		
		Account account = accountService.getAccountById(id);
		
		if (account == null)
			return (ResponseEntity<?>) ResponseEntity.notFound();
		
		account.setName(newName);
		
		return ResponseEntity.ok(accountService.updateAccount(account));
	}
	
	
	
	@GetMapping(Constants.URI_CHK_VIEW)
	public String checkingView (Principal principal, Model model,
							   @ModelAttribute(MODEL_ATT_ACCT_SEL_SWITCH) ArrayList<String> selectSwitch,
							   @ModelAttribute(MODEL_NEW_ACCT_CONF_MSG) String newAcctConfMsg) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		Users user = userService.findByUsername(principal.getName());
		
		LOG.debug("SELECTED: ->" + selectSwitch.size());
		long selectId = 0;
		
		List<Account> accountList = accountService.getCheckingAccounts(user);
		model.addAttribute(MODEL_ATT_ACCT_LIST, accountList);
		
		LOG.debug("Account List:");
		for (int i = 0; i < accountList.size(); i++) {
			LOG.debug("Accounts: -> " + accountList.get(0).getName());
		}
		
		if (accountList.size() > 0) {
			
			List<AccountTransaction> transactionList  = accountList.get(0).getAcountTransactionList();
			selectId = accountList.get(0).getId();
			
			if (selectSwitch.size() > 0) {
				
				selectId = Long.valueOf(selectSwitch.get(0));
				
				LOG.debug("SELECTED ID: -> " + selectId);
				
				for (int i = 0; i < accountList.size(); i++) {
					
					LOG.debug("LOOKING AT ID: -> " + accountList.get(i).getId());
					
					if (accountList.get(i).getId() == selectId) {
						
						LOG.debug("GETTING TRANSACTIONS FOR ID: -> " + accountList.get(i).getId());
						
						transactionList = accountList.get(i).getAcountTransactionList();
					}
				} // end for
			} // end if a selected switch

			model.addAttribute(MODEL_ATT_ACCT_TRANS_LIST, transactionList);
		} // end if account list
		else {
			model.addAttribute(MODEL_ATT_ACCT_NONE, true);
		}
		
		model.addAttribute(MODEL_ATT_ACCT_SEL_ID, selectId);
		model.addAttribute(MODEL_ATT_ACCT_SEL_SWITCH, new ArrayList<String>());
	
		return Constants.VIEW_CHK_VIEW;
	}
	
	
	@GetMapping(Constants.URI_SAV_VIEW)
	public String savingsView (Principal principal, Model model,
							   @ModelAttribute(MODEL_ATT_ACCT_SEL_SWITCH) ArrayList<String> selectSwitch,
							   @ModelAttribute(MODEL_NEW_ACCT_CONF_MSG) String newAcctConfMsg) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		Users user = userService.findByUsername(principal.getName());
		
		LOG.debug("SELECTED: ->" + selectSwitch.size());
		long selectId = 0;
		
		List<Account> accountList = accountService.getSavingsAccounts(user);
		model.addAttribute(MODEL_ATT_ACCT_LIST, accountList);
		
		LOG.debug("Account List:");
		for (int i = 0; i < accountList.size(); i++) {
			LOG.debug("Accounts: -> " + accountList.get(0).getName());
		}
		
		if (accountList.size() > 0) {
			
			List<AccountTransaction> transactionList  = accountList.get(0).getAcountTransactionList();
			selectId = accountList.get(0).getId();
			
			if (selectSwitch.size() > 0) {
				
				selectId = Long.valueOf(selectSwitch.get(0));
				
				LOG.debug("SELECTED ID: -> " + selectId);
				
				for (int i = 0; i < accountList.size(); i++) {
					
					LOG.debug("LOOKING AT ID: -> " + accountList.get(i).getId());
					
					if (accountList.get(i).getId() == selectId) {
						
						LOG.debug("GETTING TRANSACTIONS FOR ID: -> " + accountList.get(i).getId());
						
						transactionList = accountList.get(i).getAcountTransactionList();
					}
				} // end for
			} // end if a selected switch

			model.addAttribute(MODEL_ATT_ACCT_TRANS_LIST, transactionList);
		} // end if account list
		else {
			model.addAttribute(MODEL_ATT_ACCT_NONE, true);
		}
		
		model.addAttribute(MODEL_ATT_ACCT_SEL_ID, selectId);
		model.addAttribute(MODEL_ATT_ACCT_SEL_SWITCH, new ArrayList<String>());
		
		return Constants.VIEW_SAV_VIEW;
	}
	
	
	@GetMapping(Constants.URI_DEPOSIT)
	public String deposit (Principal principal, Model model) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		Users user = userService.findByUsername(principal.getName());
		
		// Add format patterns
		model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);

		// Get all accounts
		List<Account> accountList = accountService.getCheckingAccounts(user);
		accountList.addAll(accountService.getSavingsAccounts(user));
		model.addAttribute(MODEL_ATT_ACCT_LIST, accountList);
		model.addAttribute(MODEL_ATT_ACCOUNT, new Account());
		
		AccountTransaction accountTransaction = new AccountTransaction();
		model.addAttribute(MODEL_ATT_ACCT_TRANS, accountTransaction);
		
		return Constants.VIEW_DEPOSIT;
		
	}
	
	@PostMapping(Constants.URI_DEPOSIT)
	public String deposit (Principal principal, Model model,
			                @ModelAttribute(MODEL_ATT_ACCOUNT) Account account,
			                @ModelAttribute(MODEL_ATT_ACCT_TRANS) AccountTransaction accountTransaction) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		LOG.debug("Deposit: Account ID: -> " + account.getId());
		LOG.debug("Deposit: Amount: -> " + accountTransaction.getAmount());
		
		// get full object from partial object
		account = accountService.getAccountById(account.getId());
		
		Users user = userService.findByUsername(principal.getName());
		
		// Check amount is greater than zero
		if (accountTransaction.getAmount().signum() != 1) {
			
			// Return error
			model.addAttribute(MODEL_ATT_ERROR_MSG, "The deposit amount ($" 
													 + accountTransaction.getAmount()
													 + ") must be greater than $0.00");
			
			// Get all accounts
			List<Account> accountList = accountService.getCheckingAccounts(user);
			accountList.addAll(accountService.getSavingsAccounts(user));
			model.addAttribute(MODEL_ATT_ACCT_LIST, accountList);
			model.addAttribute(MODEL_ATT_ACCOUNT, account);
			model.addAttribute(MODEL_ATT_ACCT_TRANS, accountTransaction);
			
			// Add format patterns
			model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
			
			return Constants.VIEW_DEPOSIT;
		}
		
		// Set Transaction Description
		accountTransaction.setDescription("Online Deposit");
		
		// Set Transaction Type
		accountTransaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE));
		
		// Save Transaction
		accountService.creditTransaction(account, accountTransaction);
		
		// if this is a checking account
		if (accountService.isSavingsAccount(account)) {
			
			// return the savings view - ensure the account for the deposit is in focus
			return Constants.DIR_REDIRECT + Constants.VIEW_SAV_VIEW + "?" + MODEL_ATT_ACCT_SEL_SWITCH + "=" + account.getId();
			
		}
		
		// Return to the checking view - ensure the account for the deposit is in focus
		return Constants.DIR_REDIRECT + Constants.VIEW_CHK_VIEW + "?" + MODEL_ATT_ACCT_SEL_SWITCH + "=" + account.getId();
	}
	
	@GetMapping(Constants.URI_WITHDRAW)
	public String withdraw (Principal principal, Model model) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		Users user = userService.findByUsername(principal.getName());

		// Get all accounts
		List<Account> accountList = accountService.getCheckingAccounts(user);
		accountList.addAll(accountService.getSavingsAccounts(user));
		model.addAttribute(MODEL_ATT_ACCT_LIST, accountList);
		model.addAttribute(MODEL_ATT_ACCOUNT, new Account());
		
		AccountTransaction accountTransaction = new AccountTransaction();
		model.addAttribute(MODEL_ATT_ACCT_TRANS, accountTransaction);
		
		// Add format patterns
		model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
		
		return Constants.VIEW_WITHDRAW;
		
	}
	
	@PostMapping(Constants.URI_WITHDRAW)
	public String withdraw (Principal principal, Model model,
							@ModelAttribute(MODEL_ATT_ACCOUNT) Account account,
							@ModelAttribute(MODEL_ATT_ACCT_TRANS) AccountTransaction accountTransaction) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		LOG.debug("Withdraw: Account ID: -> " + account.getId());
		LOG.debug("Withdraw: Amount: -> " + accountTransaction.getAmount());
		
		// get full object from partial object
		account = accountService.getAccountById(account.getId());
		
		boolean bError = false;
		
		Users user = userService.findByUsername(principal.getName());
		
		// Check amount is greater than zero
		if (accountTransaction.getAmount().signum() != 1) {
			
			// Return error
			model.addAttribute(MODEL_ATT_ERROR_MSG, "The withdraw amount ($" 
													 + accountTransaction.getAmount()
													 + ") must be greater than $0.00");
			
			bError = true;
			
		} else {
			
			// check that amount is not greater than available
			BigDecimal maxAvailable = account.getCurrentBalance().add(account.getAccountType().getOverdraftLimit());
			
			if (accountTransaction.getAmount().compareTo(maxAvailable) == 1) {
				
				// Return error
				model.addAttribute(MODEL_ATT_ERROR_MSG, "The withdraw amount ($" 
														 + accountTransaction.getAmount()
														 + ") is greater than the available balance ($"
														 + account.getCurrentBalance() + ") and overdraft limit ($"
														 + account.getAccountType().getOverdraftLimit() + ").");
				
				bError = true;
			}
		}
		
		if (bError) {
			
			// Get all accounts
			List<Account> accountList = accountService.getCheckingAccounts(user);
			accountList.addAll(accountService.getSavingsAccounts(user));
			model.addAttribute(MODEL_ATT_ACCT_LIST, accountList);
			model.addAttribute(MODEL_ATT_ACCOUNT, account);
			model.addAttribute(MODEL_ATT_ACCT_TRANS, accountTransaction);
			
			// Add format patterns
			model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
			
			return Constants.VIEW_WITHDRAW;
			
		}
		
		// Set Transaction Description
		accountTransaction.setDescription("Online Withdrawl");
		
		// Set Transaction Type
		accountTransaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_WITHDRAWL_CODE));
		
		// SaveTransaction
		accountService.debitTransaction(account, accountTransaction);
		
		// if this is a checking account
		if (accountService.isSavingsAccount(account)) {
			
			// return the savings view - ensure the account for the deposit is in focus
			return Constants.DIR_REDIRECT + Constants.VIEW_SAV_VIEW + "?" + MODEL_ATT_ACCT_SEL_SWITCH + "=" + account.getId();
			
		}
		
		// Return to the checking view - ensure the account for the deposit is in focus
		return Constants.DIR_REDIRECT + Constants.VIEW_CHK_VIEW + "?" + MODEL_ATT_ACCT_SEL_SWITCH + "=" + account.getId();
		
	}
	
	@GetMapping(Constants.URI_XFER_BETWEEN)
	public String transfer (Principal principal, Model model) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
				
		Users user = userService.findByUsername(principal.getName());

		// Get all accounts
		List<Account> accountList = accountService.getCheckingAccounts(user);
		accountList.addAll(accountService.getSavingsAccounts(user));
		model.addAttribute(MODEL_ATT_ACCT_LIST, accountList);
		model.addAttribute(MODEL_ATT_FROM_ACCOUNT, Long.valueOf(0));
		model.addAttribute(MODEL_ATT_TO_ACCOUNT, Long.valueOf(0));

		
		AccountTransaction accountTransaction = new AccountTransaction();
		model.addAttribute(MODEL_ATT_ACCT_TRANS, accountTransaction);
		
		// Add format patterns
		model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
		
		return Constants.VIEW_XFER_BETWEEN;
		
	}
	
	@PostMapping(Constants.URI_XFER_BETWEEN)
	public String transfer (Principal principal, Model model,
							@ModelAttribute(MODEL_ATT_FROM_ACCOUNT) Long fromAccount,
							@ModelAttribute(MODEL_ATT_TO_ACCOUNT) Long toAccount,
							@ModelAttribute(MODEL_ATT_ACCT_TRANS) AccountTransaction accountTransaction) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		LOG.debug("Transfer: From Account ID: -> " + fromAccount);
		LOG.debug("Transfer: To Account ID: -> " + toAccount);
		LOG.debug("Transfer: Amount: -> " + accountTransaction.getAmount());
		
		boolean bError = false;
		
		Account fromAcct = accountService.getAccountById(fromAccount);
		Account toAcct = accountService.getAccountById(toAccount);
		
		Users user = userService.findByUsername(principal.getName());
		
		if (fromAcct.getId() != toAcct.getId()) {
			
			// if balance is not less than transfer amount
			if (fromAcct.getCurrentBalance().compareTo(accountTransaction.getAmount()) != -1){
				
				// Check amount is greater than zero
				if (accountTransaction.getAmount().signum() != 1) {
					
					bError = true;
					model.addAttribute(MODEL_ATT_ERROR_MSG, "The transfer amount ($" 
						 									 + accountTransaction.getAmount()
						 									 + ") must be greater than $0.00");
				}else {
				
					// Execute Transfer
					accountService.transfer(fromAcct, toAcct, accountTransaction);
				}
			} else {
				
				bError = true;
				model.addAttribute(MODEL_ATT_ERROR_MSG, "The amount ($" + accountTransaction.getAmount() 
														 + ") requested for transfer is more than the available balance ($" 
														 + fromAcct.getCurrentBalance() + ").");
			}
		}else {
			
			// Error from and to account cannot be the same
			bError = true;
			model.addAttribute(MODEL_ATT_ERROR_MSG, "Can not trasnsfer from and to the same account.");

		}
		
		if (bError) {
			
			// Get all accounts
			List<Account> accountList = accountService.getCheckingAccounts(user);
			accountList.addAll(accountService.getSavingsAccounts(user));
			model.addAttribute(MODEL_ATT_ACCT_LIST, accountList);
			model.addAttribute(MODEL_ATT_FROM_ACCOUNT, fromAccount);
			model.addAttribute(MODEL_ATT_TO_ACCOUNT, toAccount);
			model.addAttribute(MODEL_ATT_ACCT_TRANS, accountTransaction);
			
			// Add format patterns
			model.addAttribute(MODEL_ATT_PATTERN_TRANS_AMOUNT, Patterns.TRANSACTION_AMOUNT);
			
			return Constants.VIEW_XFER_BETWEEN;
		}
		
		
		// if this is a checking account
		if (accountService.isSavingsAccount(toAcct)) {
			
			// return the savings view - ensure the account for the deposit is in focus
			return Constants.DIR_REDIRECT + Constants.VIEW_SAV_VIEW + "?" + MODEL_ATT_ACCT_SEL_SWITCH + "=" + toAcct.getId();
			
		}
		
		// Return to the checking view - ensure the account for the deposit is in focus
		return Constants.DIR_REDIRECT + Constants.VIEW_CHK_VIEW + "?" + MODEL_ATT_ACCT_SEL_SWITCH + "=" + toAcct.getId();
		
	}
	

}
