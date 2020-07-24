package io.digisic.bank.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.SERVICE_UNAVAILABLE)
public class RestServiceUnavailableException extends RuntimeException {  
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 7387060042361585561L;

	public RestServiceUnavailableException () {
		super();
	}
	
	public RestServiceUnavailableException (String message) {
		super(message);
	}
	
}