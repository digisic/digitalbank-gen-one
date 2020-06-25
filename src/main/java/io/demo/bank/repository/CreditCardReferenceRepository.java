package io.demo.bank.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.CreditCardReference;


public interface CreditCardReferenceRepository extends CrudRepository<CreditCardReference, Long>  {
	
	Optional<CreditCardReference> findById(Long Id);
	Optional<CreditCardReference> findByBankUserId(Long userId);
	Optional<CreditCardReference> findByCorrelationId(String correlationId);
	Optional<CreditCardReference> findByCreditUserId(Long userId);
	Optional<CreditCardReference> findByApplicationId(Long applicationId);
	List<CreditCardReference> findAll();

}
