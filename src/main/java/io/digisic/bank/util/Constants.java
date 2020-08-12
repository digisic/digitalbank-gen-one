package io.digisic.bank.util;

public class Constants {
	
	// Cookies
	public static final String COO_REMEBER_ME 		= "remeber-me";
	public static final String COO_JSESSION_ID		= "JSESSIONID";
	
	// API
	public static final String API_SECRET			= "Zq4t7w!z%C&F)J@NcRfUjXn2r5u8x/A?";
	public static final String API_AUTH_HEADER		= "Authorization";
	public static final String API_TOKEN_BEGIN		= "Bearer ";
	
	// Has Role
	public static final String HAS_ROLE_USER		= "hasRole('" + Patterns.ROLE_USER + "')";
	public static final String HAS_ROLE_ADMIN		= "hasRole('" + Patterns.ROLE_ADMIN + "')";
	public static final String HAS_ROLE_API			= "hasRole('" + Patterns.ROLE_API + "')";
	
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
	public static final String URI_FAVICON_RES 		= "/favicon.ico";
	public static final String URI_ABOUT_RES 		= "/about/**";
	public static final String URI_CONTACT_RES 		= "/contact/**";
	public static final String URI_ERROR_RES 		= "/error/**";
	public static final String URI_H2_CONSOLE		= "/h2-console/**";
	public static final String URI_SWAGGER_UI		= "/swagger-ui.html";
	public static final String URI_SWAGGER_V2		= "/v2/api-docs";
	public static final String URI_SWAGGER_RES		= "/swagger-resources/**";
	public static final String URI_SWAGGER_CONF		= "/configuration/**";
	public static final String URI_MANAGER_RES		= "/manager/**";

	
	// Public URIs
	public static final String URI_ROOT 			= "/";
	public static final String URI_LOGIN 			= "/login";
	public static final String URI_LOGIN_ERR 		= "/login?error";
	public static final String URI_REGISTER 		= "/register";
	public static final String URI_SIGNUP 			= "/signup";
	public static final String URI_LOGOUT 			= "/logout";
	public static final String URI_LOGOUT_SUCC 		= "/login?logout";
	public static final String URI_MANAGER			= "/manager";
	public static final String URI_PROMOTIONS		= "/promotions";
	
	
	// Authenticated URIs
	public static final String URI_HOME 				= "/home";
	public static final String URI_USER					= "/user";
	public static final String URI_USR_PASSWORD 		= "/password";
	public static final String URI_USR_PROFILE 			= "/profile";
	public static final String URI_ACCOUNT				= "/account";
	public static final String URI_ACCOUNT_UPDATE		= "/update";
	public static final String URI_CHK_ADD				= "/checking-add";
	public static final String URI_CHK_VIEW				= "/checking-view";
	public static final String URI_SAV_ADD				= "/savings-add";
	public static final String URI_SAV_VIEW				= "/savings-view";
	public static final String URI_DEPOSIT				= "/deposit";
	public static final String URI_WITHDRAW				= "/withdraw";
	public static final String URI_XFER_BETWEEN			= "/xfer-between";
	public static final String URI_CREDIT				= "/credit";
	public static final String URI_CREDIT_APP			= "/credit-app";
	public static final String URI_CREDIT_APP_STATUS	= "/credit-app-status";
	public static final String URI_CREDIT_VIEW			= "/credit-view";
	public static final String URI_CREDIT_DELETE		= "/credit-delete";
	public static final String URI_SEARCH				= "/search";
	public static final String URI_SEARCH_ATM			= "/atm";
	public static final String URI_OBP					= "/obp";
	public static final String URI_OBP_ADD				= "/obp-add";
	public static final String URI_OBP_ADD_ACCT			= "/obp-add-acct";
	public static final String URI_OBP_VIEW				= "/obp-view";
	public static final String URI_OBP_DELETE			= "/obp-delete";
	
	// Visa Service
	public static final String URI_XFER_EXTERNAL		= "/external";
	public static final String URI_XFER_VISA_PROC		= "/xfer-visa-process";
	public static final String URI_XFER_VISA			= "/xfer-visa";
	
