package io.digisic.bank.test.serenity.common;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import com.github.javafaker.Faker;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;

public class TestDataService {
	
	// Get the base URL from the environment
	private String baseURL = (System.getProperty("webdriver.base.url") != null) 
						   ? System.getProperty("webdriver.base.url")
						   : "http://localhost:8080";
	
	private String authToken 	= "";
	private UserDetails userDetails = new UserDetails();
	
	
	
	/*
	 * Returns user ID if found. If User is not found 
	 * return -1.
	 */
	@Step("Validate whether '{0}' is already registered with '{1}' email address")
	public boolean validateRegisteredUser (String persona, String email) {
		
		if (authToken == null || authToken.length() < 1) 
			authenticateAPI();
			
		// Find user
		SerenityRest.given()
					.contentType("application/json")
					.header("Authorization", "Bearer " + authToken)
					.baseUri(baseURL)
					.basePath("/api/v1/user/find")
					.queryParams("username", email)
					.when()
					.get()
					.then()
					.assertThat()
					.statusCode(200);
	
		
		try {
			
				userDetails.setEmailAddress(email);
				userDetails.setPersona(persona);
			 	userDetails.setId(SerenityRest.lastResponse()
					    	 				  .then()
					    	 				  .extract()
					    	 				  .jsonPath()
					    	 				  .getInt("id"));
			 	return true;
		
		}
		catch (Exception e) {
			return false;
		}
	}
	
	/*
	 * Get existing user SSN
	 */
	@Step ("Find an existing social security number")
	public String getExistingSsn() {
		
		
		if (authToken == null || authToken.length() < 1) 
			authenticateAPI();
		
		String ssn = "";
			
		// Find user
		SerenityRest.given()
					.contentType("application/json")
					.header("Authorization", "Bearer " + authToken)
					.baseUri(baseURL)
					.basePath("/api/v1/users")
					.when()
					.get()
					.then()
					.assertThat()
					.statusCode(200);
	
		
		try {
				List<String> results = SerenityRest.lastResponse()
					    	 					.then()
					    	 					.extract()
					    	 					.jsonPath()
					    	 					.getList("userProfile.ssn");
				
				if (results.size() > 0) {
					ssn = results.get(results.size() - 1);
				}
		
		}
		catch (Exception e) {}
		
		return ssn;
	}
	
	/*
	 * Get existing user Email
	 */
	@Step ("Find an existing email address")
	public String getExistingEmail() {
		
		
		if (authToken == null || authToken.length() < 1) 
			authenticateAPI();
		
		String email = "";
			
		// Find user
		SerenityRest.given()
					.contentType("application/json")
					.header("Authorization", "Bearer " + authToken)
					.baseUri(baseURL)
					.basePath("/api/v1/users")
					.when()
					.get()
					.then()
					.assertThat()
					.statusCode(200);
	
		
		try {
				List<String> results = SerenityRest.lastResponse()
					    	 					.then()
					    	 					.extract()
					    	 					.jsonPath()
					    	 					.getList("userProfile.emailAddress");
				
				if (results.size() > 0) {
					email = results.get(results.size() - 1);
				}
		
		}
		catch (Exception e) {}
		
		return email;
	}
	
	/*
	 * 
	 */
	@Step("Register User")
	public void registerUser () {
		
		if (authToken == null || authToken.length() < 1) 
			authenticateAPI();
		
		// Data Generator
		Faker faker = new Faker(new Locale("en-US"));
		String gender = faker.demographic().sex().substring(0, 1);
		String title = (gender.equals("F")) ? "Mrs." : "Mr.";
		SimpleDateFormat formatDate = new SimpleDateFormat("MM/dd/yyyy");
		
		// build the request body for the user we are creating
		String newUser = "{"
				  	   + "\"address\": \"" 		+ faker.address().streetAddress() + "\","
				  	   + "\"country\": \"" 		+ "US" + "\","
				  	   + "\"dob\": \"" 			+ formatDate.format(faker.date().birthday()) + "\","
				  	   + "\"emailAddress\": \"" + userDetails.getEmailAddress() + "\","
				  	   + "\"firstName\": \""	+ userDetails.getPersona() + "\","
				  	   + "\"gender\": \""		+ gender + "\","
				  	   + "\"homePhone\": \""	+ faker.numerify("###-###-####") + "\","
				  	   + "\"lastName\": \""		+ faker.name().lastName() + "\","
				  	   + "\"locality\": \""		+ faker.address().city() + "\","
				  	   + "\"mobilePhone\": \""	+ faker.numerify("###-###-####") + "\","
				  	   + "\"password\": \""		+ userDetails.getPassword() + "\","
				  	   + "\"postalCode\": \""	+ faker.address().zipCode().split("-")[0] + "\","
				  	   + "\"region\": \""		+ faker.address().stateAbbr() + "\","
				  	   + "\"ssn\": \""			+ faker.numerify("###-##-####") + "\","
				  	   + "\"title\": \""		+ title + "\","
				  	   + "\"workPhone\": \""	+ faker.numerify("###-###-####") + "\""
					   + "}";
		
		// Create new user within application
		SerenityRest.given()
					.contentType("application/json")
					.header("Authorization", "Bearer " + authToken)
					.baseUri(baseURL)
					.basePath("/api/v1/user")
					.queryParams("role", "USER")
					.body(newUser)
					.when()
					.post()
					.then()
					.assertThat()
					.statusCode(201);
		
		try {
			
			// Get the user id of the user we created
		 	userDetails.setId(SerenityRest.lastResponse()
				    	 				  .then()
				    	 				  .extract()
				    	 				  .jsonPath()
				    	 				  .getInt("id"));
		 	
		 	// Add API role for user
		 	SerenityRest.given()
			.contentType("application/json")
			.header("Authorization", "Bearer " + authToken)
			.baseUri(baseURL)
			.basePath("/api/v1/user/" + userDetails.getId() + "/role")
			.queryParams("role", "API")
			.when()
			.put()
			.then()
			.assertThat()
			.statusCode(200);
		}
		catch (Exception e) {}
		
	}
	
	
	/*
	 * Lock user account
	 */
	@Step("Lock user account")
	public void lockUserAccount() {
		
		if (authToken == null || authToken.length() < 1) 
			authenticateAPI();
		
		SerenityRest.given()
					.contentType("application/json")
					.header("Authorization", "Bearer " + authToken)
					.baseUri(baseURL)
					.basePath("/api/v1/user/" + userDetails.getId() + "/state/unlock")
					.queryParams("unlock", "false")
					.when()
					.put()
					.then()
					.assertThat()
					.statusCode(204);
	}
	
