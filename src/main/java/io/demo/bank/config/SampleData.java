package io.demo.bank.config;

import java.text.SimpleDateFormat;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import io.demo.bank.model.UserProfile;
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
			userService.createUser(user);
			
			LOG.info("** Username: jsmith@demo.io");
			LOG.info("** Password: Demo123!");
			
		}
		
		LOG.info("*********************************");
	}

}
