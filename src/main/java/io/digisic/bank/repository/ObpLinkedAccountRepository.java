package io.digisic.bank.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.obp.LinkedAccount;
import io.digisic.bank.model.security.Users;

public interface ObpLinkedAccountRepository extends CrudRepository<LinkedAccount, Long>{
	
	List<LinkedAccount> findByUser (Users user);
	
	LinkedAccount findByAccountId(String accountId);

}
