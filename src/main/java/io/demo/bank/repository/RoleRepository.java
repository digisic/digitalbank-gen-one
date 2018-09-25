package io.demo.bank.repository;

import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.security.Role;

public interface RoleRepository extends CrudRepository<Role, Long> {
	
	Role findByName(String name);

}
