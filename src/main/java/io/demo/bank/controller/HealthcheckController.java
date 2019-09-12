package io.demo.bank.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import io.demo.bank.util.Constants;

@RestController
public class HealthcheckController {

	@GetMapping(Constants.URI_API_HEALTHCHECK)											
	public ResponseEntity<?> getApplicationHealth(){
		return ResponseEntity.ok("Application available");
	}
	
}
