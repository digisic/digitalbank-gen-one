package io.digisic.bank.repository;

import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.security.UserRole;

public interface UserRoleRepository extends CrudRepository<UserRole, Long> {

}