	// API Authenticated URIs
	public static final String URI_API_ALL				= "/api/**";
	public static final String URI_API_AUTH				= "/api/v1/auth";
	public static final String URI_API_USR_ALL			= "/api/v1/users";
	public static final String URI_API_USR				= "/api/v1/user";
	public static final String URI_API_USR_FIND			= "/api/v1/user/find";
	public static final String URI_API_USR_ID			= "/api/v1/user/{id}";
	public static final String URI_API_USR_PROF			= "/api/v1/user/{id}/profile";
	public static final String URI_API_USR_PROF_CURR	= "/api/v1/user/profile";
	public static final String URI_API_USR_ROLE			= "/api/v1/user/{id}/role";
	public static final String URI_API_USR_ROLE_CURR	= "/api/v1/user/role";
	public static final String URI_API_USR_SET_PASS		= "/api/v1/user/{id}/password";
	public static final String URI_API_USR_CHG_PASS		= "/api/v1/user/password";
	public static final String URI_API_USR_ENABLE		= "/api/v1/user/{id}/state/enable";
	public static final String URI_API_USR_UNEXPIRE		= "/api/v1/user/{id}/state/unexpire";
	public static final String URI_API_USR_UNLOCK		= "/api/v1/user/{id}/state/unlock";
	public static final String URI_API_USR_PASS_UNEXPIRE= "/api/v1/user/{id}/password/unexpire";
	public static final String URI_API_USR_ACCT			= "/api/v1/user/{id}/account";
	public static final String URI_API_USR_ACCT_CURR	= "/api/v1/user/account";
	public static final String URI_API_USR_ACCT_CHK		= "/api/v1/user/{id}/account/checking";
	public static final String URI_API_USR_ACCT_CHK_CURR= "/api/v1/user/account/checking";
	public static final String URI_API_USR_ACCT_SAV		= "/api/v1/user/{id}/account/savings";
	public static final String URI_API_USR_ACCT_SAV_CURR= "/api/v1/user/account/savings";
	public static final String URI_API_ACCT_ALL			= "/api/v1/account";
	public static final String URI_API_ACCT				= "/api/v1/account/{id}";
	public static final String URI_API_ACCT_CHK_ALL		= "/api/v1/account/checking";
	public static final String URI_API_ACCT_SAV_ALL		= "/api/v1/account/savings";
	public static final String URI_API_ACCT_TRAN		= "/api/v1/account/{id}/transaction";
	public static final String URI_API_ACCT_OWNER		= "/api/v1/account/{id}/owner";
	public static final String URI_API_ACCT_COOWNER		= "/api/v1/account/{id}/coowner";
	public static final String URI_API_ACCT_XFER		= "/api/v1/account/{id}/transfer";
	public static final String URI_API_DATA_ACCT_TYP	= "/api/v1/data/account/type";
	public static final String URI_API_DATA_ACCT_TYP_CHK= "/api/v1/data/account/type/checking";
	public static final String URI_API_DATA_ACCT_TYP_SAV= "/api/v1/data/account/type/savings";
	public static final String URI_API_DATA_ACCT_STAND	= "/api/v1/data/account/standing";
	public static final String URI_API_DATA_ACCT_OWN_TYP= "/api/v1/data/account/ownership/type";
	public static final String URI_API_DATA_ACCT_TRAN_ST= "/api/v1/data/account/transaction/state";
	public static final String URI_API_DATA_ACCT_TRAN_TY= "/api/v1/data/account/transaction/type";
	public static final String URI_API_DATA_ACCT_TRAN_CT= "/api/v1/data/account/transaction/category";
	public static final String URI_API_PROMO			= "/api/v1/promotions";
	public static final String URI_API_SEARCH_ATM		= "/api/v1/search/atm";
	public static final String URI_API_HEALTHCHECK		= "/api/v1/health";
	public static final String URI_API_CREDIT_APP_ALL	= "/api/v1/credit/references";
	public static final String URI_API_CREDIT_APP		= "/api/v1/credit/reference";
	public static final String URI_API_CREDIT_APP_ID	= "/api/v1/credit/reference/{id}";
	public static final String URI_API_CREDIT_ACCT_ID	= "/api/v1/credit/account/{id}";
	public static final String URI_API_CREDIT_ACCT_ID_BILLING = "/api/v1/credit/account/{id}/billing";
	public static final String URI_API_CREDIT_ACCT_ID_TRANS = "/api/v1/credit/account/{id}/transactions";

	
	

	
	
	// Path Variables
	public static final String PATH_VARIABLE_ID		= "id";
	  
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
	public static final String VIEW_CREDIT_APP 		= "credit-app";
	public static final String VIEW_CREDIT_APP_ST 	= "credit-app-status";
	public static final String VIEW_CREDIT_VIEW 	= "credit-view";
	public static final String VIEW_PROMOTIONS		= "promotions";
	public static final String VIEW_SEARCH			= "search";
	public static final String VIEW_OBP_ADD 		= "obp-add";
	public static final String VIEW_OBP_ADD_ACCT 	= "obp-add-acct";
	public static final String VIEW_OBP_VIEW 		= "obp-view";
	
