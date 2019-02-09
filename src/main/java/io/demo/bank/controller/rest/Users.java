package io.demo.bank.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


import io.demo.bank.service.UserService;

@RestController
@PreAuthorize("hasRole('USER')")
public class Users {
	
	@Autowired
	UserService userService;

	@GetMapping("/api/users")
	public List<io.demo.bank.model.security.Users> findAllUsers(){
		
		return userService.findUserList();
		
	}
}
