package io.digisic.bank.util;

import io.digisic.bank.model.TransactionType;

public class Messages {
	
	// Common
	public static final String INVALID_OBJECT_ID		= "Invalid request format. Object Id should be a positive integer.";
	public static final String OBJECT_NOT_FOUND			= "Object Not Found. Unable to locate object with id ";
	public static final String ACCESS_FORBIDDEN			= "You must have an '" + Patterns.ROLE_ADMIN + "' role to access data outside the scope of the current authenticated user."; 
	
	// API Authentication
	public static final String API_INVALID_TOKEN		= "Expired or Invalid Json Web Token";
	public static final String API_INVALID_CRED			= "Invalid Credentials, Authentication Failed";
	
	
	// User
	public static final String USER_PASSWORD_FORMAT		= "Password must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters";
	public static final String USER_PASSWORD_REQUIRED	= "Password is required.";
	public static final String USER_PASS_CUR_REQUIRED	= "Current Password is required.";
	public static final String USER_PASS_NEW_REQUIRED	= "New Password is required.";
	public static final String USER_PASSWORD_NO_MATCH	= "Current Password does not match what is on record. Please enter the correct current password.";
	public static final String USER_PASSWORD_SAME		= "New Password is the same as the current password. Please enter a new Password.";
	public static final String USER_PASSWORD_UPDATED	= "Password Updated Successfully.";
	public static final String USER_ROLE_FORMAT			= "Role must be either 'USER', 'ADMIN', or 'API'";
	public static final String USER_ROLE_EXISTS			= "User already has Granted Authority for the role ";
	public static final String USER_ROLE_NOT_EXISTS		= "User does not have Granted Authority for the role ";
	public static final String USER_ROLE_LAST			= "Unable to delete the last Authority for the user. The user must have one Authority.";
	public static final String USER_DELETE_SELF			= "Unable to delete your own user account.";
	
	// User Profile
	public static final String USER_EMAIL_EXISTS 		= "An account is already registered with the "
														+ "email address provided. Login with the existing "
														+ "account or provide another email address.";
	public static final String USER_EMAIL_FORMAT		= "Email Address must be a valid email format.";
	public static final String USER_EMAIL_REQUIRED		= "Email Address is required.";
	public static final String USER_SSN_EXISTS 			= "An account is already registered with the "
														+ "Social Security Number provided. Login with "
														+ "the existing account or provide another "
														+ "social security number.";
	public static final String USER_SSN_FORMAT 			= "Social Security Number must be in a valid format. i.e. ###-##-####";
	public static final String USER_SSN_REQUIRED		= "Social Security is required.";
	public static final String USER_REGIST_SUCC			= "Registration Successful. Please Login.";
	public static final String USER_FIRST_NAME_REQUIRED	= "First Name is required.";
	public static final String USER_LAST_NAME_REQUIRED	= "Last Name is required.";
	public static final String USER_TITLE_FORMAT		= "Title must be either 'Mr.', 'Mrs.', or 'Ms.'.";
	public static final String USER_TITLE_REQUIRED		= "Title is required.";
	public static final String USER_GENDER_FORMAT		= "Gender must be either 'M' or 'F'.";
	public static final String USER_GENDER_REQUIRED		= "Gender is required.";
	public static final String USER_DOB_REQUIRED		= "Date of Birth is required.";
	public static final String USER_PHONE_HOME_FORMAT	= "Home Phone Number must be a valid phone number format. i.e. (###) ###-####.";
	public static final String USER_PHONE_HOME_REQUIRED	= "Home Phone is required.";
	public static final String USER_PHONE_MOBILE_FORMAT	= "Mobile Phone Number must be a valid phone number format. i.e. (###) ###-####.";
	public static final String USER_PHONE_WORK_FORMAT	= "Work Phone Number must be a valid phone number format. i.e. (###) ###-####.";
	public static final String USER_PHONE_GENERIC_FORMAT= "Phone Number must be a valid phone number format. i.e. (###) ###-####.";
	public static final String USER_ADDRESS_REQUIRED	= "Address is required.";
	public static final String USER_LOCALITY_REQUIRED	= "Locality is required.";
	public static final String USER_REGION_REQUIRED		= "Region is required.";
	public static final String USER_POSTAL_CODE_REQUIRED= "Postal Code is required.";
	public static final String USER_COUNTRY_REQUIRED	= "Country is required.";
	public static final String USER_PROFILE_UPDATED		= "Profile Updated Successfully.";
	