	// Visa Service views
	public static final String VIEW_XFER_VISA 		= "xfer-visa";
	public static final String VIEW_XFER_VISA_PROC	= "xfer-visa-process";
	
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
	public static final String ACCT_STND_OPEN_CODE					= "A1";
	
	// Transaction State Codes
	public static final String ACCT_TRAN_ST_COMP_CODE				= "COM";
	
	// Transaction Type Codes
	public static final String ACCT_TRAN_TYPE_ATM_CODE				= "ATM";
	public static final String ACCT_TRAN_TYPE_DEBIT_CODE			= "DBT";
	public static final String ACCT_TRAN_TYPE_CHARGE_CODE			= "CRG";
	public static final String ACCT_TRAN_TYPE_CHECK_CODE			= "CHK";
	public static final String ACCT_TRAN_TYPE_DEPOSIT_CODE			= "DPT";
	public static final String ACCT_TRAN_TYPE_POS_CODE				= "POS";
	public static final String ACCT_TRAN_TYPE_XFER_CODE				= "TRN";
	public static final String ACCT_TRAN_TYPE_WITHDRAWL_CODE		= "WTH";
	public static final String ACCT_TRAN_TYPE_INT_INCOME_CODE		= "INT";
	public static final String ACCT_TRAN_TYPE_DIV_CREDIT_CODE		= "DIV";
	public static final String ACCT_TRAN_TYPE_PAYMENT_CODE			= "PMT";
	public static final String ACCT_TRAN_TYPE_OVERDRAFT_CODE		= "OVD";
	public static final String ACCT_TRAN_TYPE_FEE_CODE				= "FEE";
	public static final String ACCT_TRAN_TYPE_LATE_FEE_CODE			= "LTF";
	public static final String ACCT_TRAN_TYPE_OVERDRAFT_FEE_CODE	= "OVF";
	public static final String ACCT_TRAN_TYPE_CHECK_FEE_CODE		= "COF";
	public static final String ACCT_TRAN_TYPE_XFER_FEE_CODE			= "TNF";
	public static final String ACCT_TRAN_TYPE_DIRECT_DEP_CODE		= "DDP";
	public static final String ACCT_TRAN_TYPE_EFT_CODE				= "EFT";
	public static final String ACCT_TRAN_TYPE_REFUND_CODE			= "RFD";
	
	// Transaction Category Codes
	public static final String ACCT_TRAN_CAT_MISC_CODE				= "MIS";
	public static final String ACCT_TRAN_CAT_INC_CODE				= "INC";
	public static final String ACCT_TRAN_CAT_ENT_CODE				= "ENT";
	public static final String ACCT_TRAN_CAT_EDU_CODE				= "EDU";
	public static final String ACCT_TRAN_CAT_SHP_CODE				= "SHP";
	public static final String ACCT_TRAN_CAT_PRC_CODE				= "PRC";
	public static final String ACCT_TRAN_CAT_HLT_CODE				= "HLT";
	public static final String ACCT_TRAN_CAT_KID_CODE				= "KID";
	public static final String ACCT_TRAN_CAT_FDD_CODE				= "FDD";
	public static final String ACCT_TRAN_CAT_GFT_CODE				= "GFT";
	public static final String ACCT_TRAN_CAT_INV_CODE				= "INV";
	public static final String ACCT_TRAN_CAT_BIL_CODE				= "BIL";
	public static final String ACCT_TRAN_CAT_AUT_CODE				= "AUT";
	public static final String ACCT_TRAN_CAT_TRV_CODE				= "TRV";
	public static final String ACCT_TRAN_CAT_FEE_CODE				= "FEE";
	public static final String ACCT_TRAN_CAT_BUS_CODE				= "BUS";
	public static final String ACCT_TRAN_CAT_TAX_CODE				= "TAX";
	
	// Promotions
	public static final String PROMO_ACCT_TYPE_BLUE 				= "Blue";
	public static final String PROMO_ACCT_TYPE_GOLD 				= "Gold";
	public static final String PROMO_ACCT_TYPE_PLATINUM				= "Platinum";
	public static final String PROMO_MILLENNIAL_MADNESS				= "Millennial Madness";
	public static final String PROMO_GOLDEN_OLDIES					= "Golden Oldies";
	public static final String PROMO_LOYALTY_BONUS					= "Loyalty Bonus";
	public static final String PROMO_VALUED_CUSTOMER				= "Valued Customer";
	public static final String PROMO_NO_PROMOTIONS					= "No Promotions!";
	
	
	// Credit Application
	public static final String CREDIT_CARD_NO_MASK					= "xxxx xxxx xxxx ";
	
