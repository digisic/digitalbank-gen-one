package io.demo.bank.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import io.demo.bank.model.OwnershipType;


public interface OwnershipTypeRepository extends CrudRepository<OwnershipType, Long> {
	
	OwnershipType findByName (String name);
	OwnershipType findByCode (String code);
	
	List<OwnershipType> findAll();

}