	// Account
	public static final String ACCT_NAME_REQ			= "Account Name is required.";
	public static final String ACCT_TYPE_REQ			= "Account Type Code is required.";
	public static final String ACCT_TYPE_FORMAT			= "Account Type Code must either be '" 
														+ Constants.ACCT_CHK_STD_CODE + "' or '" 
														+ Constants.ACCT_CHK_INT_CODE + "' for checking or '"
														+ Constants.ACCT_SAV_STD_CODE + "' or '"
														+ Constants.ACCT_SAV_MMA_CODE + "' for savings.";
	public static final String ACCT_OWN_TYPE_REQ		= "Ownership Type Code is required.";
	public static final String ACCT_OWN_TYPE_FORMAT		= "Ownership Type Code must either be '" 
														+ Constants.ACCT_OWN_IND_CODE + "' or '" 
														+ Constants.ACCT_OWN_JNT_CODE + "'.";
	public static final String ACCT_OPEN_DEPOSIT_REQ	= "Opening Deposit is required.";
	public static final String ACCT_TRAN_AMT_POSITIVE	= "Transaction amount must be a positive number.";
	public static final String ACCT_TRAN_DESC_REQ		= "Transaction Descrption is required.";
	public static final String ACCT_TRAN_TYPE_CODE_REQ	= "Transaction Type Code is required.";
	public static final String ACCT_TRAN_AMT_REQ		= "Transaction Amount is required.";
	public static final String ACCT_TRAN_TYPE_FORMAT	= "Transaction Type must be one of "
														+ Constants.ACCT_TRAN_TYPE_ATM_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_CHARGE_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_CHECK_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_CHECK_FEE_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_DEBIT_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_DIRECT_DEP_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_DIV_CREDIT_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_EFT_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_FEE_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_INT_INCOME_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_LATE_FEE_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_OVERDRAFT_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_OVERDRAFT_FEE_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_PAYMENT_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_POS_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_REFUND_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_WITHDRAWL_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_XFER_CODE + ", "
														+ Constants.ACCT_TRAN_TYPE_XFER_FEE_CODE;
	
	public static final String ACCT_TRAN_ACTION 		= "Transaction Action must either be '" 
														+ TransactionType.CAT_CREDIT + "' or '"
														+ TransactionType.CAT_DEBIT + "' and is required when the "
														+ "Transaction Type Category is '" 
														+ TransactionType.CAT_EITHER + "'";
	
	public static final String ACCT_XFER_TO_ACCT_REQ	= "Transfer To Account is required.";
	public static final String ACCT_CREATE_MSG_FORMAT	= "Successfully created new {0} account named {1}";
	
	// Promotions
	public static final String PROMO_ACCT_TYPE_REQ		= "Account Type is required";
	public static final String PROMO_ACCT_TYPE_FORMAT	= "Account Type must either be '"
														+ Constants.PROMO_ACCT_TYPE_BLUE + "', '"
														+ Constants.PROMO_ACCT_TYPE_GOLD + "', or '"
														+ Constants.PROMO_ACCT_TYPE_PLATINUM + "'";
	public static final String PROMO_AGE_FORMAT			= "Age must be a positive number";
	public static final String PROMO_RATING_FORMAT		= "Rating must be a positive number";
	public static final String PROMO_YEARS_FORMAT		= "Years must be a positive number";
	public static final String PROMO_BALANCE_REQ		= "Balance is required";
	
	// ATM Location Search
	public static final String ATM_SEARCH_FORMAT		= "Zip Code must follow proper postal code format";
	public static final String ATM_SEARCH_EMPTY			= "Unfortunately, no ATM locations were found for the Zip Code provided.";
	public static final String ATM_SEARCH_UNAVAILABLE	= "The ATM Location Search service is temporarily unavailable. We applogize for "
														+ "any inconvenience this may cause. Please try again at a later time.";
	
