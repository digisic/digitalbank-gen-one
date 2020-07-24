package io.digisic.bank.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.Account;
import io.digisic.bank.model.AccountType;
import io.digisic.bank.model.security.Users;


public interface AccountRepository extends CrudRepository<Account, Long> {
		
	List<Account> findAll ();
	
	List<Account> findByAccountType (AccountType accountType);
	
	List<Account> findByAccountType_Category (String category);
	
	List<Account> findByOwner (Users user);
	
	List<Account> findByCoowner (Users user);
	
	List<Account> findByOwnerAndAccountType (Users user, AccountType accountType);
	
	List<Account> findByCoownerAndAccountType (Users user, AccountType accountType);
	
	List<Account> findByOwnerAndAccountType_Category (Users user, String category);
	
	List<Account> findByCoownerAndAccountType_Category (Users user, String category);
	
}
