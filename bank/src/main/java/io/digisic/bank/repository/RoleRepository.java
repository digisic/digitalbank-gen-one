package io.digisic.bank.repository;

import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.security.Role;

public interface RoleRepository extends CrudRepository<Role, Long> {
	
	Role findByName(String name);

}
