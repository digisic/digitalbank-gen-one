package io.digisic.bank.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.OwnershipType;


public interface OwnershipTypeRepository extends CrudRepository<OwnershipType, Long> {
	
	OwnershipType findByName (String name);
	OwnershipType findByCode (String code);
	
	List<OwnershipType> findAll();

}
