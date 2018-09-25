package io.demo.bank.repository;

import org.springframework.data.repository.CrudRepository;

import io.demo.bank.model.TransactionState;


public interface TransactionStateRepository extends CrudRepository<TransactionState, Long> {
	
	TransactionState findByName (String name);
	TransactionState findByCode (String code);

}
