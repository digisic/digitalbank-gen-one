package io.demo.bank.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import io.demo.bank.model.Notification;
import io.demo.bank.model.security.Users;

public interface NotificationRepository extends CrudRepository<Notification, Long> {

	List<Notification> findByUsers(Users paramUsers);
	  
	List<Notification> findAll();
}
