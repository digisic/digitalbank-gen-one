package io.digisic.credit.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.Billing;

public interface BillingRepository extends CrudRepository<Billing, Long> {
	
	List<Billing> findAll();
	Billing findByCardId(Long id);
	

}