package io.digisic.credit.service;

import java.math.BigDecimal;
import java.text.MessageFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.digisic.credit.jms.CreditProducer;
import io.digisic.credit.model.Account;
import io.digisic.credit.model.CreditApplication;
import io.digisic.credit.model.CreditCard;
import io.digisic.credit.model.UserProfile;
import io.digisic.credit.model.security.Role;
import io.digisic.credit.model.security.Users;
import io.digisic.credit.repository.CreditApplicationRepository;
import io.digisic.credit.util.Constants;

@Service
@Transactional
public class CreditApplicationService {

	private static final Logger LOG = LoggerFactory.getLogger(CreditApplicationService.class);
	
	@Autowired
	private CreditApplicationRepository creditApplicationRepository;
	
	@Autowired
	private UserService userService;
	
	@Autowired(required = false)
	private CreditProducer creditProducer;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private CreditCardService creditCardService;
	
	@Autowired
	private Environment environment;
	
	
	/*
	 * Delete Credit Application
	 */
	public void deleteCreditApplication (CreditApplication app) {
		creditApplicationRepository.delete(app);
	}
	
	/*
	 * Get All Credit Applications
	 */
	public List<CreditApplication> getCreditApplications (){
		return creditApplicationRepository.findAll();
	}
	
	/*
	 * Get Credit Application
	 */
	public CreditApplication getCreditApplication (Long id) {
		Optional<CreditApplication> app = creditApplicationRepository.findById(id);
		
		if (app.isPresent()) {
			return app.get();
			
		} else {
			return null;
		}
	}
	
	/*
	 * Submit Credit Application
	 */
	public void submitCreditApplication (CreditApplication app) {
		
		LOG.debug("Credit Application Service -> New Application Submitted");
	
		app.setApplicationStatus(Constants.APP_STATUS_ACCEPTED);
		app.setApplicationStatusDetails(Constants.APP_STATUS_ACCEPTED_DETAIL);
		
		// Set the Application Date
		app.setApplicationDate(new Date());
		
		// save the application
		creditApplicationRepository.save(app);
		
		// Start the application review process in its own process thread
		ProcessApplication pa = new ProcessApplication(app);
		Thread thread = new Thread(pa);
		thread.start();
	}
	
	
	/*
	 * Separate thread to process the application in the background
	 */
	private class ProcessApplication implements Runnable{

		private CreditApplication app;
		/*
		 * Constructor
		 */
		ProcessApplication (CreditApplication application){
			this.app = application;
		}
		
		@Override
		public void run() {
			
			// Add a delay on processing the application
			Integer delay = Integer.valueOf(20);
			
			// try to get the delay setting from the application.properties file
			try {
				delay = Integer.valueOf(environment.getProperty(Constants.APP_PROP_CREDIT_APP_TIME));
			} catch (NumberFormatException nfe) {
				delay = Integer.valueOf(20);
			}
			
			// Pause execution for delay seconds
			try {
				TimeUnit.SECONDS.sleep(delay.intValue());
			} catch (InterruptedException e) {	
				e.printStackTrace();
			}
			
			// Process User Data
			// If the user is defined, check to see if they already have an account
			// If the user has an account, then reject the application
			if (processUserData(app)){
				
				
				int totalScore = calculateRiskPoints(app) + calculateDebtToIncomeRatio(app);
				app.setRiskScore(Long.valueOf(totalScore));
				
				LOG.debug("Total Risk Score: " + totalScore);
				
				// 43 is the highest debt to income ratio to still obtain approval
				if (totalScore < 44) { 
					
					// Approved: Create New Account
					LOG.debug("Application Approved!");
					
					// Determine Credit Limit
					BigDecimal limit = determineCreditLimit(totalScore);
					BigDecimal apr = determineApr(app.getCreditScore());
					Account account = accountService.createAccount(userService.findById(app.getUserId()));
					CreditCard card = creditCardService.createCreditCard(account, limit, apr);
					
					app.setApprovedCardId(card.getId());
					app.setApplicationStatus(Constants.APP_STATUS_APPROVED);
					
					String msgDetail;
					
					if (apr.floatValue() > 0) {
						msgDetail = MessageFormat.format(Constants.APP_STATUS_APPROVED_DETAIL_STD, limit, apr.floatValue());
					} else {
						msgDetail = MessageFormat.format(Constants.APP_STATUS_APPROVED_DETAIL_INTRO, limit);
					}
					
					app.setApplicationStatusDetails(msgDetail);
					
					
					
				} else { // Declined
					
					LOG.debug("Application Declined!");
					
					app.setApplicationStatus(Constants.APP_STATUS_DECLINED);
					app.setApplicationStatusDetails(Constants.APP_STATUS_DECLINED_DETAIL_RISK);
				}
				
			} else { // Declined
				
				LOG.debug("Application Declined: Application data inconsistent with current records.");
				
				app.setApplicationStatus(Constants.APP_STATUS_DECLINED);
				app.setApplicationStatusDetails(Constants.APP_STATUS_DECLINED_DETAIL_INCON);
			}
			
			// Save the Application Review Decision
			creditApplicationRepository.save(app);
			
			// Send Updates to the Credit Consumer
			creditProducer.sendCreditApplicationStatus(app);
		
		} // End Run

		
	}
	
	/*
	 * Calculate Credit Limit
	 */
	private BigDecimal determineCreditLimit (int score) {
		
		if (score <= 10) {
			return new BigDecimal("7000.00");
		} else if (score <= 20) {
			return new BigDecimal("5000.00");
		} else if (score <= 30) {
			return new BigDecimal("2500.00");
		} else if (score <= 43) {
			return new BigDecimal("1000.00");
		} else {
			return new BigDecimal("0.00");
		}
		
	}
	
