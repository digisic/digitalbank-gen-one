package io.digisic.credit.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import io.digisic.credit.util.Constants;

@RestController
public class HealthCheckController {

	@GetMapping(Constants.URI_API_HEALTHCHECK)											
	public ResponseEntity<?> getApplicationHealth(){
		return ResponseEntity.ok("Application Available");
	}
	
}
