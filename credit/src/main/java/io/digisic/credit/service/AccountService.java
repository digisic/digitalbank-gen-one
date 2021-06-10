package io.digisic.credit.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.digisic.credit.model.Account;
import io.digisic.credit.model.security.Users;
import io.digisic.credit.repository.AccountRepository;

@Service
@Transactional
public class AccountService {
	
	@Autowired
	private AccountRepository accountRepository;
	
	/*
	 * Creates a new Account for the user if the user does not have an account
	 * If the user has an existing Account, the existing Account will be returned
	 */
	public Account createAccount (Users user) {
		
		Account account = getUserAccount (user);
		
		if (account == null) { // create new account
			
			account = new Account();
			account.setAccountOwner(user);
			account.setDateOpened(new Date());		
			accountRepository.save(account);
		}
		
		return account;
	}
	
	/*
	 * Returns an Account for the User or Null if the User does not have an account
	 */
	public Account getUserAccount (Users user) {
		
		return accountRepository.findByAccountOwner(user);
	}
	

}
