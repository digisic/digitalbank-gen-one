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
import io.demo.bank.model.security.User;
import io.demo.bank.repository.UserRepository;
import io.demo.bank.service.UserService;

@RestController
@PreAuthorize("hasRole('API')")
public class RestUserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	UserRepository userRepository;

	@GetMapping("/api/user")
	public ResponseEntity<?> Users(){
		return ResponseEntity.ok(userService.findUserList());
	}
	
	@GetMapping("/api/user/{id}")
	public ResponseEntity<?> User(@PathVariable("id") Long id) {
		return ResponseEntity.ok(getUser(id));
	}
	
	@GetMapping("/api/user/{id}/profile")
	public ResponseEntity<?> Profile(@PathVariable("id") Long id) {
		return ResponseEntity.ok(getUser(id).getUserProfile());
	}
	
	@GetMapping("/api/user/{id}/roles")
	public ResponseEntity<?> Authorities(@PathVariable("id") Long id) {
		return ResponseEntity.ok(getUser(id).getAuthorities());
	}
	
	@GetMapping("/api/user/{id}/accounts")
	public ResponseEntity<?> Accounts(@PathVariable("id") Long id) {
		return ResponseEntity.ok(getUser(id).getOwnerAccounts());
	}
	
	private User getUser(Long id) {
		
		if (id < 0) {
			throw new RestException ("Invalid User Id " + id, HttpStatus.NOT_ACCEPTABLE);
		}
		
		Optional<User> opt = userRepository.findById(id);
		
		if (!opt.isPresent()) {
			throw new RestException ("User with Id " + id + " not found", HttpStatus.NOT_FOUND);
		}
		
		return opt.get();
	}
}
