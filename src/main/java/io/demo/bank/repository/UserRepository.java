package io.demo.bank.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.security.User;

public interface UserRepository extends CrudRepository<User, Long> {

	User findByUsername(String paramString);
	  
	List<User> findAll();
}