	// Constants for message attributes
	public static final String STATUS_ATT_APP_ID 					= "Id";
	public static final String STATUS_ATT_APP_NO 					= "Number";
	public static final String STATUS_ATT_APP_STATUS 				= "Status";
	public static final String STATUS_ATT_APP_STATUS_DETAIL 		= "StatusDetail";
	public static final String STATUS_ATT_APP_CREDIT_SCORE  		= "CreditScore";
	public static final String STATUS_ATT_APP_RISK_SCORE    		= "RiskScore";
	public static final String STATUS_ATT_APP_CREDIT_ID 			= "approvedCardId";
	public static final String STATUS_ATT_APP_CREDIT_APR 			= "approvedCardApr";
	
	// Credit Application
	public static final String APP_STATUS_SUBMITTED					= "Submitted";
	public static final String APP_STATUS_ACCEPTED					= "Accepted";
	public static final String APP_STATUS_DECLINED					= "Declined";
	public static final String APP_STATUS_APPROVED					= "Approved";
	
	public static final String APP_STATUS_SUBMITTED_DETAIL			= "Your credit application has been sent to the credit provider for review."
																	+ " Expect a response from the credit provider shortly.";
	
	// Application Properties
	public static final String APP_CREDIT_ENABLED					= "io.digisic.credit.enabled";
	public static final String APP_CREDIT_PROTOCOL					= "io.digisic.credit.protocol";
	public static final String APP_CREDIT_HOST						= "io.digisic.credit.host";
	public static final String APP_CREDIT_PORT						= "io.digisic.credit.port";
	public static final String APP_CREDIT_CONTEXT_PATH				= "io.digisic.credit.context-path";
	public static final String APP_CREDIT_USER						= "io.digisic.credit.username";
	public static final String APP_CREDIT_PASSWORD					= "io.digisic.credit.password";
	public static final String APP_ATM_PROTOCOL						= "io.digisic.bank.atm.protocol";
	public static final String APP_ATM_HOST							= "io.digisic.bank.atm.host";
	public static final String APP_ATM_PORT							= "io.digisic.bank.atm.port";
	public static final String APP_VISA_PROTOCOL					= "io.digisic.bank.visa.protocol";
	public static final String APP_VISA_HOST						= "io.digisic.bank.visa.host";
	public static final String APP_VISA_PORT						= "io.digisic.bank.visa.port";
	public static final String APP_OBP_ENABLED						= "io.digisic.bank.obp.enabled";
	public static final String APP_OBP_PROTOCOL						= "io.digisic.bank.obp.protocol";
	public static final String APP_OBP_HOST							= "io.digisic.bank.obp.host";
	public static final String APP_OBP_PORT							= "io.digisic.bank.obp.port";
	public static final String APP_OBP_VERSION						= "io.digisic.bank.obp.version";
	public static final String APP_OBP_CONSUMER_KEY					= "io.digisic.bank.obp.consumer_key";
	
	// Credit API URIs
	public static final String APP_CREDIT_URI_API_BASE				= "/api/v1";	
	public static final String APP_CREDIT_URI_API_AUTH				= "/auth";	
	public static final String APP_CREDIT_URI_CC_ID					= "/credit/card/{0}";
	public static final String APP_CREDIT_URI_CC_ID_BILLING			= "/credit/card/{0}/billing";
	public static final String APP_CREDIT_URI_CC_ID_TRANS			= "/credit/card/{0}/transactions";
	
	// ATM Location Service API URI
	public static final String APP_ATM_URI_API_BASE					= "/v3.1/nodes/atms";
	
	// Visa API Service
	public static final String URI_API_EXTERNAL_VISA				= "/api/v1/external/visa";
	public static final String APP_VISA_URI_API_BASE				= "/visadirect/fundstransfer/v1/pullfundstransactions";
	
	
	// Open Banking Properties
	
	
	// Open Banking API URIs
	public static final String HEADER_OBP_DIRECT_AUTH				= "DirectLogin username={0}, password={1}, consumer_key={2}";
	public static final String HEADER_OBP_DIRECT_AUTH_TOKEN			= "DirectLogin token={0}";
	public static final String URI_OBP_API_BASE						= "/obp/{0}";
	public static final String URI_OBP_API_DIRECT_LOGIN				= "/my/logins/direct";
	public static final String URI_OBP_API_BANKS					= "/banks";
	public static final String URI_OBP_API_BANK						= "/banks/{0}";
	public static final String URI_OBP_API_BANK_ACCTS				= "/banks/{0}/accounts";
	public static final String URI_OBP_API_BANK_ACCOUNT				= "/banks/{0}/accounts/{1}/account";
	public static final String URI_OBP_API_BANK_ACCOUNT_TRANS		= "/banks/{0}/accounts/{1}/transactions";

	
}
