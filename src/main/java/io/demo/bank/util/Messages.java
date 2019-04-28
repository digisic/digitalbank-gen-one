package io.demo.bank.util;

public class Messages {
	
	// Common
	public static final String INVALID_OBJECT_ID		= "Invalid request format. Object Id should be a positive integer.";
	public static final String OBJECT_NOT_FOUND			= "Object Not Found. Unable to locate object with id "; 
	
	// User
	public static final String USER_PASSWORD			= "Password must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters";
	public static final String USER_CURR_PASS_MATCH		= "Current Password does not match what is on record. Please enter the correct current password.";
	public static final String USER_NEW_PASS_SAME		= "New Password is the same as the current password. Please enter a new Password.";
	public static final String USER_PASSWORD_UPDATED	= "Password Updated Successfully.";
	
	// User Profile
	public static final String USER_EMAIL_EXISTS 		= "An account is already registered with the "
														+ "email address provided. Login with the existing "
														+ "account or provide another email address.";
	public static final String USER_SSN_EXISTS 			= "An account is already registered with the "
														+ "Social Security Number provided. Login with "
														+ "the existing account or provide another "
														+ "social security number.";
	public static final String USER_REGIST_SUCC			= "Registration Successful. Please Login.";
	public static final String USER_FIRST_NAME			= "First Name is required";
	public static final String USER_LAST_NAME			= "Last Name is required";
	public static final String USER_TITLE				= "Title must be either 'Mr.', 'Mrs.', or 'Ms.'";
	public static final String USER_GENDER				= "Gender must be either 'M' or 'F'";
	public static final String USER_SSN 				= "Social Security Number must be in a valid format. i.e. ###-##-####";
	public static final String USER_DOB					= "Date of Birth is required";
	public static final String USER_EMAIL				= "Email Address must be a valid email format";
	public static final String USER_PHONE_HOME			= "Home Phone Number must be a valid phone number format. i.e. (###) ###-####";
	public static final String USER_PHONE_MOBILE		= "Mobile Phone Number must be a valid phone number format. i.e. (###) ###-####";
	public static final String USER_PHONE_WORK			= "Work Phone Number must be a valid phone number format. i.e. (###) ###-####";
	public static final String USER_PHONE_GENERIC		= "Phone Number must be a valid phone number format. i.e. (###) ###-####";
	public static final String USER_ADDRESS				= "Address is required";
	public static final String USER_LOCALITY			= "Locality is required";
	public static final String USER_REGION				= "Region is required";
	public static final String USER_POSTAL_CODE			= "Postal Code is required";
	public static final String USER_COUNTRY				= "Country is required";
	public static final String USER_PROFILE_UPDATED		= "Profile Updated Successfully.";
}
