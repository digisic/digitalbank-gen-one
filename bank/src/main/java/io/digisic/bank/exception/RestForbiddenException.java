package io.digisic.bank.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.FORBIDDEN)
public class RestForbiddenException extends RuntimeException {  

	/**
	 * 
	 */
	private static final long serialVersionUID = -245914076167801121L;

	public RestForbiddenException () {
		super();
	}
	
	public RestForbiddenException (String message) {
		super(message);
	}
	
}