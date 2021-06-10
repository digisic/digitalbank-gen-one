package io.digisic.bank.controller;


import java.math.BigDecimal;
import javax.validation.Valid;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Positive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.digisic.bank.exception.RestForbiddenException;
import io.digisic.bank.exception.RestServiceUnavailableException;
import io.digisic.bank.model.CreditCardApplication;
import io.digisic.bank.model.CreditCardReference;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.service.CreditCardService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;

@Validated
@RestController
public class CreditController extends CommonController {
	
	@Autowired
	private CreditCardService ccService;
	
	/*
	 * Get All Credit Applications
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping (Constants.URI_API_CREDIT_APP_ALL)
	public ResponseEntity<?> creditApplications (){
		return ResponseEntity.ok(ccService.getCreditReferences());
	}
	
	/*
	 * Get Credit Application By Id
	 */
	@PreAuthorize(Constants.HAS_ROLE_ADMIN)
	@GetMapping (Constants.URI_API_CREDIT_APP_ID)
	public ResponseEntity<?> getCreditApplicationReference (@PathVariable(Constants.PATH_VARIABLE_ID) Long id){
		return ResponseEntity.ok(ccService.getCreditReference(id));
	}
	
	/*
	 * Post Credit Application
	 */
	@PostMapping (Constants.URI_API_CREDIT_APP)
	public ResponseEntity<?> submitCreditApplication (@RequestBody @Valid  Application application){
		
		
		if (ccService.isCreditServiceEnabled() && ccService.checkCreditConnection()) {
		
			Users authUser = getAuthenticatedUser();
			
			// New Credit Application based on current user profile data
			CreditCardApplication creditApp = new CreditCardApplication(authUser.getUserProfile());
			
			// Pass in the financial data
			creditApp.setAgreeTerms(application.isAgreeTerms());
			creditApp.setAnnualIncome(application.getAnnualIncome());
			creditApp.setBalanceTransfer(application.isBalanceTransfer());
			creditApp.setBankStatus(application.getBankStatus());
			creditApp.setCashAdvance(application.isCashAdvance());
			creditApp.setEmploymentStatus(application.getEmploymentStatus());
			creditApp.setMinimumCreditCard(application.getMinimumCreditCard());
			creditApp.setMonthlyAutoLoan(application.getMonthlyAutoLoan());
			creditApp.setMonthlyMortgage(application.getMonthlyMortgage());
			creditApp.setMonthlyOtherLoan(application.getMonthlyOtherLoan());
			creditApp.setMonthlySpend(application.getMonthlySpend());
			
			if (ccService.submitCreditApplication(authUser, creditApp))
				return ResponseEntity.ok(ccService.getCreditReference(authUser));
			else
				return ResponseEntity.badRequest().build();
		} else {
			throw new RestServiceUnavailableException(Messages.CREDIT_APP_SVC_UNAVAILABLE);
		}
					
	}
	
	/*
	 * Get Credit Reference
	 */
	@GetMapping (Constants.URI_API_CREDIT_APP)
	public ResponseEntity<?> getCreditApplicationReference(){
		
		if (ccService.isCreditServiceEnabled() && ccService.checkCreditConnection()) {
			
			Users authUser = getAuthenticatedUser();
			
			if (ccService.userHasApplication(authUser)) {
				
				CreditCardReference ccReference = ccService.getCreditReference(authUser);
				
				// Remove Credit Reference if status is Declined. Once user views the declined status,
				// the UI should take them back to the credit application 
				if (ccReference.getApplicationStatus().equals(Constants.APP_STATUS_DECLINED)) {
					ccService.removeCreditCardReference(ccReference);
				}
				
				return ResponseEntity.ok(ccReference);
			}
			else {
				return ResponseEntity.notFound().build();
			}
		
		}
		
		throw new RestServiceUnavailableException(Messages.CREDIT_APP_SVC_UNAVAILABLE);
	}
	
	
	/*
	 * Delete Credit Reference
	 */
	@DeleteMapping (Constants.URI_API_CREDIT_APP)
	public ResponseEntity<?> deleteCreditApplicationReference(){
		
		if (ccService.isCreditServiceEnabled() && ccService.checkCreditConnection()) {
			
			Users authUser = getAuthenticatedUser();
			
			if (ccService.userHasLinkedCreditAccount(authUser)) {
				
				ccService.deleteCreditCard(authUser);
								
				return ResponseEntity.noContent().build();
			}
			else {
				return ResponseEntity.notFound().build();
			}
		
		}
		
		throw new RestServiceUnavailableException(Messages.CREDIT_APP_SVC_UNAVAILABLE);
	}
	
