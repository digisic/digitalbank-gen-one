package io.digisic.bank.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.AccountStanding;



public interface AccountStandingRepository extends CrudRepository<AccountStanding, Long> {
	
	AccountStanding findByName (String name);
	AccountStanding findByCode (String code);
	
	List<AccountStanding> findAll ();

}
