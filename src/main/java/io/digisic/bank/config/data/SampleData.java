package io.digisic.bank.config.data;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.SampleDataService;
import io.digisic.bank.service.UserService;


@Component
public class SampleData implements CommandLineRunner, Ordered {

	private static final Logger LOG = LoggerFactory.getLogger(SampleData.class);
	
	@Autowired
	private UserService userService;
		
	@Autowired
	private SampleDataService sampleDataService;
	
	
	@Override
	public int getOrder() {
		return 1;
	}

	@Override
	public void run(String... args) throws Exception {
		
		LOG.info("*********************************");
		LOG.info("***** Checking Sample Data ******");
		
		// If the sample user data does not exist, then create it.
		if (!userService.checkEmailAdressExists(SampleDataService.SMPL_MALE_EMAIL) && !userService.checkEmailAdressExists(SampleDataService.SMPL_FEMALE_EMAIL)) {
			
			// ******************************************************************
			// Male User
			// ******************************************************************
			
			// Create Male
			LOG.info("** Loading Sample User " + SampleDataService.SMPL_MALE_FIRST_NAME + " " + SampleDataService.SMPL_COMMON_LAST_NAME + " ...");
			
			Users owner = sampleDataService.createSampleMaleUser();
			
			LOG.info("**     Username: " + SampleDataService.SMPL_MALE_EMAIL);
			LOG.info("**     Password: " + SampleDataService.SMPL_COMMON_PASSWORD);
			
			
			// ******************************************************************
			// Female User
			// ******************************************************************
			
			// Create Female
			LOG.info("** Loading Sample User " + SampleDataService.SMPL_FEMALE_FIRST_NAME + " " + SampleDataService.SMPL_COMMON_LAST_NAME + " ...");
			
			Users coowner = sampleDataService.createSampleFemaleUser();
	
			LOG.info("**     Username: " + SampleDataService.SMPL_FEMALE_EMAIL);
			LOG.info("**     Password: " + SampleDataService.SMPL_COMMON_PASSWORD);
			
			// ******************************************************************
			// Personal Savings Account
			// ******************************************************************
			LOG.info("** Loading Account " + SampleDataService.SMPL_INDIVIDUAL_SAVINGS + " for " + owner.getUserProfile().getFirstName() + " ...");
			sampleDataService.createIndividualSavings(owner);
			
			// ******************************************************************
			// Personal Savings Account
			// ******************************************************************
			LOG.info("** Loading Account " + SampleDataService.SMPL_INDIVIDUAL_SAVINGS + " for " + coowner.getUserProfile().getFirstName() + " ...");
			sampleDataService.createIndividualSavings(coowner);
			
			// ******************************************************************
			// Personal Checking Account
			// ******************************************************************
			LOG.info("** Loading Account " + SampleDataService.SMPL_INDIVIDUAL_CHECKING + " for " + coowner.getUserProfile().getFirstName() + " ...");
			sampleDataService.createIndividualChecking(coowner);
			
			
			// ******************************************************************
			// Joint Savings Account
			// ******************************************************************
			LOG.info("** Loading Account " + SampleDataService.SMPL_JOINT_SAVINGS + " ...");
			sampleDataService.createJointSavings(owner, coowner);
			
			
			// ******************************************************************
			// Joint Checking Account
			// ******************************************************************
			LOG.info("** Loading Account " + SampleDataService.SMPL_JOINT_CHECKING + " ...");
			sampleDataService.createJointChecking(owner, coowner);
			
		}
		
		LOG.info("*********************************");
	}
	
}
