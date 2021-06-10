package io.digisic.bank.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.Notification;
import io.digisic.bank.model.security.Users;

public interface NotificationRepository extends CrudRepository<Notification, Long> {

	List<Notification> findByUsers(Users paramUsers);
	  
	List<Notification> findAll();
}
