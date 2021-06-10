package io.digisic.bank.config.data;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import com.github.javafaker.Faker;

import io.digisic.bank.model.AccountStanding;
import io.digisic.bank.model.AccountType;
import io.digisic.bank.model.OwnershipType;
import io.digisic.bank.model.TransactionCategory;
import io.digisic.bank.model.TransactionState;
import io.digisic.bank.model.TransactionType;
import io.digisic.bank.model.UserProfile;
import io.digisic.bank.model.security.Role;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.repository.AccountStandingRepository;
import io.digisic.bank.repository.AccountTypeRepository;
import io.digisic.bank.repository.OwnershipTypeRepository;
import io.digisic.bank.repository.RoleRepository;
import io.digisic.bank.repository.TransactionCategoryRepository;
import io.digisic.bank.repository.TransactionStateRepository;
import io.digisic.bank.repository.TransactionTypeRepository;
import io.digisic.bank.service.UserService;


@Component
public class DefaultData implements CommandLineRunner, Ordered {
	
	// Logger
	private static final Logger LOG = LoggerFactory.getLogger(DefaultData.class);
	
	// API Administrator unique details
	private static String ADMIN_API_USER_EMAIL 	= "admin@demo.io";
	private static String ADMIN_API_USER_PASS 	= "Demo123!";
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private AccountTypeRepository accountTypeRepository;
	
	@Autowired
	private OwnershipTypeRepository ownershipTypeRepository;
	
	@Autowired
	private AccountStandingRepository accountStandingRepository;
	
	@Autowired
	private TransactionTypeRepository transactionTypeRepository;
	
	@Autowired
	private TransactionStateRepository transactionStateRepository;
	
	@Autowired
	private TransactionCategoryRepository categoryRepository;
	
	@Autowired
	private UserService userService; 
		
