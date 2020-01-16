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
import io.demo.bank.service.SearchService;
import io.demo.bank.util.Messages;
import io.demo.bank.util.Patterns;
import io.demo.bank.util.Constants;

@Validated
@RestController
public class SearchController extends CommonController {
	
	
	@Autowired
	private SearchService searchService;       
	
	/*
	 * Search ATM Locations by ZipCode
	 */
	@GetMapping (Constants.URI_API_SEARCH_ATM)
	public ResponseEntity<?> searchAtmLocations (@RequestParam @Pattern (regexp=Patterns.US_ZIPCODE, 
            											   				 message=Messages.ATM_SEARCH_FORMAT) String zipcode){
		
		try {
			
			List<AtmLocation> locations = searchService.searchATMLocations(zipcode);
						
			return ResponseEntity.ok(locations);
		}
		catch (Exception ex) {
			
			throw new RestServiceUnavailableException(Messages.ATM_SEARCH_UNAVAILABLE);
			
		}

	}

}
