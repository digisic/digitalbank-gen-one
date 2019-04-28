package io.demo.bank.util;

public class Patterns {
	
	// Common
	public static final String DATE_FORMAT			= "MM/dd/yyyy";
	public static final String TRANSACTION_AMOUNT	= "^(?=.+)(?:[1-9]\\d*|0)?(?:\\.\\d+)?$";
	
	
	// User
	public static final String USER_PASSWORD		= "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}";
													  
	// User Profile
	public static final String USER_TITLE			= "Mr.|Mrs.|Ms.";
	public static final String USER_GENDER			= "M|F";
	public static final String USER_SSN				= "^\\d{3}-?\\d{2}-?\\d{4}$";
	public static final String USER_DOB				= "\\d{1,2}/\\d{1,2}/\\d{4}";
	public static final String USER_EMAIL			= "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
	public static final String USER_PHONE_REQ		= "^[+]?([0-9]*[\\.\\s\\-\\(\\)]|[0-9]+){3,24}$";
	public static final String USER_PHONE_NOT_REQ	= "^$|^[+]?([0-9]*[\\.\\s\\-\\(\\)]|[0-9]+){3,24}$";
}
