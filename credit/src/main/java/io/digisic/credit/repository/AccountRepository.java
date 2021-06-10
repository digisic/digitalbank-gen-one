package io.digisic.credit.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.Account;
import io.digisic.credit.model.security.Users;

public interface AccountRepository extends CrudRepository<Account, Long> {
	
	List<Account> findAll ();
	
	Account findByAccountOwner (Users owner);

}
