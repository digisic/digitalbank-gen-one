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
import io.digisic.bank.service.VisaService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;


@Validated
@RestController
public class VisaController extends CommonController {
	
	
	@Autowired
	private VisaService visaService;
	
	/*
	 * VISA API by account number
	 */
	@GetMapping (Constants.URI_API_EXTERNAL_VISA)
	public ResponseEntity<?> directVisaPayment (@RequestParam @Pattern (regexp=Patterns.VISA_ACCOUNT, 
            											   				 message=Messages.VISA_ACCOUNT_FORMAT) String account, String amount){
		
		try {
			
			List<String> results = visaService.directVisaPayment(account, amount);
						
			return ResponseEntity.ok(results);
		}
		catch (Exception ex) {
			
			throw new RestServiceUnavailableException(Messages.VISA_SVC_UNAVAILABLE);
			
		}

	}

}