	/*
	 * Get Credit Card Details
	 */
	@GetMapping (Constants.URI_API_CREDIT_ACCT_ID)
	public ResponseEntity<?> getCreditCardDetails(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		
		// If the credit service is available
		if (ccService.isCreditServiceEnabled() && ccService.checkCreditConnection()) {
			
			Users authUser = getAuthenticatedUser();
			
			// If the authenticated user has a linked credit account
			if (ccService.userHasLinkedCreditAccount(authUser)) {
				
				CreditCardReference ccReference = ccService.getCreditReference(authUser);
				
				// If the id is not the current users account
				if (ccReference.getCreditCardId() == id) {
					ResponseEntity.ok(ccService.getCreditCardDetails(id));
					
				} else { // else the id passed in is not the current users account
					throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
				}
			}
			else { // else the id passed in is not the current users account
				throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
			}
		} 
		
		throw new RestServiceUnavailableException(Messages.CREDIT_APP_SVC_UNAVAILABLE);
	}
	
	
	/*
	 * Get Credit Card Billing Details
	 */
	@GetMapping (Constants.URI_API_CREDIT_ACCT_ID_BILLING)
	public ResponseEntity<?> getCreditCardBillingDetails(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		
		// If the credit service is available
		if (ccService.isCreditServiceEnabled() && ccService.checkCreditConnection()) {
			
			Users authUser = getAuthenticatedUser();
			
			// If the authenticated user has a linked credit account
			if (ccService.userHasLinkedCreditAccount(authUser)) {
				
				CreditCardReference ccReference = ccService.getCreditReference(authUser);
				
				// If the id is not the current users account
				if (ccReference.getCreditCardId() == id) {
					ResponseEntity.ok(ccService.getCreditCardBillingDetail(id));
					
				} else { // else the id passed in is not the current users account
					throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
				}
			}
			else { // else the id passed in is not the current users account
				throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
			}
		} 
		
		throw new RestServiceUnavailableException(Messages.CREDIT_APP_SVC_UNAVAILABLE);
	}
	
	
	/*
	 * Get Credit Card Transaction Details
	 */
	@GetMapping (Constants.URI_API_CREDIT_ACCT_ID_TRANS)
	public ResponseEntity<?> getCreditCardTransactionDetails(@PathVariable(Constants.PATH_VARIABLE_ID) Long id) {
		
		// If the credit service is available
		if (ccService.isCreditServiceEnabled() && ccService.checkCreditConnection()) {
			
			Users authUser = getAuthenticatedUser();
			
			// If the authenticated user has a linked credit account
			if (ccService.userHasLinkedCreditAccount(authUser)) {
				
				CreditCardReference ccReference = ccService.getCreditReference(authUser);
				
				// If the id is not the current users account
				if (ccReference.getCreditCardId() == id) {
					ResponseEntity.ok(ccService.getCreditCardTransactions(id));
					
				} else { // else the id passed in is not the current users account
					throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
				}
			}
			else { // else the id passed in is not the current users account
				throw new RestForbiddenException(Messages.ACCESS_FORBIDDEN);
			}
		} 
		
		throw new RestServiceUnavailableException(Messages.CREDIT_APP_SVC_UNAVAILABLE);
	}
	
	
	/*
	 * Partial Credit Application object for receiving and validating Financial data
	 */
	private static class Application {
		
