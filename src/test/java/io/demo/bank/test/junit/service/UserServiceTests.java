package io.demo.bank.test.junit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

import io.demo.bank.service.UserService;

@ContextConfiguration(classes = UserService.class)
@SpringBootTest
public class UserServiceTests {
	
	@Autowired
	private UserService userSvc;
	
	// TODO: Make tests!

}
