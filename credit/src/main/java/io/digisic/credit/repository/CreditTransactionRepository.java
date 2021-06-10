package io.digisic.credit.repository;

import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.CreditTransaction;

public interface CreditTransactionRepository extends CrudRepository<CreditTransaction, Long>{
	

}
