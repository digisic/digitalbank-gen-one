package io.digisic.bank.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;

@Validated
@RestController
public class PromotionController extends CommonController{
	
	private static final Logger LOG = LoggerFactory.getLogger(PromotionController.class);
	
	
	/*
	 * Determine whether the candidate qualifies for any promotions
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@PostMapping(Constants.URI_API_PROMO)											
	public ResponseEntity<?> determinePromotions(@RequestBody @Valid PromotionCandidate candidate){
		
		LOG.debug("Promotions -> Checking Promotion Candidate");
		
		List<String> promotions = new ArrayList<String>();
		
		// Millennial Madness
		if (ruleOne(candidate))
			promotions.add(Constants.PROMO_MILLENNIAL_MADNESS);
	
		// Golden Oldies
		if (ruleTwo(candidate))
			promotions.add(Constants.PROMO_GOLDEN_OLDIES);

		// Loyalty Bonus
		if (ruleThree(candidate)) 
			promotions.add(Constants.PROMO_LOYALTY_BONUS);
		
		// Valued Customer
		if (ruleFour(candidate))
			promotions.add(Constants.PROMO_VALUED_CUSTOMER);
		
		// No Promotions
		if (promotions.isEmpty())
			promotions.add(Constants.PROMO_NO_PROMOTIONS);
	
		
		return ResponseEntity.ok(promotions);
	}
	
	
	/*
	 * Check for Millennial Madness
	 * 
	 * Customers qualify for this promotion if they are between 21 and 35 (inclusive) of age
	 * as well as have either a credit rating of 600+ or a balance above $10,000
	 */
	private boolean ruleOne (PromotionCandidate candidate) {
	
		if (candidate.getAge() >= 21 && candidate.getAge() <= 35)
			if (candidate.getRating() >= 600 || candidate.getBalance().compareTo(new BigDecimal(10000)) > 0) { // balance > 10000
				
				LOG.debug("Millennial Madness -> true");
				return true;
			}
		
		LOG.debug("Millennial Madness -> false");
		return false;
	}
	
	/*
	 * Check for Golden Oldies
	 * 
	 * Customers qualify for this promotion if they are 65 and over of age
	 * and have a credit rating of 500 or more, or a balance above $5,000.
	 * They must also be a Gold customer or above
	 */
	private boolean ruleTwo (PromotionCandidate candidate) {

		if (candidate.getAge() >= 65) 
			if (candidate.getRating() >= 500 || candidate.getBalance().compareTo(new BigDecimal(5000)) > 0) // balance > 5000
				if (candidate.getAccountType().equalsIgnoreCase(Constants.PROMO_ACCT_TYPE_GOLD) ||
					candidate.getAccountType().equalsIgnoreCase(Constants.PROMO_ACCT_TYPE_PLATINUM)) {
					
					LOG.debug("Golden Oldies -> true");
					return true;
				}
		
		LOG.debug("Golden Oldies -> false");
		return false;
	}
	
	/*
	 * Check for Loyalty Bonus
	 * 
	 * Customers qualify for this promotion if they have been at the bank
	 * for at least 5 years
	 */
	private boolean ruleThree (PromotionCandidate candidate) {
		
		if (candidate.getYears() >= 5) {
			
			LOG.debug("Loyalty Bonus -> true");
			return true;
		}
			
		LOG.debug("Loyalty Bonus -> false");
		return false;
	}
	
	/*
	 * Check for Valued Customer
	 * 
	 * Customers qualify for this promotion if they are in good standing* and don't
	 * qualify for any other promotions
	 */
	private boolean ruleFour (PromotionCandidate candidate) {
		
		if (goodStanding(candidate) && !(ruleOne(candidate) || ruleTwo(candidate) || ruleThree(candidate))) {
			
			LOG.debug("Valued Customer -> true");
			return true;
		}
		
		LOG.debug("Valued Customer -> false");
		return false;
	}
	
	/*
	 * Check if the candidate is in good standing with the bank
	 * 
	 * Good standing means a customer has a credit rating above 500, or isn't in debt
	 * to the bank. All Platinum customers automatically have good standing
	 */
	private boolean goodStanding (PromotionCandidate candidate) {
		
		if (candidate.getAccountType().equals(Constants.PROMO_ACCT_TYPE_PLATINUM)) {
			
			LOG.debug("Good Standing -> true");
			return true;
		}
		
		if (candidate.getRating() > 500 || candidate.getBalance().compareTo(BigDecimal.ZERO) >= 0) { // balance >= 0
			
			LOG.debug("Good Standing -> true");
			return true;
		}
		
		LOG.debug("Good Standing -> false");
		return false;
	}
	
	
	/*
	 * User for Promotion Qualification
	 */
	private static class PromotionCandidate {
		
		@NotNull(message=Messages.PROMO_BALANCE_REQ)
		private BigDecimal balance;
		
		@Positive(message=Messages.PROMO_AGE_FORMAT)
		private int age;
		
		@Positive(message=Messages.PROMO_RATING_FORMAT)
		private int rating;
		
		@Positive(message=Messages.PROMO_YEARS_FORMAT)
		private int years;
		
		@NotEmpty (message=Messages.PROMO_ACCT_TYPE_REQ)
		@Pattern (regexp=Patterns.PROMO_ACCT_TYPE, message=Messages.PROMO_ACCT_TYPE_FORMAT) 
		private String accountType;
		
		
		/**
		 * @return the age
		 */
		public int getAge() {
			return age;
		}
		
		/**
		 * @return the accountType
		 */
		public String getAccountType() {
			return accountType;
		}
		
		/**
		 * @return the balance
		 */
		public BigDecimal getBalance() {
			return balance;
		}
		
		/**
		 * @return the rating
		 */
		public int getRating() {
			return rating;
		}
		
		/**
		 * @return the years
		 */
		public int getYears() {
			return years;
		}
	}
}