	// VISA API Service
	public static final String VISA_ACCOUNT_FORMAT		= "Account number must follow proper account format";
	public static final String VISA_ACCT_NOT_FOUND		= "Unfortunately, no account was found for the account provided.";
	public static final String VISA_SVC_UNAVAILABLE		= "The VISA API service is temporarily unavailable. We applogize for "
														+ "any inconvenience this may cause. Please try again at a later time.";
	// OBP API Service
	public static final String OBP_NO_BANKS				= "There are no banking providers available.";
	public static final String OBP_NO_BANK_DETAILS		= "Unable to get the details for the banking provider selected.";
	public static final String OBP_NO_BANK_DETAILS_ACCT	= "Unable to get the details for the banking provider for the selected Account.";
	public static final String OBP_NO_ACCOUNTS			= "There are no accounts available from the selected banking provider.";
	public static final String OBP_NO_ACCOUNT_DETAILS	= "Unable to get the details for the account selected.";
	public static final String OBP_NO_AUTHENTICATION	= "Unable to authenticate to the Open Banking service with the credentials provided.";
	public static final String OBP_ACCOUNT_LINKED		= "The Account selected is already linked to Digital Bank.";
	public static final String OBP_ACCOUNT_VIEW_ERROR	= "Unable to retreive an update for the latest account details. Last known account details will be displayed.";
	
	
	// Credit API Service
	public static final String CREDIT_APP_INCOME_REQ		= "Total Annual Income is required.";
	public static final String CREDIT_APP_INCOME_FORMAT		= "Total Annual Income must be zero or a positive number.";
	public static final String CREDIT_APP_MORTGAGE_REQ		= "Monthly Rent/Mortgage is required.";
	public static final String CREDIT_APP_MORTGAGE_FORMAT	= "Monthly Rent/Mortgage must be zero or a positive number.";
	public static final String CREDIT_APP_AUTO_LN_REQ		= "Monthly Automotive Loan Payment(s) is required.";
	public static final String CREDIT_APP_AUTO_LN_FORMAT	= "Monthly Automotive Loan must be zero or a positive number.";
	public static final String CREDIT_APP_OTHER_LN_REQ		= "Monthly Other Loan Payment(s) is required.";
	public static final String CREDIT_APP_OTHER_LN_FORMAT	= "Monthly Other Loan must be zero or a positive number.";
	public static final String CREDIT_APP_CREDIT_PYMT_REQ	= "Monthly Credit Card Payment(s) is required.";
	public static final String CREDIT_APP_CREDIT_PYMT_FORMAT= "Monthly Credit Card Payment(s) must be zero or a positive number.";
	public static final String CREDIT_APP_CREDIT_SPEMD_REQ	= "Monthly Credit Card Spend is required.";
	public static final String CREDIT_APP_CREDIT_SPEND_FORMT= "Monthly Credit Card Spend must be zero or a positive number.";
	public static final String CREDIT_APP_EMP_STATUS_REQ	= "Employment Status is required.";
	public static final String CREDIT_APP_EMP_STATUS_FORMAT	= "Employment Status must either be "
															+ "'Employed', "
															+ "'Self-Employed', "
															+ "'Retired', "
															+ "'Student', or "
															+ "'Unemployed'";
	public static final String CREDIT_APP_BANK_STATUS_REQ	= "Bank Account Status is required.";
	public static final String CREDIT_APP_BANK_STATUS_FORMT = "Bank Account Status must either be "
															+ "'Checking and Savings', "
															+ "'Checking Only', "
															+ "'Savings Only', or "
															+ "'Neither'";
	public static final String CREDIT_APP_AGREE_TERMS_REQ	= "Agree to Terms is required.";
	public static final String CREDIT_APP_AGREE_TERMS_FORMT	= "Agree to Terms must be true.";
	public static final String CREDIT_APP_SVC_UNAVAILABLE   = "The Digital Credit service is temporarily unavailable. We applogize for "
															+ "any inconvenience this may cause. Please try again at a later time.";
}
