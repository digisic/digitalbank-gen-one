package io.demo.bank.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.CreditReference;


public interface CreditReferenceRepository extends CrudRepository<CreditReference, Long>  {
	
	Optional<CreditReference> findById(Long Id);
	Optional<CreditReference> findByBankUserId(Long userId);
	Optional<CreditReference> findByCreditUserId(Long userId);

}
