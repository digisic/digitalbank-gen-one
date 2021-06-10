package io.digisic.bank.controller.web;


import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.digisic.bank.model.obp.Account;
import io.digisic.bank.model.obp.Bank;
import io.digisic.bank.model.obp.LinkedAccount;
import io.digisic.bank.model.obp.Transaction;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.ObpService;
import io.digisic.bank.service.UserService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;



@Controller
@RequestMapping(Constants.URI_OBP)
public class WebObpController extends WebCommonController {
	
	// Class Logger
	private static final Logger LOG = LoggerFactory.getLogger(WebObpController.class);
		
	
	@Autowired
	private ObpService obpService;
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping(Constants.URI_OBP_ADD)
	public String getObpBankAccount(Principal principal, Model model) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		List<Bank> banks = obpService.getBanks();
		
		model.addAttribute(MODEL_OBP_BANKS, banks);
		
		if (banks.size() < 1)
			model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.OBP_NO_BANKS);
		    
		return Constants.VIEW_OBP_ADD;
	}
	
	@PostMapping(Constants.URI_OBP_ADD)
	public String postObpBankAccount(Principal principal, Model model,
									@ModelAttribute(MODEL_OBP_BANK_ID) String bankId,
									@ModelAttribute(MODEL_OBP_USERNAME) String username,
									@ModelAttribute(MODEL_OBP_PASSWORD) String password) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		List<Bank> bankList = obpService.getBanks();
		
		// Get the user that has been authenticated
		Users user = userService.findByUsername(principal.getName());
		
		if (obpService.authenticateObpService(user, username, password)) {
			
			List<Account> accounts = obpService.getAccounts(bankId);
			
			if (accounts.size() < 1) {
				model.addAttribute(MODEL_OBP_BANKS, bankList);
				model.addAttribute(MODEL_OBP_BANK_ID, bankId);
				model.addAttribute(MODEL_OBP_USERNAME, username);
				model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.OBP_NO_ACCOUNTS);
				
				LOG.debug("No Accounts found for user at bank " + bankId + " on the Open Banking platform");
				
				return Constants.VIEW_OBP_ADD;
			}
			
			Bank bank = obpService.getBank(bankId);
			
			if (bank != null) {

				model.addAttribute(MODEL_OBP_ACCOUNTS, accounts);
				model.addAttribute(MODEL_OBP_BANK, bank);
				
				return Constants.VIEW_OBP_ADD_ACCT;
				
			} else {
				
				model.addAttribute(MODEL_OBP_BANKS, bankList);
				model.addAttribute(MODEL_OBP_BANK_ID, bankId);
				model.addAttribute(MODEL_OBP_USERNAME, username);
				model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.OBP_NO_BANK_DETAILS);
				
				return Constants.VIEW_OBP_ADD;
			}
			
		}
		else {
			
			LOG.debug("Error Authenticating to Open Banking platform");
			
			// We had an authentication error
			model.addAttribute(MODEL_OBP_BANKS, bankList);
			model.addAttribute(MODEL_OBP_BANK_ID, bankId);
			model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.OBP_NO_AUTHENTICATION);
			return Constants.VIEW_OBP_ADD;
		}

	}
	
	
	@PostMapping(Constants.URI_OBP_ADD_ACCT)
	public String postObpBankAccountAdd(Principal principal, Model model,
									@ModelAttribute(MODEL_OBP_BANK_ID) String bankId,
									@ModelAttribute(MODEL_OBP_ACCOUNT_ID) String accountId) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		// Get the user that has been authenticated
		Users user = userService.findByUsername(principal.getName());
		
		
		Bank bank = obpService.getBank(bankId);
		Account account = obpService.getAccount(bankId, accountId);
		List<Account> accounts = obpService.getAccounts(bankId);
		
		// Make sure we can get the full details for the bank and the account
		if (bank == null || account == null) {
			
			if (bank == null) {
				bank = new Bank();
				model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.OBP_NO_BANK_DETAILS_ACCT);
			}
			
			if (account == null) {
				
				model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.OBP_NO_ACCOUNT_DETAILS);
			}
			
			
			model.addAttribute(MODEL_OBP_ACCOUNTS, accounts);
			model.addAttribute(MODEL_OBP_BANK, bank);
			
			return Constants.VIEW_OBP_ADD_ACCT;
		}
		

		// Check to see if this account is already linked
		if (obpService.getLinkedAccountbyAccountId(accountId) != null) {
			
			model.addAttribute(MODEL_OBP_ACCOUNTS, accounts);
			model.addAttribute(MODEL_OBP_BANK, bank);
			model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.OBP_ACCOUNT_LINKED);
			return Constants.VIEW_OBP_ADD_ACCT;
		}
		
		
		obpService.LinkObpAccount(user, bank, account);
	
		List<LinkedAccount> linkedAccounts = obpService.getLinkedAccounts(user);

		long selectId = 0;
		
		// Get the linkedAccountId for the account we just linked
		for (LinkedAccount linkedAccount : linkedAccounts) {
			if (linkedAccount.getAccountId().equals(account.getId()))
				selectId = linkedAccount.getId();
		}
		
		return Constants.DIR_REDIRECT + Constants.VIEW_OBP_VIEW + "?" + MODEL_ATT_ACCT_SEL_SWITCH + "=" + selectId;

	}
	
	@GetMapping(Constants.URI_OBP_VIEW)
	public String getObpBankAccountView(Principal principal, Model model,
			 						    @ModelAttribute(MODEL_ATT_ACCT_SEL_SWITCH) ArrayList<String> selectSwitch) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		// Get the user that has been authenticated
		Users user = userService.findByUsername(principal.getName());
		
		long selectId = 0;
		
		if (selectSwitch.size() > 0) {
			
			selectId = Long.valueOf(selectSwitch.get(0));
		}
		
		
		List<LinkedAccount> linkedAccounts = obpService.getLinkedAccounts(user);
		
		// Make sure we have linked accounts
		if (linkedAccounts.size() > 0) {
			
			String bankId = "";
			String accountId = "";
			
			// If we don't have a selected Id, then default to first account
			if (selectId < 1) {	
			
				bankId = linkedAccounts.get(0).getBankId();
				accountId = linkedAccounts.get(0).getAccountId();
				selectId = linkedAccounts.get(0).getId();
				
			}  else {
				
				// Find the Linked Account selected
				for (LinkedAccount linkedAccount : linkedAccounts) {
					
					if (linkedAccount.getId() == selectId) {
						
						bankId = linkedAccounts.get(0).getBankId();
						accountId = linkedAccounts.get(0).getAccountId();
					
					} // End If
				
				} // End For
			
			} // end else
			
			Bank bank = obpService.getBank(bankId);
			Account account = obpService.getAccount(bankId, accountId);
			
			// If we can not get the bank or account detail
			if (bank == null || account == null) {
				
				
				// Send empty transaction list
				List<Transaction> transactionList = new ArrayList<Transaction>();
				
				model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.OBP_ACCOUNT_VIEW_ERROR);
				
				// Send cached list of linked account data
				model.addAttribute(MODEL_OBP_ACCOUNTS, linkedAccounts);
				model.addAttribute(MODEL_OBP_TRANSACTIONS, transactionList);
				
			} else {
				
				List<Transaction> transactionList = obpService.getAccountTransactions(bank, account);
				
				if (obpService.syncLinkedAccounts(linkedAccounts)) {
					
				} else {
					
					// Get the updated linked account list
					linkedAccounts = obpService.getLinkedAccounts(user);
					
					model.addAttribute(MODEL_ATT_ERROR_MSG, Messages.OBP_ACCOUNT_VIEW_ERROR);
					
				}
				
				model.addAttribute(MODEL_OBP_ACCOUNTS, linkedAccounts);
				model.addAttribute(MODEL_OBP_TRANSACTIONS, transactionList);
				
			}
			
			
			
		} // End if linked accounts exist
		else {
			model.addAttribute(MODEL_ATT_ACCT_NONE, true);
		}
		
		model.addAttribute(MODEL_ATT_ACCT_SEL_ID, selectId);
		model.addAttribute(MODEL_ATT_ACCT_SEL_SWITCH, new ArrayList<String>());
		
		
		return Constants.VIEW_OBP_VIEW;

	}
	
	@GetMapping(Constants.URI_OBP_DELETE)
	public String deleteObpLinkedAccount(Principal principal, Model model,
										@ModelAttribute(MODEL_ATT_ACCT_SEL_SWITCH) Long deleteId) {
		
		// Set Display Defaults
		setDisplayDefaults(principal, model);
		
		LOG.debug("OBP Account to Delete = " + deleteId);
		
		LinkedAccount linkedAccount = obpService.getLinkedAccount(deleteId);
		
		if (linkedAccount != null)
			obpService.deleteLinkedAccount(linkedAccount);
		    
		return Constants.DIR_REDIRECT + Constants.VIEW_OBP_VIEW;
	}
	
}