	/*
	 * Calculate APR
	 */
	private BigDecimal determineApr (Long score) {
		
		if (score >= 800) {
			return new BigDecimal("0.00");
		} else if (score >= 740) {
			return new BigDecimal("16.24");
		} else if (score >= 670) {
			return new BigDecimal("20.24");
		} else if (score >= 580) {
			return new BigDecimal("24.24");
		} else {
			return new BigDecimal("26.24");
		}
		
	}
	
	
	/*
	 * Generates random credit score from range 300 - 850
	 * 300-579 - Very Poor
	 * 580-669 - Fair
	 * 670-739 - Good
	 * 740-799 - Very Good
	 * 800-850 - Exceptional
	 */
	private int getCreditScore() {
		
		int min = 300;
		int max = 850;
		
		int score = (int) Math.round((Math.random() * ((max - min) + 1)) + min);
		
		LOG.debug("Credit Score: " + score);
		
		return score;
	}
	
	/*
	 * Calculates debt to income ration based on submitted criteria
	 */
	private int calculateDebtToIncomeRatio(CreditApplication app) {
		
		int ratio = 0;
		
		float debt = 0;
		float income = 0;
		
		debt += app.getMinimumCreditCard().floatValue();
		debt += app.getMonthlyAutoLoan().floatValue();
		debt += app.getMonthlyMortgage().floatValue();
		debt += app.getMonthlyOtherLoan().floatValue();
		
		income = app.getAnnualIncome().floatValue() / 12;
		
		ratio = Math.round(debt / income * 100);
		
		LOG.debug("Debt to Income Ratio: " + ratio);
		
		return ratio;
	}
	
	/*
	 * Calculates overall risk points based on submitted criteria
	 */
	private int calculateRiskPoints(CreditApplication app) {
		
		float risk = 0;
		int score = getCreditScore();
		app.setCreditScore(Long.valueOf(score));
		
		// Employment Status risk
		switch (app.getEmploymentStatus()) {
			case(CreditApplication.EMP_ST_EMPLOYED):
				risk += 0;
				break;
			case(CreditApplication.EMP_ST_SELF_EMPLOYED):
				risk += 1.5;
				break;
			case(CreditApplication.EMP_ST_RETIRED):
				risk += 2.5;
				break;
			case(CreditApplication.EMP_ST_STUDENT):
				risk += 3.5;
				break;
			case(CreditApplication.EMP_ST_UNEMPLOYED):
				risk += 5;
				break;
		}
		
		// Banking Status risk
		switch (app.getBankStatus()) {
			case(CreditApplication.BK_ST_CHK_AND_SAV):
				risk += 0;
				break;
			case(CreditApplication.BK_ST_CHK_ONLY):
				risk += 1;
				break;
			case(CreditApplication.BK_ST_SAV_ONLY):
				risk += 1;
				break;
			case(CreditApplication.BK_ST_NEITHER):
				risk += 2;
				break;
		}
		
		// Credit Score risk
		if (score > 800) { // Exceptional
			risk += 0;
		} else if (score > 740) { // Very Good
			risk += 1;
		} else if (score > 670) { // Good
			risk += 3;
		} else if (score > 580) { // Fair
			risk += 7;
		} else { // Very Poor
			risk += 10;
		}
		
		
		LOG.debug("Risk Score: " + Math.round(risk));
		
		return Math.round(risk);
	}
	
	/*
	 * Determine existing user or a new user
	 */
	private boolean processUserData (CreditApplication app) {
		
		Users user;
		boolean bApplicantOk = true;
		
		// Check to see if the user already exists
		if (userService.checkEmailAdressExists(app.getEmailAddress()) || userService.checkSsnExists(app.getSsn())) { 
			
			// Get existing user
			user = userService.findByUsername(app.getEmailAddress());
			
			// Check SSN matches the provided SSN on the application
			if (!user.getUserProfile().getSsn().equals(userService.normalizeSSNFormat(app.getSsn()))) {
				bApplicantOk = false;
			}
			
			LOG.debug("Process Credit Application -> Get existing user with email '" + user.getUserProfile().getEmailAddress() + "'");
			
		}
		else { // User does not exist in the system
			
			// Create user account
			user = new Users (app.getEmailAddress(), "Demo123!");
			UserProfile profile = new UserProfile();
			
			// Fill the User Profile with the Application details
			// Set Personal Details
			profile.setFirstName(app.getFirstName());
			profile.setLastName(app.getLastName());
			profile.setDob(app.getDob());
			profile.setSsn(app.getSsn());
			profile.setTitle(app.getTitle());
			profile.setGender(app.getGender());
			
			// Set Contact details
			profile.setEmailAddress(app.getEmailAddress());
			profile.setAddress(app.getAddress());
			profile.setCountry(app.getCountry());
			profile.setLocality(app.getLocality());
			profile.setPostalCode(app.getPostalCode());
			profile.setRegion(app.getRegion());
			profile.setMobilePhone(app.getMobilePhone());
			profile.setWorkPhone(app.getWorkPhone());
			profile.setHomePhone(app.getHomePhone());
		
			// Set the User Profile
			user.setUserProfile(profile);
			
			// Create the User
			userService.createUser(user, Role.ROLE_USER);
			
			// Add API Role
			userService.addRole(user, Role.ROLE_API);
			
			LOG.debug("Process Credit Application -> Created new user '" + user.getUserProfile().getEmailAddress() + "'");
		}
				
		// Set the user Id for the user of the application
		app.setUserId(user.getId());
		
		creditApplicationRepository.save(app);
		
		return bApplicantOk;
		
	}
}