	@Override
	public int getOrder() {
		return 0;
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
		
		// Create a Default API User
		// If the default user data does not exist, then create it.
		if (!userService.checkEmailAdressExists(ADMIN_API_USER_EMAIL)) {
			
			LOG.info("** Loading Default API Admin User ...");
			
			Faker faker = new Faker(new Locale("en-US"));
			Users user = new Users(ADMIN_API_USER_EMAIL, ADMIN_API_USER_PASS);
			UserProfile userProfile = new UserProfile();
			
			String gender = faker.demographic().sex().substring(0,1);
			String title = (gender.equals("M")) ? "Mr." : "Mrs."; 
			String ssn = faker.numerify("###-##-####");
			
			// make sure we are inserting a unique SSN
			while (userService.checkSsnExists(ssn)){
				ssn = faker.numerify("###-##-####");
			}
					
			userProfile.setEmailAddress(ADMIN_API_USER_EMAIL);
			userProfile.setFirstName(faker.name().firstName()); 
			userProfile.setLastName(faker.name().lastName());
			userProfile.setTitle(title);
			userProfile.setGender(gender);
			userProfile.setDob(faker.date().birthday());
			userProfile.setSsn(ssn);
			userProfile.setAddress(faker.address().streetAddress());
			userProfile.setCountry("US");
			userProfile.setLocality(faker.address().city());
			userProfile.setPostalCode(faker.address().zipCode().split("-")[0]);
			userProfile.setRegion(faker.address().stateAbbr());
			userProfile.setHomePhone(faker.numerify("###-###-####"));
			userProfile.setMobilePhone(faker.numerify("###-###-####"));
			userProfile.setWorkPhone(faker.numerify("###-###-####"));
			  
			user.setUserProfile(userProfile); userService.createUser(user,
			Role.ROLE_API); userService.addRole(user, Role.ROLE_ADMIN);
			 
		
		}
		
		// Load Account Types if they do not exist
		if (accountTypeRepository.findByCode("SCK") == null) {
			
			LOG.info("** Loading Account Types...");
			
			List<AccountType> accountTypes = new ArrayList<AccountType>();
			
			accountTypes.add(new AccountType("SCK", "CHK", "Standard Checking", 0.00, new BigDecimal(25.00), new BigDecimal(25.00), new BigDecimal(10.00)));
			accountTypes.add(new AccountType("ICK", "CHK", "Interest Checking", 0.50, new BigDecimal(25.00), new BigDecimal(25.00), new BigDecimal(10.00)));
			accountTypes.add(new AccountType("SAV", "SAV", "Savings", 1.85, new BigDecimal(25.00), new BigDecimal(25.00), new BigDecimal(10.00)));
			accountTypes.add(new AccountType("MMA", "SAV", "Money Market", 2.02, new BigDecimal(2500.00), new BigDecimal(25.00), new BigDecimal(10.00)));
			accountTypes.add(new AccountType("CDA", "INV", "Certificate of Deposit", 3.25, new BigDecimal(2000.00), new BigDecimal(0.00), new BigDecimal(0.00)));
			accountTypes.add(new AccountType("IRA", "INV", "Individual Retirement", 2.68, new BigDecimal(1000.00), new BigDecimal(0.00), new BigDecimal(0.00)));
			accountTypes.add(new AccountType("AUT", "LON", "Auto Loan", 4.21, new BigDecimal(0.00), new BigDecimal(0.00), new BigDecimal(0.00)));
			accountTypes.add(new AccountType("MRG", "LON", "Mortgage Loan", 4.70, new BigDecimal(0.00), new BigDecimal(0.00), new BigDecimal(0.00)));
			accountTypes.add(new AccountType("CRD", "CCA", "Credit Card", 16.92, new BigDecimal(0.00), new BigDecimal(0.00), new BigDecimal(0.00)));
			
			accountTypeRepository.saveAll(accountTypes);			
		}
		
		// Load Ownership Types if they do not exist
		if (ownershipTypeRepository.findByCode("IND") == null) {
			
			LOG.info("** Loading Ownership Types...");
			
			List<OwnershipType> ownershipTypes = new ArrayList<OwnershipType>();
			
			ownershipTypes.add(new OwnershipType("IND", "Individual"));
			ownershipTypes.add(new OwnershipType("JNT", "Joint"));
		
			ownershipTypeRepository.saveAll(ownershipTypes);
			
		}
		
		// Load Account Standing Types if they do not exist
		if (accountStandingRepository.findByCode("A1") == null) {
			
			LOG.info("** Loading Account Standings...");
			
			List<AccountStanding> acccountStandings = new ArrayList<AccountStanding>();
			
			acccountStandings.add(new AccountStanding ("A1", "Open"));
			acccountStandings.add(new AccountStanding ("A2", "Paid"));
			acccountStandings.add(new AccountStanding ("A3", "Closed"));
			acccountStandings.add(new AccountStanding ("A4", "Inactive"));
			acccountStandings.add(new AccountStanding ("21", "Deceased"));
			acccountStandings.add(new AccountStanding ("97", "Charge Off"));
			acccountStandings.add(new AccountStanding ("94", "Foreclosed"));
			acccountStandings.add(new AccountStanding ("78", "Past Due 60 Days"));
			acccountStandings.add(new AccountStanding ("80", "Past Due 90 Days"));
			acccountStandings.add(new AccountStanding ("82", "Past Due 120 Days"));
			acccountStandings.add(new AccountStanding ("95", "Past Due 150+ Days"));
				
			accountStandingRepository.saveAll(acccountStandings);			
		}
		
		// Load Transaction Types if they do not exist
		if (transactionTypeRepository.findByCode("ATM") == null) {
			
			LOG.info("** Loading Transaction Types...");
			
			List<TransactionType> transactionTypes = new ArrayList<TransactionType>();
			
			transactionTypes.add(new TransactionType("ATM", "ATM", TransactionType.CAT_EITHER));
			transactionTypes.add(new TransactionType("DBT", "Debit", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("CRG", "Charge", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("CHK", "Check", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("DPT", "Deposit", TransactionType.CAT_CREDIT));
			transactionTypes.add(new TransactionType("POS", "Point of Sale", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("TRN", "Transfer", TransactionType.CAT_EITHER));
			transactionTypes.add(new TransactionType("WTH", "Withdrawl", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("INT", "Interest Income", TransactionType.CAT_CREDIT));
			transactionTypes.add(new TransactionType("DIV", "Dividend Credit", TransactionType.CAT_CREDIT));
			transactionTypes.add(new TransactionType("PMT", "Payment", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("OVD", "Overdraft", TransactionType.CAT_EITHER));
			transactionTypes.add(new TransactionType("FEE", "Fee", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("LTF", "Late Fee", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("OVF", "Overdraft Fee", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("COF", "Check Order Fee", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("TNF", "Transfer Fee", TransactionType.CAT_DEBIT));
			transactionTypes.add(new TransactionType("DDP", "Direct Deposit", TransactionType.CAT_CREDIT));
			transactionTypes.add(new TransactionType("EFT", "Electronic Funds Transfer", TransactionType.CAT_EITHER));
			transactionTypes.add(new TransactionType("RFD", "Refund", TransactionType.CAT_CREDIT));
			
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
		if (categoryRepository.findByCode("INC") == null) {
			
			LOG.info("** Loading Transaction Categories...");
			
			List<TransactionCategory> categories = new ArrayList<TransactionCategory>();
			
			categories.add(new TransactionCategory("INC", "Income"));
			categories.add(new TransactionCategory("MIS", "Misc"));
			categories.add(new TransactionCategory("ENT", "Entertainment"));
			categories.add(new TransactionCategory("EDU", "Education"));
			categories.add(new TransactionCategory("SHP", "Shopping"));
			categories.add(new TransactionCategory("PRC", "Personal Care"));
			categories.add(new TransactionCategory("HLT", "Health & Fitness"));
			categories.add(new TransactionCategory("KID", "Kids"));
			categories.add(new TransactionCategory("FDD", "Food & Dinning"));
			categories.add(new TransactionCategory("GFT", "Gifts & Donations"));
			categories.add(new TransactionCategory("INV", "Investments"));
			categories.add(new TransactionCategory("BIL", "Bills & Utilities"));
			categories.add(new TransactionCategory("AUT", "Auto & Transport"));
			categories.add(new TransactionCategory("TRV", "Travel"));
			categories.add(new TransactionCategory("FEE", "Fees & Charges"));
			categories.add(new TransactionCategory("BUS", "Business Services"));
			categories.add(new TransactionCategory("TAX", "Taxes"));
			
			categoryRepository.saveAll(categories);
			
		}
		

		LOG.info("*********************************");
		
	}
	
}
