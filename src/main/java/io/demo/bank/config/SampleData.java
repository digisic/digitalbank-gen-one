package io.demo.bank.config;

import java.text.SimpleDateFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import io.demo.bank.model.UserProfile;
import io.demo.bank.model.security.Role;
import io.demo.bank.model.security.User;
import io.demo.bank.service.UserService;



@Component
public class SampleData implements CommandLineRunner, Ordered {

	private static final Logger LOG = LoggerFactory.getLogger(SampleData.class);
	
	@Autowired
	private UserService userService;
	
	@Override
	public int getOrder() {
		return 2;
	}

	@Override
	public void run(String... args) throws Exception {
		
		LOG.info("*********************************");
		LOG.info("***** Checking Sample Data ******");
		
		// If the sample user data does not exist, then create it.
		if (!userService.checkEmailAdressExists("jsmith@demo.io") && !userService.checkSsnExists("123-45-6789")) {
			
			LOG.info("** Loading Sample User...");
			
			User user = new User("jsmith@demo.io", "Demo123!");
			UserProfile userProfile = new UserProfile();
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD");
			
			userProfile.setEmailAddress("jsmith@demo.io");
			userProfile.setFirstName("Josh");
			userProfile.setLastName("Smith");
			userProfile.setTitle("Mr.");
			userProfile.setGender("M");
			userProfile.setDob(dateFormat.parse("1985-02-15"));
			userProfile.setSsn("123-45-6789");
			userProfile.setAddress("123 Digital Lane");
			userProfile.setCountry("United States");
			userProfile.setLocality("Internet City");
			userProfile.setPostalCode("94302");
			userProfile.setRegion("CA");
			userProfile.setHomePhone("123-456-7890");
			userProfile.setMobilePhone("123-456-7890");
			userProfile.setWorkPhone("123-456-7890");
			
			user.setUserProfile(userProfile);
			userService.createUser(user, Role.ROLE_USER);
			userService.addRole(user, Role.ROLE_API);
			
			LOG.info("** Username: jsmith@demo.io");
			LOG.info("** Password: Demo123!");
			
			// Create a user for testing supporting Change Password
			user = new User("nsmith@demo.io", "Demo123!");
			userProfile = new UserProfile();
			
			userProfile.setEmailAddress("nsmith@demo.io");
			userProfile.setFirstName("Nicole");
			userProfile.setLastName("Smith");
			userProfile.setTitle("Mrs.");
			userProfile.setGender("F");
			userProfile.setDob(dateFormat.parse("1985-02-15"));
			userProfile.setSsn("123-45-6710");
			userProfile.setAddress("456 Digital Lane");
			userProfile.setCountry("United States");
			userProfile.setLocality("Internet City");
			userProfile.setPostalCode("94302");
			userProfile.setRegion("CA");
			userProfile.setHomePhone("123-456-7810");
			userProfile.setMobilePhone("123-456-7810");
			userProfile.setWorkPhone("123-456-7810");
			
			user.setUserProfile(userProfile);
			userService.createUser(user, Role.ROLE_USER);
			userService.addRole(user, Role.ROLE_API);
			
			
			// Create a user that is not enabled for testing Login
			user = new User("disabled@demo.io", "Demo123!");
			user.setEnabled(false);
			userProfile = new UserProfile();
			
			userProfile.setEmailAddress("disabled@demo.io");
			userProfile.setFirstName("Emmit");
			userProfile.setLastName("Smith");
			userProfile.setTitle("Mr.");
			userProfile.setGender("M");
			userProfile.setDob(dateFormat.parse("1985-02-15"));
			userProfile.setSsn("123-45-6720");
			userProfile.setAddress("456 Digital Lane");
			userProfile.setCountry("United States");
			userProfile.setLocality("Internet City");
			userProfile.setPostalCode("94302");
			userProfile.setRegion("CA");
			userProfile.setHomePhone("123-456-7810");
			userProfile.setMobilePhone("123-456-7810");
			userProfile.setWorkPhone("123-456-7810");
			
			user.setUserProfile(userProfile);
			userService.createUser(user, Role.ROLE_USER);
			userService.addRole(user, Role.ROLE_API);
			
			// Create a user that is expired for testing Login
			user = new User("expired@demo.io", "Demo123!");
			user.setAccountNonExpired(false);
			userProfile = new UserProfile();
			
			userProfile.setEmailAddress("expired@demo.io");
			userProfile.setFirstName("Emerson");
			userProfile.setLastName("Smith");
			userProfile.setTitle("Mr.");
			userProfile.setGender("M");
			userProfile.setDob(dateFormat.parse("1985-02-15"));
			userProfile.setSsn("123-45-6730");
			userProfile.setAddress("456 Digital Lane");
			userProfile.setCountry("United States");
			userProfile.setLocality("Internet City");
			userProfile.setPostalCode("94302");
			userProfile.setRegion("CA");
			userProfile.setHomePhone("123-456-7810");
			userProfile.setMobilePhone("123-456-7810");
			userProfile.setWorkPhone("123-456-7810");
			
			user.setUserProfile(userProfile);
			userService.createUser(user, Role.ROLE_USER);
			userService.addRole(user, Role.ROLE_API);
			
			// Create a user that is locked for testing Login
			user = new User("locked@demo.io", "Demo123!");
			user.setAccountNonLocked(false);
			userProfile = new UserProfile();
			
			userProfile.setEmailAddress("locked@demo.io");
			userProfile.setFirstName("Everson");
			userProfile.setLastName("Smith");
			userProfile.setTitle("Mr.");
			userProfile.setGender("M");
			userProfile.setDob(dateFormat.parse("1985-02-15"));
			userProfile.setSsn("123-45-6740");
			userProfile.setAddress("456 Digital Lane");
			userProfile.setCountry("United States");
			userProfile.setLocality("Internet City");
			userProfile.setPostalCode("94302");
			userProfile.setRegion("CA");
			userProfile.setHomePhone("123-456-7810");
			userProfile.setMobilePhone("123-456-7810");
			userProfile.setWorkPhone("123-456-7810");
			
			user.setUserProfile(userProfile);
			userService.createUser(user, Role.ROLE_USER);
			userService.addRole(user, Role.ROLE_API);
			
			// Create a user that has expired password for testing Login
			user = new User("expiredPassword@demo.io", "Demo123!");
			user.setAccountNonExpired(false);
			userProfile = new UserProfile();
			
			userProfile.setEmailAddress("expiredPasswordPassword@demo.io");
			userProfile.setFirstName("Eddie");
			userProfile.setLastName("Smith");
			userProfile.setTitle("Mr.");
			userProfile.setGender("M");
			userProfile.setDob(dateFormat.parse("1985-02-15"));
			userProfile.setSsn("123-45-6750");
			userProfile.setAddress("456 Digital Lane");
			userProfile.setCountry("United States");
			userProfile.setLocality("Internet City");
			userProfile.setPostalCode("94302");
			userProfile.setRegion("CA");
			userProfile.setHomePhone("123-456-7810");
			userProfile.setMobilePhone("123-456-7810");
			userProfile.setWorkPhone("123-456-7810");
			
			user.setUserProfile(userProfile);
			userService.createUser(user, Role.ROLE_USER);
			userService.addRole(user, Role.ROLE_API);
			
		}
		
		LOG.info("*********************************");
	}

}
