package io.demo.bank.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.UserProfile;

public interface UserProfileRepository extends CrudRepository<UserProfile, Long> {
	
	UserProfile findByEmailAddress(String paramString);
	  
	UserProfile findBySsn(String paramString);
	  
	List<UserProfile> findAll();

}
