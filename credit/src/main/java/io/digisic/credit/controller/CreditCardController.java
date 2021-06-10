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

import io.digisic.credit.model.CreditCard;
import io.digisic.credit.service.CreditCardService;
import io.digisic.credit.util.Constants;

@Validated
@RestController
public class CreditCardController extends CommonController{

	private static final Logger LOG = LoggerFactory.getLogger(CreditCardController.class);
	
	@Autowired
	private CreditCardService creditCardService;
		
	/*
	 * ADMIN role
	 * Get All Credit Cards
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping(Constants.URI_API_CREDIT_CARD)
	public ResponseEntity<?> getAllCreditCards() {
		
		LOG.debug("Get All Credit Cards");
		
		return ResponseEntity.ok(creditCardService.getCreditCards());
	}
	
	/*
	 * ADMIN role
	 * Delete a Credit Card
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@DeleteMapping(Constants.URI_API_CREDIT_CARD_ID)
	public ResponseEntity<?> deleteCreditCard(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		
		LOG.debug("Delete Credit Card: " + id);
		
		CreditCard card = getCreditCardById(id);
		
		creditCardService.deleteCreditCard(card);
	
		return ResponseEntity.noContent().build();
	}
	
	/*
	 * Get credit card by id
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping (Constants.URI_API_CREDIT_CARD_ID)
	public ResponseEntity<?> getCreditCard(@PathVariable(Constants.PATH_VARIABLE_ID) Long id){
		
		LOG.debug("Get Credit Card: " + id);
		
		CreditCard card = getCreditCardById(id);
		
		return ResponseEntity.ok(card);
	}
	
	/*
	 * Get credit billing by card id
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping (Constants.URI_API_BILLING_DETAIL)
	public ResponseEntity<?> getBillingDetails(@PathVariable(Constants.PATH_VARIABLE_ID) Long id){
		
		LOG.debug("Get Billing Details for Credit Card: " + id);
		
		CreditCard card = getCreditCardById(id);
		
		return ResponseEntity.ok(creditCardService.getCardBillingDetail(card));
	}
	
	/*
	 * Get credit card transactions by card id
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping (Constants.URI_API_CREDIT_TRANS)
	public ResponseEntity<?> getCreditTransactions(@PathVariable(Constants.PATH_VARIABLE_ID) Long id){
		
		LOG.debug("Get Transactions for Credit Card: " + id);
		
		CreditCard card = getCreditCardById(id);
		
		return ResponseEntity.ok(card.getCreditTransactionList());
	}
	
	
	
}
