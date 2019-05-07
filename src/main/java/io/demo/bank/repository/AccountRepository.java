package io.demo.bank.repository;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.Account;
import io.demo.bank.model.AccountType;
import io.demo.bank.model.security.User;



public interface AccountRepository extends CrudRepository<Account, Long> {
	
	@Query ("select coalesce(max(accountNumber), 10000000) from Account")
	Long findMaxAccountNumber();
	
	List<Account> findAll ();
	
	List<Account> findByAccountType (AccountType accountType);
	
	List<Account> findByAccountType_Category (String category);
	
	List<Account> findByOwner (User user);
	
	List<Account> findByCoowner (User user);
	
	List<Account> findByOwnerAndAccountType (User user, AccountType accountType);
	
	List<Account> findByCoownerAndAccountType (User user, AccountType accountType);
	
	List<Account> findByOwnerAndAccountType_Category (User user, String category);
	
	List<Account> findByCoownerAndAccountType_Category (User user, String category);
	
}
