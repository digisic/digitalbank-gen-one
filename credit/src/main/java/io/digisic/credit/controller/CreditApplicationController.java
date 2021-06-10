package io.digisic.credit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import io.digisic.credit.model.CreditApplication;
import io.digisic.credit.service.CreditApplicationService;
import io.digisic.credit.util.Constants;


@Validated
@RestController
public class CreditApplicationController extends CommonController{

	private static final Logger LOG = LoggerFactory.getLogger(CreditApplicationController.class);
	
	@Autowired
	private CreditApplicationService creditApplicationService;
	
	
	/*
	 * ADMIN role
	 * Get All Credit Applications
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_CREDIT_APP)
	public ResponseEntity<?> getAllCreditApplications() {
		
		LOG.debug("Get All Credit Applications");
		
		return ResponseEntity.ok(creditApplicationService.getCreditApplications());
	}
	
	/*
	 * ADMIN role
	 * Delete a Credit Application
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@DeleteMapping(Constants.URI_API_CREDIT_APP_ID)
	public ResponseEntity<?> deleteCreditApplication(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		
		LOG.debug("Delete Credit Application: " + id);
		
		CreditApplication app = getCreditApplicationById(id);
		
		creditApplicationService.deleteCreditApplication(app);
	
		return ResponseEntity.noContent().build();
	}
	
}
