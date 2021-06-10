package io.digisic.credit.util;


public class Constants {
	
	// Application Configuration Properties
	public static final String APP_PROP_CREDIT_APP_TIME		= "io.digisic.credit.app.process.time";
	
	
	// Institution Identification Numbers
	public static final String ID_VISA_BIN					= "437826";
	
	// Credit Application
	public static final String APP_STATUS_SUBMITTED			= "Submitted";
	public static final String APP_STATUS_ACCEPTED			= "Accepted";
	public static final String APP_STATUS_DECLINED			= "Declined";
	public static final String APP_STATUS_APPROVED			= "Approved";
	
	// Credit Application Status Details
	public static final String APP_STATUS_SUBMITTED_DETAIL			= "Your credit application has been sent to the credit provider for review."
																	+ " Expect a response from the credit provider shortly.";
	
	public static final String APP_STATUS_ACCEPTED_DETAIL			= "Thank you for your interest in a Digital Credit account."
																	+ " Your application has been accepted. Once your "
																	+ " application has completed the review process, you will recieve"
																	+ " an update from the credit review team.";
	
	public static final String APP_STATUS_DECLINED_DETAIL_RISK		= "Thank you for your interest in a Digital Credit account."
														            + " Digital Credit has reviewed your application, and it was not"
														            + " approved at this time because your debit is too high relative to"
														            + " your income in relation to your credit score.";
	
	public static final String APP_STATUS_DECLINED_DETAIL_INCON		= "Thank you for your interest in a Digital Credit account."
																	+ " Digital Credit has reviewed your application, and it was not"
																	+ " approved at this time because the details provided in the application"
																	+ " are inconsistent with our records. Please contact customer service for further"
																	+ " assistance.";
	
	public static final String APP_STATUS_APPROVED_DETAIL_STD		= "Thank you for your interest in a Digital Credit account." 
														   		 	+ " Digital Credit has reviewed your application, and it has been"
														   		 	+ " approved for a new credit line of ${0}.00"
														   		 	+ " with a qualified APR of {1}%.";
	
	public static final String APP_STATUS_APPROVED_DETAIL_INTRO		= "Thank you for your interest in a Digital Credit account." 
														   		 	+ " Digital Credit has reviewed your application, and it has been"
														   		 	+ " approved for a new credit line of ${0}.00"
														   		 	+ " with a qualified introductory APR of 0.0% for the first 15 months.";
	
	// Constants for message attributes
	public static final String STATUS_ATT_APP_ID 			= "Id";
	public static final String STATUS_ATT_APP_NO 			= "Number";
	public static final String STATUS_ATT_APP_STATUS 		= "Status";
	public static final String STATUS_ATT_APP_STATUS_DETAIL = "StatusDetail";
	public static final String STATUS_ATT_APP_CREDIT_SCORE  = "CreditScore";
	public static final String STATUS_ATT_APP_RISK_SCORE    = "RiskScore";
	public static final String STATUS_ATT_APP_CREDIT_ID 	= "approvedCardId";
	public static final String STATUS_ATT_APP_CREDIT_APR 	= "approvedCardApr";
	
	// Credit Application Messgages
	
	
	// Directives
	public static final String DIR_REDIRECT 				= "redirect:";
		
	// Has Role
	public static final String HAS_ROLE_USER				= "hasRole('" + Patterns.ROLE_USER + "')";
	public static final String HAS_ROLE_ADMIN				= "hasRole('" + Patterns.ROLE_ADMIN + "')";
	public static final String HAS_ROLE_API					= "hasRole('" + Patterns.ROLE_API + "')";
	
	// API
	public static final String API_SECRET					= "%C&F)J@NcRfUjXn2r5u8x/A?D(G-KaPd";
	public static final String API_AUTH_HEADER				= "Authorization";
	public static final String API_TOKEN_BEGIN				= "Bearer ";
	
	// Path Variables
	public static final String PATH_VARIABLE_ID				= "id";
	
	// Public resources
	public static final String URI_WEBJARS_RES 				= "/webjars/**";
	public static final String URI_CSS_RES 					= "/css/**";
	public static final String URI_SCSS_RES 				= "/scss/**";
	public static final String URI_FONTS_RES 				= "/fonts/**";
	public static final String URI_JS_RES 					= "/js/**";
	public static final String URI_IMAGES_RES 				= "/images/**";
	public static final String URI_ABOUT_RES 				= "/about/**";
	public static final String URI_CONTACT_RES 				= "/contact/**";
	public static final String URI_ERROR_RES 				= "/error/**";
	public static final String URI_H2_CONSOLE				= "/h2-console/**";
	public static final String URI_SWAGGER_UI				= "/swagger-ui.html";
	public static final String URI_SWAGGER_V2				= "/v2/api-docs";
	public static final String URI_SWAGGER_RES				= "/swagger-resources/**";
	public static final String URI_SWAGGER_CONF				= "/configuration/**";
	public static final String URI_API_AUTH					= "/api/v1/auth";
		
	// Authenticated URI
	public static final String URI_ROOT 					= "/";
	public static final String URI_ALL						= "/**";
	public static final String URI_API_ALL					= "/api/**";
	public static final String URI_API_USR_ALL				= "/api/v1/users";
	public static final String URI_API_USR					= "/api/v1/user";
	public static final String URI_API_USR_ID				= "/api/v1/user/{id}";
	public static final String URI_API_USR_PROF				= "/api/v1/user/{id}/profile";
	public static final String URI_API_USR_PROF_CURR		= "/api/v1/user/profile";
	public static final String URI_API_USR_ROLE				= "/api/v1/user/{id}/role";
	public static final String URI_API_USR_ROLE_CURR		= "/api/v1/user/role";
	public static final String URI_API_USR_SET_PASS			= "/api/v1/user/{id}/password";
	public static final String URI_API_USR_CHG_PASS			= "/api/v1/user/password";
	public static final String URI_API_USR_ENABLE			= "/api/v1/user/{id}/state/enable";
	public static final String URI_API_USR_UNEXPIRE			= "/api/v1/user/{id}/state/unexpire";
	public static final String URI_API_USR_UNLOCK			= "/api/v1/user/{id}/state/unlock";
	public static final String URI_API_USR_PASS_UNEXPIRE	= "/api/v1/user/{id}/password/unexpire";
	public static final String URI_API_CREDIT_APP			= "/api/v1/credit/application";
	public static final String URI_API_CREDIT_APP_ID		= "/api/v1/credit/application/{id}";
	public static final String URI_API_CREDIT_CARD			= "/api/v1/credit/card";
	public static final String URI_API_CREDIT_CARD_ID		= "/api/v1/credit/card/{id}";
	public static final String URI_API_BILLING_DETAIL		= "/api/v1/credit/card/{id}/billing";
	public static final String URI_API_CREDIT_TRANS			= "/api/v1/credit/card/{id}/transactions";
	public static final String URI_API_HEALTHCHECK			= "/api/v1/health";

}
