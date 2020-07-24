package io.digisic.bank.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.AccountType;

public interface AccountTypeRepository extends CrudRepository<AccountType, Long> {
	
	AccountType findByName(String name);
	AccountType findByCode(String code);
	
	List<AccountType> findByCategory(String category);
	List<AccountType> findAll();

}
