package io.digisic.credit.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.CreditApplication;


public interface CreditApplicationRepository extends CrudRepository<CreditApplication, Long> {
	
	List<CreditApplication> findAll ();
	
	Optional<CreditApplication> findById(Long id);

}
