package io.digisic.bank.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.TransactionCategory;

public interface TransactionCategoryRepository extends CrudRepository<TransactionCategory, Long>{
	
	TransactionCategory findByName (String name);
	TransactionCategory findByCode (String code);
	
	List<TransactionCategory> findAll();

}
