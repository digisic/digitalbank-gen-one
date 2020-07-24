package io.digisic.bank.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class RestBadRequestException extends RuntimeException {  


	private static final long serialVersionUID = 9064945270708398079L;

	public RestBadRequestException () {
		super();
	}
	
	public RestBadRequestException (String message) {
		super(message);
	}
	
}