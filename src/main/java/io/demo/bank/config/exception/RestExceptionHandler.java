package io.demo.bank.config.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice(basePackages = "io.demo.bank.controller.rest")
public class RestExceptionHandler {

	@ResponseBody
    @ExceptionHandler(value = RestException.class)
    public ResponseEntity<?> handleException(RestException exception) {
        return ResponseEntity.status(exception.getStatus()).body(exception.getMsg());
    }
	
	@ResponseBody
    @ExceptionHandler(value = Exception.class)
    public ResponseEntity<?> handleException(Exception exception) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(exception.getLocalizedMessage());
    }
}
