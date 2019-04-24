package io.demo.bank.controller.rest;


import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import io.demo.bank.config.exception.RestException;
import io.demo.bank.repository.TransactionTypeRepository;

@RestController
@PreAuthorize("hasRole('API')")
public class RestTransactionTypeController {
	
	@Autowired
	TransactionTypeRepository transactionTypeRepository;
	
	@GetMapping("/api/transactionType")
	public ResponseEntity<?> TransactionTypes() {
		return ResponseEntity.ok(transactionTypeRepository.findAll());
	}

	@GetMapping("/api/transactionType/{id}")
	public ResponseEntity<?> TransactionType(@PathVariable("id") Long id) {
		
		if (id < 0) {
			throw new RestException ("Invalid TransactionType Id = " + id, HttpStatus.NOT_ACCEPTABLE);
		}
		
		Optional<io.demo.bank.model.TransactionType> opt = transactionTypeRepository.findById(id);
		
		if (!opt.isPresent()) {
			throw new RestException ("TransactionType with Id = " + id + " not found", HttpStatus.NOT_FOUND);
		}
		
		return ResponseEntity.ok(opt);
	}
}
