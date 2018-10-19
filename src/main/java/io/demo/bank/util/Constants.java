package io.demo.bank.util;

public class Constants {
	
	// Cookies
	public static final String COO_REMEBER_ME 		= "remeber-me";
	public static final String COO_JSESSION_ID		= "JSESSIONID";
	
	// Directives
	public static final String DIR_REDIRECT 		= "redirect:";
	
	// Gender
	public static final String GENDER_MALE 			= "M";
	public static final String GENDER_FEMALE 		= "F";
	
	// Public resources
	public static final String URI_WEBJARS_RES 		= "/webjars/**";
	public static final String URI_CSS_RES 			= "/css/**";
	public static final String URI_SCSS_RES 		= "/scss/**";
	public static final String URI_FONTS_RES 		= "/fonts/**";
	public static final String URI_JS_RES 			= "/js/**";
	public static final String URI_IMAGES_RES 		= "/images/**";
	public static final String URI_ABOUT_RES 		= "/about/**";
	public static final String URI_CONTACT_RES 		= "/contact/**";
	public static final String URI_ERROR_RES 		= "/error/**";
	
	// Public URIs
	public static final String URI_ROOT 			= "/";
	public static final String URI_LOGIN 			= "/login";
	public static final String URI_LOGIN_ERR 		= "/login?error";
	public static final String URI_REGISTER 		= "/register";
	public static final String URI_SIGNUP 			= "/signup";
	public static final String URI_LOGOUT 			= "/logout";
	public static final String URI_LOGOUT_SUCC 		= "/login?logout";
	
	// Authenticated URIs
	public static final String URI_HOME 			= "/home";
	public static final String URI_USER				= "/user";
	public static final String URI_USR_PASSWORD 	= "/password";
	public static final String URI_USR_PROFILE 		= "/profile";
	public static final String URI_ACCOUNT			= "/account";
	public static final String URI_CHK_ADD			= "/checking-add";
	public static final String URI_CHK_VIEW			= "/checking-view";
	public static final String URI_SAV_ADD			= "/savings-add";
	public static final String URI_SAV_VIEW			= "/savings-view";
	public static final String URI_DEPOSIT			= "/deposit";
	public static final String URI_WITHDRAW			= "/withdraw";
	public static final String URI_XFER_BETWEEN		= "/xfer-between";
	  
	// Views
	public static final String VIEW_LOGIN 			= "login";
	public static final String VIEW_LOGOUT			= "logout";
	public static final String VIEW_REGISTER 		= "register";
	public static final String VIEW_SIGNUP 			= "signup";
	public static final String VIEW_HOME 			= "home";
	public static final String VIEW_USR_PASSWORD 	= "password";
	public static final String VIEW_USR_PROFILE 	= "profile";
	public static final String VIEW_CHK_ADD 		= "checking-add";
	public static final String VIEW_CHK_VIEW 		= "checking-view";
	public static final String VIEW_SAV_ADD 		= "savings-add";
	public static final String VIEW_SAV_VIEW 		= "savings-view";
	public static final String VIEW_DEPOSIT 		= "deposit";
	public static final String VIEW_WITHDRAW 		= "withdraw";
	public static final String VIEW_XFER_BETWEEN 	= "xfer-between";
	
	// Account Type Codes
	public static final String ACCT_CHK_STD_CODE	= "SCK";
	public static final String ACCT_CHK_INT_CODE	= "ICK";
	public static final String ACCT_SAV_STD_CODE	= "SAV";
	public static final String ACCT_SAV_MMA_CODE	= "MMA";
	
	// Account Type Categories
	public static final String ACCT_CHK_CAT			= "CHK";
	public static final String ACCT_SAV_CAT			= "SAV";
	public static final String ACCT_INV_CAT			= "INV";
	
	// Ownership Type Codes
	public static final String ACCT_OWN_IND_CODE	= "IND";
	public static final String ACCT_OWN_JNT_CODE	= "JNT";

	
	// Account Standing Codes
	public static final String ACCT_STND_OPEN_CODE	= "A1";
	
	// Transaction State Codes
	public static final String ACCT_TRNST_COMP_CODE	= "COM";
	
	// Transaction Type Codes
	public static final String ACCT_TRNTY_DEP_CODE		= "DPT";
	public static final String ACCT_TRNTY_WITH_CODE		= "WTH";
	public static final String ACCT_TRNTY_XFER_CODE		= "TRN";
	public static final String ACCT_TRNTY_OVER_FEE_CODE	= "OVF";
  
}
