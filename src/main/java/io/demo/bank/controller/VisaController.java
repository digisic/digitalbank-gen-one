package io.demo.bank.controller;

import java.util.List;

import javax.validation.constraints.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.demo.bank.exception.RestServiceUnavailableException;
import io.demo.bank.model.AtmLocation;
import io.demo.bank.service.VisaService;
import io.demo.bank.util.Messages;
import io.demo.bank.util.Patterns;
import io.demo.bank.util.Constants;

@Validated
@RestController
public class VisaController extends CommonController {
	
	
	@Autowired
	private VisaService visaService;
	
	/*
	 * VISA API by account number
	 */
	@GetMapping (Constants.URI_API_SEARCH_VISA)
	public ResponseEntity<?> searchAtmLocations (@RequestParam @Pattern (regexp=Patterns.VISA_ACCOUNT, 
            											   				 message=Messages.VISA_SEARCH_FORMAT) String zipcode){
		
		try {
			
			List<AtmLocation> locations = visaService.searchATMLocations(zipcode);
						
			return ResponseEntity.ok(locations);
		}
		catch (Exception ex) {
			
			throw new RestServiceUnavailableException(Messages.VISA_SEARCH_UNAVAILABLE);
			
		}

	}

}
