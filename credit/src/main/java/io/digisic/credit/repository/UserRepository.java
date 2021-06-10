package io.digisic.credit.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.security.Users;

public interface UserRepository extends CrudRepository<Users, Long> {

	Users findByUsername(String paramString);
	  
	List<Users> findAll();
}