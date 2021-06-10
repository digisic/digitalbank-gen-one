package io.digisic.bank.controller;

import java.util.List;

import javax.validation.constraints.Pattern;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.digisic.bank.exception.RestServiceUnavailableException;
import io.digisic.bank.model.AtmLocation;
import io.digisic.bank.service.SearchService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;

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
