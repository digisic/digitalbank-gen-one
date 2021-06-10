package io.digisic.credit.repository;

import java.util.List;
import org.springframework.data.repository.CrudRepository;

import io.digisic.credit.model.UserProfile;

public interface UserProfileRepository extends CrudRepository<UserProfile, Long> {
	
	UserProfile findByEmailAddress(String paramString);
	  
	UserProfile findBySsn(String paramString);
	  
	List<UserProfile> findAll();

}