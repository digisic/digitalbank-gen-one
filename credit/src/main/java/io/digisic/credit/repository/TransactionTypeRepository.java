package io.digisic.credit.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.TransactionType;



public interface TransactionTypeRepository extends CrudRepository<TransactionType, Long> {
	
	TransactionType findByName (String name);
	TransactionType findByCode (String code);
	
	List<TransactionType> findAll();

}
