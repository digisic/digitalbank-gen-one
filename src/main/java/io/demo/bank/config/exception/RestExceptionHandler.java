package io.demo.bank.config.exception;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@RestControllerAdvice(basePackages = "io.demo.bank.controller.rest")
public class RestExceptionHandler {

	@ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(value = RestBadRequestException.class)
    public List<String> handleValidationExceptions(RestBadRequestException exception) {
        List<String> respMessage = new ArrayList<String>();
        
        respMessage.add(exception.getMsg());
		
		return respMessage;
    }
	
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public List<String> handleValidationExceptions(MethodArgumentNotValidException ex) {
		return ex.getBindingResult()
			.getAllErrors().stream()
			.map(ObjectError::getDefaultMessage)
			.collect(Collectors.toList());
	}
	
	@ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(value = RestObjectNotFoundException.class)
    public List<String> handleValidationExceptions(RestObjectNotFoundException exception) {
        List<String> respMessage = new ArrayList<String>();
        
        respMessage.add(exception.getMsg());
		
		return respMessage;
    }
	
	@ResponseStatus(HttpStatus.NOT_ACCEPTABLE)
    @ExceptionHandler(value = RestNotAcceptableException.class)
    public List<String> handleValidationExceptions(RestNotAcceptableException exception) {
        List<String> respMessage = new ArrayList<String>();
        
        respMessage.add(exception.getMsg());
		
		return respMessage;
    }
	
}
