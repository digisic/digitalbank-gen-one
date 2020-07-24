package io.digisic.bank.controller.web;

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

import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.CreditCardService;
import io.digisic.bank.service.ObpService;
import io.digisic.bank.service.UserService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Patterns;

@Controller
abstract class WebCommonController {

	private static final Logger LOG = LoggerFactory.getLogger(WebCommonController.class);
	
	@Autowired
	private BuildProperties buildProperties;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CreditCardService ccService;
	
	@Autowired
	private ObpService obpService;
	
	// private model attribute constants
	private static final String MODEL_ATT_FIRST_NAME 			= "firstName";
	private static final String MODEL_ATT_NOTIFICATIONS 		= "notifications";
	private static final String MODEL_ATT_AVATAR				= "avatar";
	private static final String MODEL_ATT_APP_VERSION			= "appVersion";
	private static final String MODEL_ATT_APP_NAME				= "appName";
	private static final String MODEL_ATT_APP_BUILD_DATE		= "appBuildDate";
	private static final String MODEL_VAL_AVATAR_MALE			= "admin.jpg";
	private static final String MODEL_VAL_AVATAR_FEMALE			= "avatar/5.jpg";
	
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
	public static final String MODEL_NEW_ACCT_CONF_MSG			= "newAcctConfMsg";
	
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
	public static final String MODEL_CREDIT_CC_REFERENCE		= "ccReference";
	public static final String MODEL_CREDIT_CC_MASKED_NO		= "ccMaskedNumber";
	public static final String MODEL_CREDIT_CC_DETAIL			= "ccDetail";
	public static final String MODEL_CREDIT_CC_BILLING_DETAIL	= "ccBillingDetail";
	public static final String MODEL_CREDIT_CC_TRANS_DETAIL		= "ccTransDetailList";
	
	// model attribute constants -> Search
	public static final String MODEL_SEARCH_ZIPCODE				= "zipcode";
	public static final String MODEL_ATT_PATTERN_ZIPCODE		= "patternZip";
	public static final String MODEL_ATT_ATM_LIST				= "atmList";
	
	// Chart Data 
	public static final String MODEL_ATT_CHART_ACCT_BAL			= "accountBalanceSummary";
	public static final String MODEL_ATT_CHART_CRED_VS_DEB		= "creditVsDebit";
	public static final String MODEL_ATT_CHART_TRANS_BY_CAT		= "transactionByCategory";
	
	// Visa Service
	public static final String MODEL_ATT_EXT_ACCOUNT			= "extAccount";
	public static final String MODEL_ATT_EXT_AMOUNT				= "extAmount";
	public static final String MODEL_ATT_EXT_RESPONSE			= "visaResponse";
	
	// model attribute constants ->  Open Banking Project
	public static final String MODEL_OBP_ENABLED				= "obpEnabled";
	public static final String MODEL_OBP_BANKS					= "bankList";
	public static final String MODEL_OBP_BANK_ID				= "bankId";
	public static final String MODEL_OBP_BANK					= "bank";
	public static final String MODEL_OBP_USERNAME				= "username";
	public static final String MODEL_OBP_PASSWORD				= "password";
	public static final String MODEL_OBP_ACCOUNT_ID				= "accountId";
	public static final String MODEL_OBP_ACCOUNTS				= "accountList";
	public static final String MODEL_OBP_TRANSACTIONS			= "transactionList";
	public static final String MODEL_OBP_HAS_LINKED_ACCT		= "obpLinked";
	public static final String MODEL_OBP_DELETE_ID				= "deleteId";
	
	

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
		if (ccService.isCreditServiceEnabled() && ccService.checkCreditConnection()) {
			
			LOG.debug("Credit Service is Enabled");
			
			// Determine what menu option to show
			model.addAttribute(MODEL_CREDIT_ENABLED, true);
			
			// Do we have a credit account?
			if (ccService.userHasLinkedCreditAccount(user)) {
				model.addAttribute(MODEL_CREDIT_ACCOUNT, true);
				LOG.debug("Show Credit Account");
			}
			// do we have an existing application
			else if (ccService.userHasApplication(user)) {
				// show application status
				model.addAttribute(MODEL_CREDIT_APP_STATUS, true);
				
				LOG.debug("Show Appplication Status Menu");
			} else {
				// show New Application
				model.addAttribute(MODEL_CREDIT_NEW_APP, true);
				
				LOG.debug("Show New Appplication Menu");
			}
		}
		
		// Check to see if we should enable the OBP Menu
		if (obpService.isObpServiceEnabled()) {
			
			LOG.debug("Open Banking Service is Enabled.");
			
			// Determine what menu option to show
			model.addAttribute(MODEL_OBP_ENABLED, true);
			
			if (obpService.userHasLinkedAccount(user)) {
				
				LOG.debug("User has linked accounts with the Open Banking Service.");
				
				model.addAttribute(MODEL_OBP_HAS_LINKED_ACCT, true);
			}
		}
		
		LOG.debug("End setting display defaults.");
	}	
	
}
