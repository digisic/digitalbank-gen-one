package io.digisic.bank.util;

import io.digisic.bank.model.TransactionType;

public class Patterns {
	
	// Common
	public static final String DATE_FORMAT			= "MM/dd/yyyy";
	public static final String TRANSACTION_AMOUNT	= "^(?=.+)(?:[1-9]\\d*|0)?(?:\\.\\d+)?$";
	
	
	// User
	public static final String USER_PASSWORD		= "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}";
	public static final String USER_ROLE			= "USER|ADMIN|API";
													  
	// User Profile
	public static final String USER_TITLE			= "Mr.|Mrs.|Ms.";
	public static final String USER_GENDER			= "M|F";
	public static final String USER_SSN				= "^\\d{3}-?\\d{2}-?\\d{4}$";
	public static final String USER_DOB				= "\\d{1,2}/\\d{1,2}/\\d{4}";
	public static final String USER_EMAIL			= "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
	public static final String USER_PHONE_REQ		= "^[+]?([0-9]*[\\.\\s\\-\\(\\)]|[0-9]+){3,24}$";
	public static final String USER_PHONE_NOT_REQ	= "^$|^[+]?([0-9]*[\\.\\s\\-\\(\\)]|[0-9]+){3,24}$";
	
	// ATM Search
	public static final String US_ZIPCODE			= "^[0-9]{5}(?:-[0-9]{4})?$";
	
	// Role
	public static final String ROLE_USER			= "USER";
	public static final String ROLE_ADMIN			= "ADMIN";
	public static final String ROLE_API				= "API";
	
	// Account
	public static final String ACCT_OWN_TYPE_CODE	= Constants.ACCT_OWN_IND_CODE + "|" 
													+ Constants.ACCT_OWN_JNT_CODE;
	
	public static final String ACCT_TYPE_CODE		= Constants.ACCT_CHK_STD_CODE + "|" 
													+ Constants.ACCT_CHK_INT_CODE + "|"
													+ Constants.ACCT_SAV_STD_CODE + "|" 
													+ Constants.ACCT_SAV_MMA_CODE;
	
	public static final String ACCT_TRAN_TYPE_CODE 	= Constants.ACCT_TRAN_TYPE_ATM_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_CHARGE_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_CHECK_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_CHECK_FEE_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_DEBIT_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_DIRECT_DEP_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_DIV_CREDIT_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_EFT_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_FEE_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_INT_INCOME_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_LATE_FEE_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_OVERDRAFT_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_OVERDRAFT_FEE_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_PAYMENT_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_POS_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_REFUND_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_WITHDRAWL_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_XFER_CODE + "|"
													+ Constants.ACCT_TRAN_TYPE_XFER_FEE_CODE;
	public static final String ACCT_TRAN_ACTION		= TransactionType.CAT_CREDIT + "|"
													+ TransactionType.CAT_DEBIT;
	
	// Promotions
	public static final String PROMO_ACCT_TYPE		= Constants.PROMO_ACCT_TYPE_BLUE + "|"
													+ Constants.PROMO_ACCT_TYPE_GOLD + "|"
													+ Constants.PROMO_ACCT_TYPE_PLATINUM;
	
	// Visa Service
	public static final String VISA_ACCOUNT			= "^([a-zA-Z0-9_\\\\-\\\\.]+)";
	
	// Credit Application Service
	public static final String CREDIT_APP_EMP_STATUS = "Employed|Self-Employed|Retired|Student|Unemployed";
	public static final String CREDIT_APP_BANK_ACCTS = "Checking and Savings|Checking Only|Savings Only|Neither";
													
			
}
