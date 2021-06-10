package io.digisic.credit.repository;

import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.AuthorizedUsers;

public interface AuthorizedUsersRepository extends CrudRepository<AuthorizedUsers, Long> {
	
	void deleteByCardId(Long id);

}