		@NotEmpty (message=Messages.CREDIT_APP_EMP_STATUS_REQ)
		@Pattern(regexp=Patterns.CREDIT_APP_EMP_STATUS, message=Messages.CREDIT_APP_EMP_STATUS_FORMAT)
		private String employmentStatus;
		
		@NotEmpty (message=Messages.CREDIT_APP_BANK_STATUS_REQ)
		@Pattern(regexp=Patterns.CREDIT_APP_BANK_ACCTS, message=Messages.CREDIT_APP_BANK_STATUS_FORMT)
		private String bankStatus;
		
		@NotNull (message=Messages.CREDIT_APP_INCOME_REQ)
		@Positive (message=Messages.CREDIT_APP_INCOME_FORMAT)
		private BigDecimal annualIncome;
		
		@NotNull (message=Messages.CREDIT_APP_MORTGAGE_REQ)
		@Positive (message=Messages.CREDIT_APP_MORTGAGE_FORMAT)
		private BigDecimal monthlyMortgage;
		
		@NotNull (message=Messages.CREDIT_APP_AUTO_LN_REQ)
		@Positive (message=Messages.CREDIT_APP_AUTO_LN_FORMAT)
		private BigDecimal monthlyAutoLoan;
		
		@NotNull (message=Messages.CREDIT_APP_OTHER_LN_REQ)
		@Positive (message=Messages.CREDIT_APP_OTHER_LN_FORMAT)
		private BigDecimal monthlyOtherLoan;
		
		@NotNull (message=Messages.CREDIT_APP_CREDIT_PYMT_REQ)
		@Positive (message=Messages.CREDIT_APP_CREDIT_PYMT_FORMAT)
		private BigDecimal minimumCreditCard;
		
		@NotNull (message=Messages.CREDIT_APP_CREDIT_SPEMD_REQ)
		@Positive (message=Messages.CREDIT_APP_CREDIT_SPEND_FORMT)
		private BigDecimal monthlySpend;
		
		@NotNull (message=Messages.CREDIT_APP_AGREE_TERMS_REQ)
		@AssertTrue(message=Messages.CREDIT_APP_AGREE_TERMS_FORMT)
		private boolean agreeTerms = false;
		
		private boolean cashAdvance = false;
		private boolean balanceTransfer = false;
		
		
		/**
		 * @return the employmentStatus
		 */
		public String getEmploymentStatus() {
			return employmentStatus;
		}

		/**
		 * @return the bankStatus
		 */
		public String getBankStatus() {
			return bankStatus;
		}

		/**
		 * @return the annualIncome
		 */
		public BigDecimal getAnnualIncome() {
			return annualIncome;
		}

		/**
		 * @return the monthlyMortgage
		 */
		public BigDecimal getMonthlyMortgage() {
			return monthlyMortgage;
		}

		/**
		 * @return the monthlyAutoLoan
		 */
		public BigDecimal getMonthlyAutoLoan() {
			return monthlyAutoLoan;
		}

		/**
		 * @return the monthlyOtherLoan
		 */
		public BigDecimal getMonthlyOtherLoan() {
			return monthlyOtherLoan;
		}

		/**
		 * @return the minimumCreditCard
		 */
		public BigDecimal getMinimumCreditCard() {
			return minimumCreditCard;
		}

		/**
		 * @return the monthlySpend
		 */
		public BigDecimal getMonthlySpend() {
			return monthlySpend;
		}

		/**
		 * @return the cashAdvance
		 */
		public boolean isCashAdvance() {
			return cashAdvance;
		}

		/**
		 * @return the balanceTransfer
		 */
		public boolean isBalanceTransfer() {
			return balanceTransfer;
		}

		/**
		 * @return the agreeTerms
		 */
		public boolean isAgreeTerms() {
			return agreeTerms;
		}

		
	}

}
