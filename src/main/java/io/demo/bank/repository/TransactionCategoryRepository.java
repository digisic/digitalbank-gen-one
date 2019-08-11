package io.demo.bank.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.TransactionCategory;

public interface TransactionCategoryRepository extends CrudRepository<TransactionCategory, Long>{
	
	TransactionCategory findByName (String name);
	TransactionCategory findByCode (String code);
	
	List<TransactionCategory> findAll();

}