	/*
	 * Expire user account
	 */
	@Step("Expire user account")
	public void expireUserAccount() {
		
		if (authToken == null || authToken.length() < 1) 
			authenticateAPI();
		
		SerenityRest.given()
					.contentType("application/json")
					.header("Authorization", "Bearer " + authToken)
					.baseUri(baseURL)
					.basePath("/api/v1/user/" + userDetails.getId() + "/state/unexpire")
					.queryParams("unexpire", "false")
					.when()
					.put()
					.then()
					.assertThat()
					.statusCode(204);
	}
	
	/*
	 * Disable user account
	 */
	@Step("Disable user account")
	public void disableUserAccount() {
		
		if (authToken == null || authToken.length() < 1) 
			authenticateAPI();
		
		SerenityRest.given()
					.contentType("application/json")
					.header("Authorization", "Bearer " + authToken)
					.baseUri(baseURL)
					.basePath("/api/v1/user/" + userDetails.getId() + "/state/enable")
					.queryParams("enabled", "false")
					.when()
					.put()
					.then()
					.assertThat()
					.statusCode(204);
	}
	
	/*
	 * Expire Credentials
	 */
	@Step("Expire user credentials")
	public void expireUserCredentials() {
		
		if (authToken == null || authToken.length() < 1) 
			authenticateAPI();
		
		SerenityRest.given()
					.contentType("application/json")
					.header("Authorization", "Bearer " + authToken)
					.baseUri(baseURL)
					.basePath("/api/v1/user/" + userDetails.getId() + "/password/unexpire")
					.queryParams("unexpire", "false")
					.when()
					.put()
					.then()
					.assertThat()
					.statusCode(204);
	}
	
	
	/*
	 * Authenticate to the API
	 */
	private void authenticateAPI () {
		
		String apiUsername 	= "admin@demo.io";
		String apiPassword 	= "Demo123!";
		
		SerenityRest.given()
					.queryParams("username", apiUsername)
					.queryParams("password", apiPassword)
					.contentType("application/json")
					.baseUri(baseURL)
					.basePath("/api/v1/auth")
					.when()
					.post()
					.then()
					.assertThat()
					.statusCode(200);
		
		authToken = SerenityRest.lastResponse().then().extract().jsonPath().getString("authToken");

	}
	
	
	private class UserDetails {
		
		
		int id;
		String emailAddress;
		String persona;
		final String password = "Demo123!";
		
		UserDetails(){}
		
	
		/**
		 * @return the emailAddress
		 */
		public String getEmailAddress() {
			return emailAddress;
		}
		/**
		 * @param emailAddress the emailAddress to set
		 */
		public void setEmailAddress(String emailAddress) {
			this.emailAddress = emailAddress;
		}
		/**
		 * @return the id
		 */
		public int getId() {
			return id;
		}
		/**
		 * @param id the id to set
		 */
		public void setId(int id) {
			this.id = id;
		}
		/**
		 * @return the password
		 */
		public String getPassword() {
			return password;
		}
		/**
		 * @return the persona
		 */
		public String getPersona() {
			return persona;
		}
		/**
		 * @param persona the persona to set
		 */
		public void setPersona(String persona) {
			this.persona = persona;
		}
		
		

	}

}
