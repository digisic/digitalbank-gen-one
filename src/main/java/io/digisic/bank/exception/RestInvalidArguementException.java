package io.digisic.bank.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class RestInvalidArguementException extends RuntimeException {  

	/**
	 * 
	 */
	private static final long serialVersionUID = 4113204222861006995L;
		
	public RestInvalidArguementException () {
		super();
	}
	
	public RestInvalidArguementException (String message) {
		super(message);
	}
	
}