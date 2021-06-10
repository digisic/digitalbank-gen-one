package io.digisic.credit.config.data;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;

import io.digisic.credit.model.TransactionCategory;
import io.digisic.credit.model.TransactionState;
import io.digisic.credit.model.TransactionType;
import io.digisic.credit.model.UserProfile;
import io.digisic.credit.model.security.Role;
import io.digisic.credit.model.security.Users;
import io.digisic.credit.repository.RoleRepository;
import io.digisic.credit.repository.TransactionCategoryRepository;
import io.digisic.credit.repository.TransactionStateRepository;
import io.digisic.credit.repository.TransactionTypeRepository;
import io.digisic.credit.service.UserService;


@Component
public class DefaultData implements CommandLineRunner, Ordered {

	private static final Logger LOG = LoggerFactory.getLogger(DefaultData.class);

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserService userService;
	
	@Autowired
	private TransactionTypeRepository transactionTypeRepository;
	
	@Autowired
	private TransactionStateRepository transactionStateRepository;
	
	@Autowired
	private TransactionCategoryRepository categoryRepository;
	
	@Override
	public int getOrder() {
		return 1;
	}

	@Override
	public void run(String... args) throws Exception {
		
		LOG.info("*********************************");
		LOG.info("***** Checking Default Data *****");
		
		// Load Roles if they do not exist
		if (roleRepository.findByName(Role.ROLE_USER) == null) {
			
			LOG.info("** Loading Roles...");
			
			List<Role> roles = new ArrayList<Role>();
			
			roles.add(new Role(Role.ROLE_USER));
			roles.add(new Role(Role.ROLE_ADMIN));
			roles.add(new Role(Role.ROLE_API));
			
			roleRepository.saveAll(roles);
			
		}
		
		// If the sample user data does not exist, then create it.
		if (!userService.checkEmailAdressExists("admin@demo.io") && !userService.checkSsnExists("000-00-0000")) {
			
			LOG.info("** Loading Default User...");
			
			Users user = new Users("admin@demo.io", "Demo123!");
			UserProfile userProfile = new UserProfile();
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-DD");
			
			userProfile.setEmailAddress("admin@demo.io");
			userProfile.setFirstName("Admin");
			userProfile.setLastName("User");
			userProfile.setTitle("Mr.");
			userProfile.setGender("M");
			userProfile.setDob(dateFormat.parse("1985-02-15"));
			userProfile.setSsn("000-00-0000");
			userProfile.setAddress("123 Digital Lane");
			userProfile.setCountry("United States");
			userProfile.setLocality("Internet City");
			userProfile.setPostalCode("94302");
			userProfile.setRegion("CA");
			userProfile.setHomePhone("123-456-7890");
			userProfile.setMobilePhone("123-456-7890");
			userProfile.setWorkPhone("123-456-7890");
			
			user.setUserProfile(userProfile);
			userService.createUser(user, Role.ROLE_API);
			userService.addRole(user, Role.ROLE_ADMIN);
			
		}
		
		// Load Transaction Types if they do not exist
		if (transactionTypeRepository.findByCode("ATM") == null) {
			
			LOG.info("** Loading Transaction Types...");
			
			List<TransactionType> transactionTypes = new ArrayList<TransactionType>();

			transactionTypes.add(new TransactionType("CRG", "Charge", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("PMT", "Payment", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("FEE", "Fee", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("LTF", "Late Fee", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("TNF", "Transfer Fee", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("CRD", "Credit", TransactionType.CAT_CREDIT));
			
			transactionTypeRepository.saveAll(transactionTypes);
		}
		
		// Load Transaction States if they do not exist
		if (transactionStateRepository.findByCode("ERR") == null) {
			
			LOG.info("** Loading Transaction States...");
			
			List<TransactionState> transactionStates = new ArrayList<TransactionState>();
			
			transactionStates.add(new TransactionState("ERR", "Error"));
			transactionStates.add(new TransactionState("PND", "Pending"));
			transactionStates.add(new TransactionState("COM", "Complete"));
			transactionStates.add(new TransactionState("REV", "Review"));
			
			transactionStateRepository.saveAll(transactionStates);
		}
		
		// Load Transaction Categories
		if (categoryRepository.findByCode("MIS") == null) {
			
			LOG.info("** Loading Transaction Categories...");
			
			List<TransactionCategory> categories = new ArrayList<TransactionCategory>();
			
			categories.add(new TransactionCategory("MIS", "Misc"));
			categories.add(new TransactionCategory("ENT", "Entertainment"));
			categories.add(new TransactionCategory("EDU", "Education"));
			categories.add(new TransactionCategory("SHP", "Shopping"));
			categories.add(new TransactionCategory("PRC", "Personal Care"));
			categories.add(new TransactionCategory("HLT", "Health & Fitness"));
			categories.add(new TransactionCategory("KID", "Kids"));
			categories.add(new TransactionCategory("FDD", "Food & Dinning"));
			categories.add(new TransactionCategory("AUT", "Auto & Transport"));
			categories.add(new TransactionCategory("TRV", "Travel"));
			categories.add(new TransactionCategory("FEE", "Fees & Charges"));
			categories.add(new TransactionCategory("BUS", "Business Services"));
			
			categoryRepository.saveAll(categories);
			
		}
		
		LOG.info("*********************************");
		
	}
}
