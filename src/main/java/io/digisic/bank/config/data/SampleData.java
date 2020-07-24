package io.digisic.bank.config.data;

import java.math.BigDecimal;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Calendar;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;
import com.github.javafaker.Faker;

import io.digisic.bank.model.Account;
import io.digisic.bank.model.AccountTransaction;
import io.digisic.bank.model.UserProfile;
import io.digisic.bank.model.security.Role;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.AccountService;
import io.digisic.bank.service.UserService;
import io.digisic.bank.util.Constants;



@Component
public class SampleData implements CommandLineRunner, Ordered {

	private static final Logger LOG = LoggerFactory.getLogger(SampleData.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AccountService accountService;
	
	private static String SMPL_MALE_EMAIL 				= "jsmith@demo.io";
	private static String SMPL_FEMALE_EMAIL 			= "nsmith@demo.io";
	private static String SMPL_COMMON_PASSWORD 			= "Demo123!";
	private static String SMPL_MALE_FIRST_NAME			= "Josh";
	private static String SMPL_FEMALE_FIRST_NAME		= "Nicole";
	private static String SMPL_COMMON_LAST_NAME			= "Smith";
	private static String SMPL_JOINT_CHECKING			= "Family Checking";
	private static String SMPL_JOINT_SAVINGS			= "Family Savings";
	private static String SMPL_PERSONAL_SAVINGS			= "Personal Savings";
	
	@Override
	public int getOrder() {
		return 1;
	}

	@Override
	public void run(String... args) throws Exception {
		
		LOG.info("*********************************");
		LOG.info("***** Checking Sample Data ******");
		
		// If the sample user data does not exist, then create it.
		if (!userService.checkEmailAdressExists(SMPL_MALE_EMAIL) && !userService.checkEmailAdressExists(SMPL_FEMALE_EMAIL)) {
			
			// Data Generator
			Faker faker = new Faker(new Locale("en-US"));
			
			// ******************************************************************
			// Shared Data Attributes
			// ******************************************************************
			
			// Common Sample User Data
			String street = faker.address().streetAddress();
			String city = faker.address().city();
			String zip = faker.address().zipCode().split("-")[0];
			String state = faker.address().stateAbbr();
			String homePhone = faker.numerify("###-###-####");
			
			// ******************************************************************
			// Male User
			// ******************************************************************
			
			// Create Male
			LOG.info("** Loading Sample User " + SMPL_MALE_FIRST_NAME + " " + SMPL_COMMON_LAST_NAME + " ...");
			
			Users male = new Users(SMPL_MALE_EMAIL, SMPL_COMMON_PASSWORD);
			UserProfile maleProfile = new UserProfile();
			String maleSsn = faker.numerify("###-##-####");
			
			// make sure we are inserting a unique SSN
			while (userService.checkSsnExists(maleSsn)){
				maleSsn = faker.numerify("###-##-####");
			}
					
			maleProfile.setEmailAddress(SMPL_MALE_EMAIL);
			maleProfile.setFirstName(SMPL_MALE_FIRST_NAME); 
			maleProfile.setLastName(SMPL_COMMON_LAST_NAME);
			maleProfile.setTitle("Mr.");
			maleProfile.setGender("M");
			maleProfile.setDob(faker.date().birthday());
			maleProfile.setSsn(maleSsn);
			maleProfile.setAddress(street);
			maleProfile.setCountry("US");
			maleProfile.setLocality(city);
			maleProfile.setPostalCode(zip);
			maleProfile.setRegion(state);
			maleProfile.setHomePhone(homePhone);
			maleProfile.setMobilePhone(faker.numerify("###-###-####"));
			maleProfile.setWorkPhone(faker.numerify("###-###-####"));
			
			male.setUserProfile(maleProfile);
			userService.createUser(male, Role.ROLE_USER);
			userService.addRole(male, Role.ROLE_API);
			
			LOG.info("**     Username: " + SMPL_MALE_EMAIL);
			LOG.info("**     Password: " + SMPL_COMMON_PASSWORD);
			
			
			// ******************************************************************
			// Female User
			// ******************************************************************
			
			// Create Female
			LOG.info("** Loading Sample User " + SMPL_FEMALE_FIRST_NAME + " " + SMPL_COMMON_LAST_NAME + " ...");
			Users female = new Users(SMPL_FEMALE_FIRST_NAME, SMPL_COMMON_PASSWORD);
			UserProfile femaleProfile = new UserProfile();
			
			String femaleSsn = faker.numerify("###-##-####");
			
			// make sure we are inserting a unique SSN
			while (userService.checkSsnExists(femaleSsn)){
				femaleSsn = faker.numerify("###-##-####");
			}
					
			femaleProfile.setEmailAddress(SMPL_FEMALE_EMAIL);
			femaleProfile.setFirstName(SMPL_FEMALE_FIRST_NAME); 
			femaleProfile.setLastName(SMPL_COMMON_LAST_NAME);
			femaleProfile.setTitle("Mrs.");
			femaleProfile.setGender("F");
			femaleProfile.setDob(faker.date().birthday());
			femaleProfile.setSsn(femaleSsn);
			femaleProfile.setAddress(street);
			femaleProfile.setCountry("US");
			femaleProfile.setLocality(city);
			femaleProfile.setPostalCode(zip);
			femaleProfile.setRegion(state);
			femaleProfile.setHomePhone(homePhone);
			femaleProfile.setMobilePhone(faker.numerify("###-###-####"));
			femaleProfile.setWorkPhone(faker.numerify("###-###-####"));
			
			female.setUserProfile(femaleProfile);
			userService.createUser(female, Role.ROLE_USER);
			userService.addRole(female, Role.ROLE_API);
			
			LOG.info("**     Username: " + SMPL_FEMALE_EMAIL);
			LOG.info("**     Password: " + SMPL_COMMON_PASSWORD);
			
			
			// ******************************************************************
			// Personal Savings Account
			// ******************************************************************
			
			// Date manipulation for creating some kind o time line
			GregorianCalendar monthlyCalendar = new GregorianCalendar();
			GregorianCalendar dailyCalendar = new GregorianCalendar();
			
			// Initialize Calendars to current date
			monthlyCalendar.setTime(new Date());
			dailyCalendar.setTime(new Date());
			
			// Add some transactions
			AccountTransaction transaction = new AccountTransaction();
			
			// Go back 6 months
			monthlyCalendar.add(Calendar.MONTH, -6);
			
			// Roll the time forward some random value
			dailyCalendar.setTime(monthlyCalendar.getTime());
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
					
			// Create Personal Savings Account
			LOG.info("** Loading Account " + SMPL_PERSONAL_SAVINGS + " ...");
			Account personalSavings = new Account();
			personalSavings.setName(SMPL_PERSONAL_SAVINGS);
			personalSavings.setOwner(male);
			personalSavings.setDateOpened(dailyCalendar.getTime());
			personalSavings.setOpeningBalance(new BigDecimal(faker.random().nextInt(800, 1900)));
			personalSavings.setAccountType(accountService.getAccoutTypeByCode(Constants.ACCT_SAV_MMA_CODE));
			personalSavings.setOwnershipType(accountService.getOwnershipTypeIndividual());
			accountService.createNewAccount(personalSavings);
			
			// Go forward 1 month - month 1 of 6
			monthlyCalendar.add(Calendar.MONTH, 1);
			monthlyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 3));
			
			// Add monthly interest
			addInterestTransaction(personalSavings, transaction, monthlyCalendar);
			
			
			// Go forward 1 month - month 2 of 6
			monthlyCalendar.add(Calendar.MONTH, 1);
			monthlyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 3) * -1);
			
			// Add monthly interest
			addInterestTransaction(personalSavings, transaction, monthlyCalendar);
			
			// Go forward 1 month - month 3 of 6
			monthlyCalendar.add(Calendar.MONTH, 1);
			monthlyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 3));
			
			// Add monthly interest
			addInterestTransaction(personalSavings, transaction, monthlyCalendar);
			
			// Roll the time forward some random value
			dailyCalendar.setTime(monthlyCalendar.getTime());
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(5, 12));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			// Add a Deposit
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.stock().nyseSymbol() + " Dividend");
			transaction.setAmount(new BigDecimal(faker.random().nextInt(100, 350)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE));
			accountService.creditTransaction(personalSavings, transaction);
			
			// Go forward 1 month - month 4 of 6
			monthlyCalendar.add(Calendar.MONTH, 1);
			monthlyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 3) * -1);
			
			// Add monthly interest
			addInterestTransaction(personalSavings, transaction, monthlyCalendar);
			
			// Go forward 1 month - month 5 of 6
			monthlyCalendar.add(Calendar.MONTH, 1);
			monthlyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 3));
			
			// Add monthly interest
			addInterestTransaction(personalSavings, transaction, monthlyCalendar);
			
			// Go forward 1 month - month 6 of 6
			monthlyCalendar.add(Calendar.MONTH, 1);
			monthlyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 3) * -1);
			
			// Add monthly interest
			addInterestTransaction(personalSavings, transaction, monthlyCalendar);
			
			
			// ******************************************************************
			// Joint Savings Account
			// ******************************************************************
			
			// Initialize Calendars to current date
			monthlyCalendar.setTime(new Date());
			dailyCalendar.setTime(new Date());
			
			// Go back 2 months
			monthlyCalendar.add(Calendar.MONTH, -2);
			
			// Roll the time forward some random value
			dailyCalendar.setTime(monthlyCalendar.getTime());
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			// Create Joint Savings Account
			LOG.info("** Loading Account " + SMPL_JOINT_SAVINGS + " ...");
			Account jointSavings = new Account();
			jointSavings.setName(SMPL_JOINT_SAVINGS);
			jointSavings.setOwner(male);
			jointSavings.setCoowner(female);
			jointSavings.setDateOpened(dailyCalendar.getTime());
			jointSavings.setOpeningBalance(new BigDecimal(faker.random().nextInt(675, 2390)));
			jointSavings.setAccountType(accountService.getAccoutTypeByCode(Constants.ACCT_SAV_STD_CODE));
			jointSavings.setOwnershipType(accountService.getOwnershipTypeJoint());
			accountService.createNewAccount(jointSavings);
			
			// Roll the time forward some random value
			dailyCalendar.setTime(monthlyCalendar.getTime());
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(5, 12));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			// Make a Deposit
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE).getName());
			transaction.setAmount(new BigDecimal(faker.random().nextInt(100, 350)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE));
			accountService.creditTransaction(jointSavings, transaction);
			
			// Go forward 1 month - month 1 of 2
			monthlyCalendar.add(Calendar.MONTH, 1);
			monthlyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 3));
			
			// Add monthly interest
			addInterestTransaction(jointSavings, transaction, monthlyCalendar);
				
			// Roll the time forward some random value
			dailyCalendar.setTime(monthlyCalendar.getTime());
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(5, 12));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			// Make a Deposit
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.stock().nyseSymbol() + " Dividend");
			transaction.setAmount(new BigDecimal(faker.random().nextInt(100, 350)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE));
			accountService.creditTransaction(jointSavings, transaction);
			
			// Roll the time forward some random value
			dailyCalendar.setTime(monthlyCalendar.getTime());
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(5, 12));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			// Make a Deposit
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE).getName());
			transaction.setAmount(new BigDecimal(faker.random().nextInt(100, 350)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE));
			accountService.creditTransaction(jointSavings, transaction);
			
			
			// Go forward 1 month - month 2 of 2
			monthlyCalendar.add(Calendar.MONTH, 1);
			monthlyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 3) * -1);
			
			// Add monthly interest
			addInterestTransaction(jointSavings, transaction, monthlyCalendar);
			
			
			// ******************************************************************
			// Joint Checking Account
			// ******************************************************************
			
			// Random Boundaries
			final int minDay = 0;
			final int maxDay = 4;
			
			// Initialize Calendars to current date
			monthlyCalendar.setTime(new Date());
			dailyCalendar.setTime(new Date());
			
			// Go back 3 months
			monthlyCalendar.add(Calendar.MONTH, -2);
			
			// Roll the time forward some random value
			dailyCalendar.setTime(monthlyCalendar.getTime());
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 23));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			// Create Joint Checking Account
			LOG.info("** Loading Account " + SMPL_JOINT_CHECKING + " ...");
			Account checking = new Account();
			checking.setName(SMPL_JOINT_CHECKING);
			checking.setOwner(male);
			checking.setCoowner(female);
			checking.setDateOpened(dailyCalendar.getTime());
			checking.setOpeningBalance(new BigDecimal(faker.random().nextInt(2300, 2800)));
			checking.setAccountType(accountService.getAccoutTypeByCode(Constants.ACCT_CHK_STD_CODE));
			checking.setOwnershipType(accountService.getOwnershipTypeJoint());
			accountService.createNewAccount(checking);		
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.medical().hospitalName());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(250, 410)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_HLT_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHARGE_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.book().publisher());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(35, 75)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_EDU_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHARGE_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.address().cityName() + " Water & Sewer");
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(75, 150)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_BIL_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.company().name());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(125, 275)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_BUS_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHARGE_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.artist().name());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(125, 275)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_GFT_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.educator().university());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(400, 600)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_EDU_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.company().name());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(2000, 2200)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DIRECT_DEP_CODE));
			accountService.creditTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setAmount(new BigDecimal(500));
			accountService.transfer(checking, jointSavings, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.food().spice() + " Market");
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(200, 420)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_FDD_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.company().name() + " Electric & Gas");
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(200, 420)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_BIL_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.company().name() + " Mortgage");
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(1200, 1700)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_BIL_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.company().name());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(2000, 2200)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DIRECT_DEP_CODE));
			accountService.creditTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.medical().hospitalName());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(250, 410)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_HLT_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHARGE_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.book().publisher());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(35, 75)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_EDU_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHARGE_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.address().cityName() + " Water & Sewer");
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(75, 150)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_BIL_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.company().name());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(125, 275)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_BUS_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHARGE_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.artist().name());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(125, 275)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_GFT_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.educator().university());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(400, 600)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_EDU_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.company().name());
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(2000, 2200)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_DIRECT_DEP_CODE));
			accountService.creditTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setAmount(new BigDecimal(500));
			accountService.transfer(checking, jointSavings, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.food().spice() + " Market");
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(200, 420)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_FDD_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.company().name() + " Electric & Gas");
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(200, 420)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_BIL_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
			
			// Roll the time forward some random value
			dailyCalendar = addDays(dailyCalendar, faker.random().nextInt(minDay, maxDay));
			dailyCalendar.add(Calendar.HOUR_OF_DAY, faker.random().nextInt(1, 6));
			dailyCalendar.add(Calendar.MINUTE, faker.random().nextInt(1, 59));
			
			transaction = new AccountTransaction();
			transaction.setTransactionDate(dailyCalendar.getTime());
			transaction.setDescription(faker.company().name() + " Mortgage");
			transaction.setAmount(new BigDecimal(faker.random().nextDouble() + faker.random().nextInt(1200, 1700)));
			transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_BIL_CODE));
			transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_CHECK_CODE));
			accountService.debitTransaction(checking, transaction);
	
			
		}
		
		LOG.info("*********************************");
	}
	
	
	/*
	 * Helper method for interest transaction
	 */
	private void addInterestTransaction (Account account, AccountTransaction transaction, GregorianCalendar calendar) {
		
		// refresh object to get latest data
		account = accountService.getAccountById(account.getId());
		
		// Interest Payment
		transaction = new AccountTransaction();
		transaction.setTransactionDate(calendar.getTime());
		transaction.setDescription(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_INT_INCOME_CODE).getName());
		transaction.setAmount(new BigDecimal(account.getCurrentBalance().floatValue() * account.getInterestRate() * .001));
		transaction.setTransactionCategory(accountService.getTransactionCategoryByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
		transaction.setTransactionType(accountService.getTransactionTypeByCode(Constants.ACCT_TRAN_TYPE_INT_INCOME_CODE));
		accountService.creditTransaction(account, transaction);
		
	}
	
	/*
	 * Helper method to increment the calendar by days
	 */
	private GregorianCalendar addDays(GregorianCalendar calendar, int days) {
		
		GregorianCalendar current = new GregorianCalendar();
		GregorianCalendar today = new GregorianCalendar();
		
		current.setTime(calendar.getTime());
		today.setTime(new Date());
		
		calendar.add(Calendar.DATE, days);
		
		if (calendar.before(current)) {
			
			// If it is December then add to January of next year
			if (current.get(Calendar.MONTH) == Calendar.DECEMBER) {
				
				calendar.add(Calendar.YEAR, 1);
				calendar.set(Calendar.MONTH, Calendar.JANUARY);
				
			} 
			else  // add to the next month
			{
				calendar.add(Calendar.MONTH, 1);
			}
			
		} 
		// If we go past current date and time, then add back 1 day
		if (calendar.after(today)) {
			calendar.setTime(today.getTime());
			calendar.add(Calendar.DATE, -1);
		}
		
		return calendar;

	}

}
