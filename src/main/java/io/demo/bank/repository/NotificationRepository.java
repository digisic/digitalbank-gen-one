package io.demo.bank.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.Notification;
import io.demo.bank.model.security.User;

public interface NotificationRepository extends CrudRepository<Notification, Long> {

	List<Notification> findByUsers(User paramUsers);
	  
	List<Notification> findAll();
}
