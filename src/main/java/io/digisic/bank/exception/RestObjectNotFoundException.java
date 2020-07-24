package io.digisic.bank.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class RestObjectNotFoundException extends RuntimeException {  

	/**
	 * 
	 */
	private static final long serialVersionUID = -245914076167801121L;

	
	public RestObjectNotFoundException () {
		super();
	}
	
	public RestObjectNotFoundException (String message) {
		super(message);
	}
	
}