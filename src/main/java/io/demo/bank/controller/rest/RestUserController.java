package io.demo.bank.controller.rest;

import java.util.Optional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import io.demo.bank.config.exception.RestBadRequestException;
import io.demo.bank.config.exception.RestNotAcceptableException;
import io.demo.bank.config.exception.RestObjectNotFoundException;
import io.demo.bank.model.security.Role;
import io.demo.bank.model.security.User;
import io.demo.bank.repository.UserRepository;
import io.demo.bank.service.UserService;
import io.demo.bank.util.Messages;

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
	
	@PostMapping("/api/user")
	public ResponseEntity<?> CreateUser(@RequestBody @Valid User newUser) {	
		
		if (userService.checkEmailAdressExists(newUser.getUserProfile().getEmailAddress())) {
			throw new RestNotAcceptableException (Messages.USER_EMAIL_EXISTS);
		}
		
		if(userService.checkSsnExists(newUser.getUserProfile().getSsn())) {
			throw new RestNotAcceptableException (Messages.USER_SSN_EXISTS);
		}
		
		return ResponseEntity.ok(userService.createUser(newUser, Role.ROLE_USER));
	}
	
	@GetMapping("/api/user/{id}")
	public ResponseEntity<?> User(@PathVariable("id") Long id) {
		return ResponseEntity.ok(getUser(id));
	}
	
	@GetMapping("/api/user/{id}/profile")
	public ResponseEntity<?> Profile(@PathVariable("id") Long id) {
		return ResponseEntity.ok(getUser(id).getUserProfile());
	}
	
	@PostMapping("/api/user/{id}/roles")
	public ResponseEntity<?> AddAuthority(@PathVariable("id") Long id) {
		return ResponseEntity.ok(getUser(id).getAuthorities());
	}
	
	@GetMapping("/api/user/{id}/accounts")
	public ResponseEntity<?> Accounts(@PathVariable("id") Long id) {
		return ResponseEntity.ok(getUser(id).getOwnerAccounts());
	}
	
	private User getUser(Long id) {
		
		if (id < 0) {
			throw new RestBadRequestException (Messages.INVALID_OBJECT_ID);
		}
		
		Optional<User> opt = userRepository.findById(id);
		
		if (!opt.isPresent()) {
			throw new RestObjectNotFoundException (Messages.OBJECT_NOT_FOUND + id);
		}
		
		return opt.get();
	}
	
}
