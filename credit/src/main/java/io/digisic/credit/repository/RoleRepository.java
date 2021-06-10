package io.digisic.credit.repository;

import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.security.Role;

public interface RoleRepository extends CrudRepository<Role, Long> {
	
	Role findByName(String name);

}
