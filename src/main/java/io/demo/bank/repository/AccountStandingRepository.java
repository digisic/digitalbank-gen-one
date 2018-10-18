package io.demo.bank.repository;

import org.springframework.data.repository.CrudRepository;

import io.demo.bank.model.AccountStanding;



public interface AccountStandingRepository extends CrudRepository<AccountStanding, Long> {
	
	AccountStanding findByName (String name);
	AccountStanding findByCode (String code);

}
