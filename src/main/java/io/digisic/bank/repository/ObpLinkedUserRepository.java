package io.digisic.bank.repository;


import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.obp.LinkedUser;
import io.digisic.bank.model.security.Users;

public interface ObpLinkedUserRepository extends CrudRepository<LinkedUser, Long> {
	
	LinkedUser findByUser(Users user);

}
