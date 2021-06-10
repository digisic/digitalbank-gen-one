package io.digisic.credit.service;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.digisic.credit.model.Account;
import io.digisic.credit.model.AuthorizedUsers;
import io.digisic.credit.model.Billing;
import io.digisic.credit.model.BillingAddress;
import io.digisic.credit.model.CreditCard;
import io.digisic.credit.model.TransactionCategory;
import io.digisic.credit.model.TransactionState;
import io.digisic.credit.model.TransactionType;
import io.digisic.credit.model.UserProfile;
import io.digisic.credit.model.security.Users;
import io.digisic.credit.repository.AuthorizedUsersRepository;
import io.digisic.credit.repository.BillingAddressRepository;
import io.digisic.credit.repository.BillingRepository;
import io.digisic.credit.repository.CreditCardRepository;
import io.digisic.credit.repository.TransactionCategoryRepository;
import io.digisic.credit.repository.TransactionStateRepository;
import io.digisic.credit.repository.TransactionTypeRepository;
import io.digisic.credit.util.Constants;

@Service
@Transactional
public class CreditCardService {
	
	private static final Logger LOG = LoggerFactory.getLogger(CreditCardService.class);
	
	@Autowired
	private CreditCardRepository creditCardRepository;
	
	@Autowired
	private BillingAddressRepository billingAddressRepository;
	
	@Autowired
	private BillingRepository billingRepository;
	
	@Autowired
	private TransactionCategoryRepository transactionCategoryRepository;
	
	@Autowired
	private TransactionStateRepository transactionStateRepository;
	
	@Autowired
	private TransactionTypeRepository transactionTypeRepository;
	
	@Autowired
	private AuthorizedUsersRepository authorizedUsersRepository;
	
	private Random random = new Random(System.currentTimeMillis());
	
	/*
	 * Get All Credit Cards
	 */
	public List<CreditCard> getCreditCards () {
		return creditCardRepository.findAll();
	}
	
	/*
	 * Get Credit Card by Id
	 */
	public CreditCard getCreditCard (Long id) {
		Optional<CreditCard> card = creditCardRepository.findById(id);
		
		if (card.isPresent()) {
			return card.get();
		}
		else {
			return null;
		}
	}
	
	/*
	 * Return Credit Card Billing Detail
	 */
	public Billing getCardBillingDetail (CreditCard card) {
		Billing bill = billingRepository.findByCardId(card.getId());
		
		return bill;
	}
	
	/*
	 * Delete Credit Card
	 */
	public void deleteCreditCard (CreditCard card) {
		
		// Delete Billing Details
		LOG.debug("Delete Credit Card: Delete Billing Details.");
		Billing bill = billingRepository.findByCardId(card.getId());
		billingRepository.delete(bill);
		
		// Delete Billing Address Details
		LOG.debug("Delete Credit Card: Delete Billing Address Details.");
		BillingAddress billingAddress = billingAddressRepository.findByCardId(card.getId());
		billingAddressRepository.delete(billingAddress);
		
		// Remove Authorized Users
		LOG.debug("Delete Credit Card: Delete Authorized Users");
		removeAllAuthorizedUsers(card);
		
		// Delete Credit Card
		LOG.debug("Delete Credit Card: Delete Credit Card Details.");
		creditCardRepository.delete(card);
	}
	
	
	public CreditCard createCreditCard(Account account, BigDecimal limit, BigDecimal apr) {
		
		CreditCard creditCard = new CreditCard();
		
		// Calculate the date valid
		Calendar today = Calendar.getInstance();
		String todayMonth = String.valueOf(today.get(Calendar.MONTH) + 1); // +1 because Month is zero based
		String todayYear = String.valueOf(today.get(Calendar.YEAR)).substring(2);
		Long dateValid = Long.valueOf(todayMonth.concat(todayYear));
		
		// Calculate date expire which will be 3 years from today
		today.add(Calendar.YEAR, 3);
		String expireMonth = String.valueOf(today.get(Calendar.MONTH) + 1); // +1 because Month is zero based
		String expireYear = String.valueOf(today.get(Calendar.YEAR)).substring(2);
		Long dateExpire = Long.valueOf(expireMonth.concat(expireYear));

		// Setup credit card account details
		creditCard.setAccount(account);
		creditCard.setCardHolder(account.getAccountOwner());
		creditCard.setCreditLimit(limit);
		creditCard.setApr(apr);
		creditCard.setDateValid(dateValid);
		creditCard.setDateExpire(dateExpire);
		creditCard.setCardNumber(generateCardNumber(Constants.ID_VISA_BIN, 16));
		creditCard.setCvv(generateCvv(3));
		creditCard.setCurrentBalance(new BigDecimal(0));
		creditCard.setAvailableBalance(limit);
		
		// Save Credit Card
		creditCardRepository.save(creditCard);
		
		// Setup credit card billing address
		BillingAddress billingAddress = new BillingAddress (creditCard);
		UserProfile userProfile = creditCard.getCardHolder().getUserProfile();
		billingAddress.setAddress(userProfile.getAddress());
		billingAddress.setCountry(userProfile.getCountry());
		billingAddress.setLocality(userProfile.getLocality());
		billingAddress.setPostalCode(userProfile.getPostalCode());
		billingAddress.setRegion(userProfile.getRegion());
		
		// Save Billing Address
		billingAddressRepository.save(billingAddress);
		
		// Setup First Bill
		today.add(Calendar.YEAR, -3);
		today.add(Calendar.MONTH, 1);
		Billing billing = new Billing (creditCard);
		billing.setLastPaymentMade(new BigDecimal(0));
		billing.setLastStatmentBalance(new BigDecimal(0));
		billing.setMinimumPaymentDue(new BigDecimal(0));
		billing.setPaymentDueDate(today.getTime());
		
		// Save Bill
		billingRepository.save(billing);
		
		// Setup Authorized Users
		addAuthorizedUser(creditCard, creditCard.getCardHolder());
				
		return creditCard;
		
	}
	
