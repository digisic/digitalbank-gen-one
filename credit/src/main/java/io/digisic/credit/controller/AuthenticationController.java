package io.digisic.credit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.digisic.credit.service.UserService;
import io.digisic.credit.util.Constants;


@Validated
@RestController
public class AuthenticationController extends CommonController{
	
	private static final Logger LOG = LoggerFactory.getLogger(AuthenticationController.class);
	
	@Autowired
	UserService userService;
	
	/*
	 * Authenticate User and provide an auth token
	 */
	@PostMapping(Constants.URI_API_AUTH)
	public ResponseEntity<?> authenticateUser(@RequestParam(required=true) String username,
											  @RequestParam(required=true) String password){
		
		LOG.debug("API Authenticate User: User '" + username + "'");
		
		AuthenticationToken authToken = new AuthenticationToken(userService.authenticateUser(username, password));
		
		return ResponseEntity.ok(authToken);
	}
	
	/*
	 * Custom Response Body for Authentication Token
	 */
	private static class AuthenticationToken {
		
		private  String authToken;

		public AuthenticationToken(String authToken) {
			super();
			this.authToken = authToken;
		}

		/**
		 * @return the authToken
		 */
		@SuppressWarnings("unused")
		public String getAuthToken() {
			return authToken;
		}
		
		
		
	}
}
