package io.digisic.bank.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
public class RestNotAcceptableException extends RuntimeException {  

	/**
	 * 
	 */
	private static final long serialVersionUID = 4113204222861006995L;
		
	public RestNotAcceptableException () {
		super();
	}
	
	public RestNotAcceptableException (String message) {
		super(message);
	}
	
}