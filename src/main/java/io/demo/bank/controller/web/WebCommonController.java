package io.demo.bank.controller.web;

import java.security.Principal;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.info.BuildProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import io.demo.bank.model.security.Users;
import io.demo.bank.service.CreditService;
import io.demo.bank.service.UserService;
import io.demo.bank.util.Constants;
import io.demo.bank.util.Patterns;

@Controller
abstract class WebCommonController {

	private static final Logger LOG = LoggerFactory.getLogger(WebCommonController.class);
	
	@Autowired
	private BuildProperties buildProperties;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CreditService creditService;
	
	// private model attribute constants
	private static final String MODEL_ATT_FIRST_NAME 			= "firstName";
	private static final String MODEL_ATT_NOTIFICATIONS 		= "notifications";
	private static final String MODEL_ATT_AVATAR				= "avatar";
	private static final String MODEL_ATT_APP_VERSION			= "appVersion";
	private static final String MODEL_ATT_APP_NAME				= "appName";
	private static final String MODEL_ATT_APP_BUILD_DATE		= "appBuildDate";
	private static final String MODEL_VAL_AVATAR_MALE			= "/images/admin.jpg";
	private static final String MODEL_VAL_AVATAR_FEMALE			= "/images/avatar/5.jpg";
	
	// public model attribute constants -> Common
	public static final String MODEL_ATT_ERROR_MSG				= "errorMsg";
	public static final String MODEL_ATT_SUCCESS_MSG			= "successMsg";
	
	// public model attribute constants -> Accounts
	public static final String MODEL_ATT_ACCOUNT 				= "account";
	public static final String MODEL_ATT_ACCT_ID				= "acctId";
	public static final String MODEL_ATT_ACCT_NEW_NAME			= "acctNewName";
	public static final String MODEL_ATT_TO_ACCOUNT 			= "toAccount";
	public static final String MODEL_ATT_FROM_ACCOUNT 			= "fromAccount";
	public static final String MODEL_ATT_ACCT_TYPE_LIST 		= "accountTypeList";
	public static final String MODEL_ATT_OWN_TYPE_LIST 			= "ownershipTypeList";
	public static final String MODEL_ATT_ACCT_LIST				= "accountList";
	public static final String MODEL_ATT_ACCT_TRANS_LIST		= "transactionList";
	public static final String MODEL_ATT_ACCT_TRANS				= "transaction";
	public static final String MODEL_ATT_ACCT_SEL_ID			= "selectId";
	public static final String MODEL_ATT_ACCT_SEL_SWITCH		= "selectSwitch";
	public static final String MODEL_ATT_ACCT_NONE				= "noAccounts";
	
	// model attribute constants -> Users
	public static final String MODEL_ATT_USER 					= "user";
	public static final String MODEL_ATT_USER_PROFILE 			= "userProfile";
	public static final String MODEL_ATT_NEW_PASS 				= "newPassword";
	public static final String MODEL_ATT_CUR_PASS 				= "currentPassword";
	
	// model attribute constants -> Required Format Patters
	public static final String MODEL_ATT_PATTERN_SSN			= "patternSSN";
	public static final String MODEL_ATT_PATTERN_EMAIL			= "patternEmail";
	public static final String MODEL_ATT_PATTERN_PASSWORD		= "patternPassword";
	public static final String MODEL_ATT_PATTERN_DOB			= "patternDOB";
	public static final String MODEL_ATT_PATTERN_PHONE			= "patternPhone";
	public static final String MODEL_ATT_PATTERN_TRANS_AMOUNT	= "patternTransactionAmount";
	
	// model attribute constants -> Pattern Messages
	public static final String MODEL_ATT_PATTERN_PASSWORD_MSG	= "patternPasswordMSG";
	public static final String MODEL_ATT_PATTERN_SSN_MSG		= "patternSSNMSG";
	public static final String MODEL_ATT_PATTERN_PHONE_MSG		= "patternPhoneMSG";
	
