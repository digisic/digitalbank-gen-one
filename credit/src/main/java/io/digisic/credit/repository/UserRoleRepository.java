package io.digisic.credit.repository;

import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.security.UserRole;

public interface UserRoleRepository extends CrudRepository<UserRole, Long> {

}