	/*
	 * Get Transaction Category by Code
	 */
	public TransactionCategory getTransactionCategory(String code) {
		return transactionCategoryRepository.findByCode(code);
	}
	
	/*
	 * Get Transaction State by Code
	 */
	public TransactionState getTransactionState(String code) {
		return transactionStateRepository.findByCode(code);
	}
	
	/*
	 * Get Transaction Type by Code
	 */
	public TransactionType getTransactionType(String code) {
		return transactionTypeRepository.findByCode(code);
	}
	
	/*
	 * Add Authorized User
	 */
	public void addAuthorizedUser (CreditCard card, Users user) {
		
		Set<AuthorizedUsers> authorizedUsers = card.getAuthorizedUsers();
		
		AuthorizedUsers authorizedUser = new AuthorizedUsers(user, card);
		
		authorizedUsers.add(authorizedUser);
		
		creditCardRepository.save(card);
	}
	
	/*
	 * Remove Authorized User
	 */
	public void removeAuthorizedUser (CreditCard card, Users user) {
		
		Set<AuthorizedUsers> authorizedUsers = card.getAuthorizedUsers();
		
		AuthorizedUsers authorizedUser = new AuthorizedUsers(user, card);
		
		authorizedUsers.remove(authorizedUser);
		
		creditCardRepository.save(card);
	}
	
	/*
	 * Remove all Authorized Users
	 */
	public void removeAllAuthorizedUsers (CreditCard card) {
		
		authorizedUsersRepository.deleteByCardId(card.getId());
	}
	
	/*
     * Generates a random credit card number 
     */
	private String generateCardNumber (String bin, int length) {
		
		// The number of random digits that we need to generate is equal to the
        // total length of the card number minus the start digits given by the
        // user, minus the check digit at the end.
        int randomNumberLength = length - (bin.length() + 1);

        StringBuilder builder = new StringBuilder(bin);
        
        for (int i = 0; i < randomNumberLength; i++) {
            int digit = this.random.nextInt(10);
            builder.append(digit);
        }

        // Do the Luhn algorithm to generate the check digit.
        int checkDigit = this.getCheckDigit(builder.toString());
        builder.append(checkDigit);

        return builder.toString();
		
	}
	
	/*
	 * Generates the credit card check digit
     */
    private int getCheckDigit(String number) {

        // Get the sum of all the digits, however we need to replace the value
        // of the first digit, and every other digit, with the same digit
        // multiplied by 2. If this multiplication yields a number greater
        // than 9, then add the two digits together to get a single digit
        // number.
        //
        // The digits we need to replace will be those in an even position for
        // card numbers whose length is an even number, or those is an odd
        // position for card numbers whose length is an odd number. This is
        // because the Luhn algorithm reverses the card number, and doubles
        // every other number starting from the second number from the last
        // position.
        int sum = 0;
        
        for (int i = 0; i < number.length(); i++) {

            // Get the digit at the current position.
            int digit = Integer.parseInt(number.substring(i, (i + 1)));

            if ((i % 2) == 0) {
                digit = digit * 2;
                if (digit > 9) {
                    digit = (digit / 10) + (digit % 10);
                }
            }
            sum += digit;
        }

        // The check digit is the number required to make the sum a multiple of
        // 10.
        int mod = sum % 10;
        
        return ((mod == 0) ? 0 : 10 - mod);
    }
    
    /*
     * Generates Credit Card Verification Value 
     * This only creates a random CVV code which does not
     * follow the algorithm banks use for creating the CCV
     * using data such as the card expiration date, etc..
     */
    private Long generateCvv(int length) {
    	    	
    	StringBuilder builder = new StringBuilder(length);
    	
        for (int i = 0; i < length; i++) {
            int digit = this.random.nextInt(10);
            builder.append(digit);
        }
        
        return Long.valueOf(builder.toString());
    	
    }

}
