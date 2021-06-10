package io.digisic.credit.util;

import io.digisic.credit.model.CreditApplication;

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
	
	// Role
	public static final String ROLE_USER			= "USER";
	public static final String ROLE_ADMIN			= "ADMIN";
	public static final String ROLE_API				= "API";
	
	// Credit Application
	public static final String APP_BANK_STATUS		= CreditApplication.BK_ST_CHK_AND_SAV + "|"
													+ CreditApplication.BK_ST_CHK_ONLY + "|"
													+ CreditApplication.BK_ST_SAV_ONLY + "|"
													+ CreditApplication.BK_ST_NEITHER;
	public static final String APP_EMP_STATUS		= CreditApplication.EMP_ST_EMPLOYED + "|"
													+ CreditApplication.EMP_ST_SELF_EMPLOYED + "|"
													+ CreditApplication.EMP_ST_STUDENT + "|"
													+ CreditApplication.EMP_ST_RETIRED + "|"
													+ CreditApplication.EMP_ST_UNEMPLOYED;

			
}
