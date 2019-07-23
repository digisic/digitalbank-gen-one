package io.demo.bank.repository;

import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.security.UserRole;

public interface UserRoleRepository extends CrudRepository<UserRole, Long> {

}
