package io.demo.bank.repository;


import java.util.List;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.Account;
import io.demo.bank.model.AccountType;
import io.demo.bank.model.security.Users;



public interface AccountRepository extends CrudRepository<Account, Long> {
	
	@Query ("select coalesce(max(accountNumber), 10000000) from Account")
	Long findMaxAccountNumber();
	
	List<Account> findByOwner (Users user);
	
	List<Account> findByCoowner (Users user);
	
	List<Account> findByOwnerAndAccountType (Users user, AccountType accountType);
	
	List<Account> findByCoownerAndAccountType (Users user, AccountType accountType);
	
	List<Account> findByOwnerAndAccountType_Category (Users user, String category);
	
	List<Account> findByCoownerAndAccountType_Category (Users user, String category);
	
}