	// model attribute constants -> Digital Credit
	public static final String MODEL_CREDIT_ENABLED				= "creditEnabled";
	public static final String MODEL_CREDIT_NEW_APP				= "creditNewApp";
	public static final String MODEL_CREDIT_APP_STATUS			= "creditAppStatus";
	public static final String MODEL_CREDIT_ACCOUNT				= "creditAccount";
	public static final String MODEL_CREDIT_APP					= "creditApp";
	public static final String MODEL_CREDIT_APP_DATE			= "creditAppDate";
	public static final String MODEL_CREDIT_APP_STATUS_VALUE	= "creditAppStatuValue";
	
	// model attribute constants -> Search
	public static final String MODEL_SEARCH_ZIPCODE				= "zipcode";
	public static final String MODEL_ATT_PATTERN_ZIPCODE		= "patternZip";
	public static final String MODEL_ATT_ATM_LIST				= "atmList";
	
	// Chart Data 
	public static final String MODEL_ATT_CHART_ACCT_BAL			= "accountBalanceSummary";
	public static final String MODEL_ATT_CHART_CRED_VS_DEB		= "creditVsDebit";
	public static final String MODEL_ATT_CHART_TRANS_BY_CAT		= "transactionByCategory";

	/*
	 * Sets display defaults for Authenticated user
	 */
	public void setDisplayDefaults (Principal principal, Model model) {
		
		LOG.debug("Begin setting display defaults.");
		
		// Get the user that has been authenticated
		Users user = userService.findByUsername(principal.getName());
		
		// Add name for Welcome header
		model.addAttribute(MODEL_ATT_FIRST_NAME, user.getUserProfile().getFirstName());
		
		// Add user's notifications for header
		model.addAttribute(MODEL_ATT_NOTIFICATIONS, user.getNotifications());
						
		// Choose male or female avatar
		if (user.getUserProfile().getGender().equals(Constants.GENDER_MALE)) {
			model.addAttribute(MODEL_ATT_AVATAR, MODEL_VAL_AVATAR_MALE);
		}else {
			model.addAttribute(MODEL_ATT_AVATAR, MODEL_VAL_AVATAR_FEMALE);
		}
		
		// Get build date in a proper display format
		DateTimeFormatter dtFormatter = DateTimeFormatter.ofLocalizedDate(FormatStyle.MEDIUM)
														 .withLocale(Locale.US)
														 .withZone(ZoneId.systemDefault());
		// Add Application Version for About
		model.addAttribute(MODEL_ATT_APP_NAME, buildProperties.getName());
		model.addAttribute(MODEL_ATT_APP_VERSION, buildProperties.getVersion());
		model.addAttribute(MODEL_ATT_APP_BUILD_DATE, dtFormatter.format(buildProperties.getTime()));
		
		// Add ATM Location Service
		model.addAttribute(MODEL_ATT_PATTERN_ZIPCODE, Patterns.US_ZIPCODE);
		
		// Check to see if we should enable the Credit Menu
		if (creditService.isCreditServiceEnabled() && creditService.checkCreditConnection()) {
			
			LOG.debug("Credit Service is Enabled");
			
			// Determine what menu option to show
			model.addAttribute(MODEL_CREDIT_ENABLED, true);
			
			// Do we have a credit account?
			if (creditService.userHasLinkedCreditAccount(user)) {
				model.addAttribute(MODEL_CREDIT_ACCOUNT, true);
				LOG.debug("Show Credit Account");
			}
			// do we have an existing application
			else if (creditService.userHasApplication(user)) {
				// show application status
				model.addAttribute(MODEL_CREDIT_APP_STATUS, true);
				
				LOG.debug("Show Appplication Status Menu");
			} else {
				// show New Application
				model.addAttribute(MODEL_CREDIT_NEW_APP, true);
				
				LOG.debug("Show New Appplication Menu");
			}
		}
		
		LOG.debug("End setting display defaults.");
	}	
	
}
