package io.digisic.bank.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

import io.digisic.bank.model.UserProfile;

public interface UserProfileRepository extends CrudRepository<UserProfile, Long> {
	
	UserProfile findByEmailAddress(String paramString);
	  
	UserProfile findBySsn(String paramString);
	  
	List<UserProfile> findAll();

}
