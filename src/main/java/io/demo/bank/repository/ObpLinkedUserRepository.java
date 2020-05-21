package io.demo.bank.repository;


import org.springframework.data.repository.CrudRepository;

import io.demo.bank.model.obp.LinkedUser;
import io.demo.bank.model.security.Users;

public interface ObpLinkedUserRepository extends CrudRepository<LinkedUser, Long> {
	
	LinkedUser findByUser(Users user);

}
