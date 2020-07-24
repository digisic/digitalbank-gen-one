package io.digisic.bank.service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import io.digisic.bank.model.Account;
import io.digisic.bank.model.AccountStanding;
import io.digisic.bank.model.AccountTransaction;
import io.digisic.bank.model.AccountType;
import io.digisic.bank.model.OwnershipType;
import io.digisic.bank.model.TransactionCategory;
import io.digisic.bank.model.TransactionState;
import io.digisic.bank.model.TransactionType;
import io.digisic.bank.model.security.Users;
import io.digisic.bank.repository.AccountRepository;
import io.digisic.bank.repository.AccountStandingRepository;
import io.digisic.bank.repository.AccountTransactionRepository;
import io.digisic.bank.repository.AccountTypeRepository;
import io.digisic.bank.repository.OwnershipTypeRepository;
import io.digisic.bank.repository.TransactionCategoryRepository;
import io.digisic.bank.repository.TransactionStateRepository;
import io.digisic.bank.repository.TransactionTypeRepository;
import io.digisic.bank.util.Constants;

@Service
@Transactional
public class AccountService {
	
	private static final Logger LOG = LoggerFactory.getLogger(AccountService.class);
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private AccountTypeRepository accountTypeRepository;
	
	@Autowired
	private OwnershipTypeRepository ownershipTypeRepository;
	
	@Autowired
	private AccountStandingRepository accountStandingRepository;
	
	@Autowired
	private TransactionStateRepository transactionStateRepository;
	
	@Autowired
	private TransactionTypeRepository transactionTypeRepository;
	
	@Autowired 
	private AccountTransactionRepository accountTransactionRepository;
	
	@Autowired
	private TransactionCategoryRepository transactionCategoryRepository;
	
	
	/*
	 * Get Transactions By Category Summary Data
	 */
	public List<List<String>> getChartDataTransactionByCategory(Users user) {
		
		// Get Calendar today and roll back 3 months
		GregorianCalendar monthlyCalendar = new GregorianCalendar();
		monthlyCalendar.setTime(new Date());
		monthlyCalendar.add(Calendar.MONTH, -3);
		
		// Get all of the user accounts
		List<Account> accounts = getAllAccounts(user);
		
		// 2 Dimension Array for data to be returned
		List<List<String>> data = new ArrayList<List<String>>();
		
		// Lists for data to be returned in array
		List<String> creditNames = new ArrayList<String>();
		List<String> debitNames = new ArrayList<String>();
		List<String> creditSums = new ArrayList<String>();
		List<String> debitSums = new ArrayList<String>();
		List<String> creditColors = new ArrayList<String>();
		List<String> debitColors = new ArrayList<String>();
		
		String red = "";
		String green = "";
		String blue = "";
		String transparency = "";
		int debitTotal = 0;
		int creditTotal = 0;
		int debitCount = 0;
		int creditCount = 0;
		

				
		// get the available categories
		List<TransactionCategory> categories = getTransactionCategory();
		
		LOG.debug("Chart Data - Transaction By Category: Total Accounts Found: " + accounts.size());
		
		// For each category get transactions and sum them
		for (int i = 0; i < categories.size(); i++) {
			
			double creditSum = 0;
			double debitSum = 0;
			boolean creditTrans = false;
			boolean debitTrans = false;
			
			// For each account
			for (int j = 0; j < accounts.size(); j++) {
				List<AccountTransaction> atl = accountTransactionRepository
											  .findAllByAccountAndTransactionCategoryAndTransactionDateAfter(accounts.get(j), categories.get(i), monthlyCalendar.getTime());
				
				LOG.debug("Chart Data - Transaction By Category: Account: " + accounts.get(j).getName());
				LOG.debug("Chart Data - Transaction By Category: Category: " + categories.get(i).getName());
				LOG.debug("Chart Data - Transaction By Category: After Date: " + monthlyCalendar.getTime());
				LOG.debug("Chart Data - Transaction By Category: Transactions: " + atl.size());
				
				// if we have some transactions for this category
				if (atl.size() > 0) {
					// sum the transactions
					for (int k = 0; k < atl.size(); k++) {
						
						double amount = atl.get(k).getAmount().doubleValue();
						
						LOG.debug("Evaluating amount: " + amount);
						
						if (amount < 0) { // debit
							debitTrans = true;
							debitSum += amount;
							
						} else { // credit
							creditTrans = true;
							creditSum += amount;
						}
					} // end for each transaction sum
						
				} // end if transactions
				
				LOG.debug("Chart Data (Transaction By Category): Credit Sum(" + accounts.get(j).getName() + "): " + creditSum);
				LOG.debug("Chart Data (Transaction By Category): Debit Sum(" + accounts.get(j).getName() + "): " + debitSum);
				
				
			} // end for each account
			
			if (debitTrans) {
				
				debitNames.add(categories.get(i).getName());
	
				red = "217";
				green = "103";
				blue = "4";
				transparency = "" + new BigDecimal(1 - (++debitCount * .05)).setScale(2, RoundingMode.HALF_UP);
					
				debitSums.add("" + (new BigDecimal(debitSum).setScale(2, RoundingMode.HALF_EVEN)));
				debitColors.add("rgba(" + red + "," + green + "," + blue + "," + transparency + ")");
				debitTrans = false;
				
				debitTotal += debitSum;
				debitSum = 0;
			} // end if debit transactions
			
			if (creditTrans) { // credit transactions
				
				creditNames.add(categories.get(i).getName());
		
				red = "2";
				green = "89";
				blue = "40";	
				transparency = "" + new BigDecimal(1 - (++creditCount * .05)).setScale(2, RoundingMode.HALF_UP);
		
				creditSums.add("" + (new BigDecimal(creditSum).setScale(2, RoundingMode.HALF_EVEN)));
				creditColors.add("rgba(" + red + "," + green + "," + blue + "," + transparency + ")");
				creditTrans = false;
				
				creditTotal += creditSum;
				creditSum = 0;
			
			} // end if credit transactions
				
		} // end for each category
		
		
		// Add debit data
		data.add(debitNames);
		
		// Need to figure out percentages
		debitTotal = debitTotal * -1;
		
		for (int i = 0; i < debitSums.size(); i++) {
			double percent = ((new BigDecimal(debitSums.get(i)).doubleValue() * -1) / debitTotal) * 100;
			debitSums.set(i, new BigDecimal(percent).setScale(2, RoundingMode.HALF_EVEN).toString());
		}
		
		data.add(debitSums);
		data.add(debitColors);
		
		// Add credit Data
		data.add(creditNames);
		
		for (int i = 0; i < creditSums.size(); i++) {
			double percent = ((new BigDecimal(creditSums.get(i)).doubleValue()) / creditTotal) * 100;
			creditSums.set(i, new BigDecimal(percent).setScale(2, RoundingMode.HALF_EVEN).toString());
		}
		
		data.add(creditSums);
		data.add(creditColors);
		
		LOG.debug("Chart Data (Transaction By Category): " + data.toString());
		
		return data;
	}
	
	/*
	 * Get Credit vs Debit Summary Data
	 */
	public List<List<String>> getChartDataCreditVsDebit(Users user) {
		
		// Use Calendar to shift the date back 3 months for transactions 
		GregorianCalendar monthlyCalendar = new GregorianCalendar();
		monthlyCalendar.setTime(new Date());
		monthlyCalendar.add(Calendar.MONTH, -3);
		
		// Get all of the user accounts
		List<Account> accounts = getAllAccounts(user);
		
		// 2 Dimension Array for data to be returned
		List<List<String>> data = new ArrayList<List<String>>();
		
		// Lists for data to be returned in array
		List<String> names = new ArrayList<String>();
		List<String> credits = new ArrayList<String>();
		List<String> debits = new ArrayList<String>();
		
		// Used for query greater and less than zerp
		BigDecimal zero = new BigDecimal(0);
		
		// For each account, get the data
		for (int i = 0; i < accounts.size(); i++) {
			names.add(accounts.get(i).getName());
			
			// Get Credit Transactions and sum them
			List<AccountTransaction> allCredits = accountTransactionRepository
					.findAllByAccountAndAmountGreaterThanAndTransactionDateAfter(accounts.get(i), zero, monthlyCalendar.getTime());
			
			float sumCredits = 0;
			for (int j = 0; j < allCredits.size(); j++)
				sumCredits += allCredits.get(j).getAmount().floatValue();
			
			credits.add(new BigDecimal(sumCredits).setScale(2, RoundingMode.HALF_EVEN).toString());
			
			// Get debit Transactions and sum them
			List<AccountTransaction> allDebits = accountTransactionRepository
					.findAllByAccountAndAmountLessThanAndTransactionDateAfter(accounts.get(i), zero, monthlyCalendar.getTime());
			
			float sumDebits = 0;
			for (int j = 0; j < allDebits.size(); j++)
				sumDebits += allDebits.get(j).getAmount().floatValue();
			
			debits.add(new BigDecimal(sumDebits * -1).setScale(2, RoundingMode.HALF_EVEN).toString());
					
		}
		
		// Add data to the array
		data.add(names);
		data.add(credits);
		data.add(debits);
		
		return data;
	}
	
	/*
	 * Get Balance Summary Data
	 */
	public List<List<String>> getChartDataAccountBalanceSummary(Users user) {
		
		// Get all of the user accounts
		List<Account> accounts = getAllAccounts(user);
		
		// 2 Dimension Array for data to be returned
		List<List<String>> data = new ArrayList<List<String>>();
		
		// Lists for data to be returned in array
		List<String> names = new ArrayList<String>();
		List<String> balances = new ArrayList<String>();
		
		
		// For each account get the data
		for (int i = 0; i < accounts.size(); i++) {
			names.add(accounts.get(i).getName()); 
			balances.add(accounts.get(i).getCurrentBalance().toString());			
		}
		
		// Add data to the array
		data.add(names);
		data.add(balances);
		
		return data;
	}
	
	
	/*
	 * Create a new account
	 */
	public Account createNewAccount (Account newAccount) {
				
		// Set Account Details
		newAccount.setCurrentBalance(newAccount.getOpeningBalance());
		newAccount.setInterestRate(newAccount.getAccountType().getInterestRate());
		newAccount.setAccountStanding(accountStandingRepository.findByCode(Constants.ACCT_STND_OPEN_CODE));
		
		// Check if Account opening date has been set, if not set it
		if (newAccount.getDateOpened() == null) {
			newAccount.setDateOpened(new Date());
		}
		
		// Create Account
		accountRepository.save(newAccount);

		// Set Initial Transaction
		AccountTransaction accountTransaction = new AccountTransaction();
		accountTransaction.setAmount(newAccount.getOpeningBalance());
		accountTransaction.setDescription(transactionTypeRepository.findByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE).getName());
		accountTransaction.setTransactionDate(newAccount.getDateOpened());
		accountTransaction.setTransactionType(transactionTypeRepository.findByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE));
		accountTransaction.setTransactionCategory(transactionCategoryRepository.findByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
		creditTransaction (newAccount, accountTransaction);
		
		LOG.debug("Create Account: New Account Created.");
				
		return newAccount;
		
	}
	
	/*
	 * Update an Account
	 */
	public Account updateAccount (Account account) {
		accountRepository.save(account);
		
		return account;
	}
	
	/*
	 * Delete an Account
	 */
	public void deleteAccount (Account account) {
		accountRepository.delete(account);
	}
	
	/*
	 * Add a new transaction that will apply a credit to the account.
	 * 
	 * The Account passed in is expected to be a full Account object. With that said,
	 * the account object is fetched to make sure.
	 * 
	 * The AccountTransation is expect to be a partial object. However,
	 * 		the AccountTransaction should have the following values already defined 
	 * 		within the object.
	 * 
	 * 		- Amount of transaction
	 * 		- Transaction Type
	 * 		- Transaction Description
	 */
	public void creditTransaction(Account account, AccountTransaction accountTransaction) {
		
		LOG.debug("Credit Transaction to Account:");
		
		account = this.getAccountById(account.getId());
		BigDecimal balance = account.getCurrentBalance();
		List<AccountTransaction> atl = account.getAcountTransactionList();
		
		// if the list is null, then its the first transaction
		if (atl == null) {
			atl = new ArrayList<AccountTransaction>();
		}
		else { // else we are adding another transaction to the list so calculate the new update
			balance = balance.add(accountTransaction.getAmount());
			account.setCurrentBalance(balance);
		}
		
		LOG.debug("Credit Transaction to Account: Current Number of Transactions: ->" + atl.size());

		// if Category was not set, default to MISC
		if (accountTransaction.getTransactionCategory() == null) {
			accountTransaction.setTransactionCategory(transactionCategoryRepository.findByCode(Constants.ACCT_TRAN_CAT_INC_CODE));
		}
		
		// Check if the date was already set, if not set to current date time.
		if (accountTransaction.getTransactionDate() == null) {
			accountTransaction.setTransactionDate(new Date());
		}
		
		accountTransaction.setRunningBalance(balance);
		accountTransaction.setTransactionState(transactionStateRepository.findByCode(Constants.ACCT_TRAN_ST_COMP_CODE));
		accountTransaction.setAccount(account);
		atl.add(accountTransaction);
		account.setAcountTransactionList(atl);
		
		// Update Account
		accountRepository.save(account);
		
		LOG.debug("Credit Transaction to Account: New Number of Transactions: ->" + atl.size());
		LOG.debug("Credit Transaction to Account: Account Updated.");
		
	}
	
	/*
	 * Add a new transaction that will apply a debit to the account.
	 * 
	 * The Account passed in is expected to be a full Account object. With that said
	 * the account object is fetched to make sure.
	 * 
	 * The AccountTransation is expect to be a partial object. However,
	 * 		the AccountTransaction should have the following values already defined 
	 * 		within the object.
	 * 
	 * 		- Amount of transaction
	 * 		- Transaction Type
	 * 		- Transaction Description
	 */
	public void debitTransaction(Account account, AccountTransaction accountTransaction) {
		
		LOG.debug("Debit Transaction from Account:");
		
		account = this.getAccountById(account.getId());
		
		List<AccountTransaction> atl = account.getAcountTransactionList();
		
		BigDecimal balance = account.getCurrentBalance();
		BigDecimal amount = accountTransaction.getAmount();
		boolean overdraft = false;
		
		// if the withdraw is greater than the balance, charge a fee
		if (amount.compareTo(balance) == 1) {
			overdraft = true;
		}
		
		// Convert amount to a negative number since it is a withdraw
		BigDecimal negOne = new BigDecimal(-1);
		amount = amount.multiply(negOne);	
		balance = balance.add(amount);
		account.setCurrentBalance(balance);
		
		// if Category was not set, default to MISC
		if (accountTransaction.getTransactionCategory() == null) {
			accountTransaction.setTransactionCategory(transactionCategoryRepository.findByCode(Constants.ACCT_TRAN_CAT_MISC_CODE));
		}
		
		// Check if the date was already set, if not set to current date time.
		if (accountTransaction.getTransactionDate() == null) {
			accountTransaction.setTransactionDate(new Date());
		}
		
		accountTransaction.setRunningBalance(balance);
		accountTransaction.setAmount(amount);
		accountTransaction.setTransactionState(transactionStateRepository.findByCode(Constants.ACCT_TRAN_ST_COMP_CODE));
		accountTransaction.setAccount(account);
		atl.add(accountTransaction);
		
		account.setAcountTransactionList(atl);
		
		// Update Account
		accountRepository.save(account);
		
		
		
		// if there is a fee, then add that transaction
		if (overdraft) {
			
			this.overdraftCharge(account, accountTransaction);
		}
	
		
		LOG.debug("Debit Transaction from Account: Account Updated.");
		
	}
	
	/*
	 * Transfer amount between two accounts
	 * 
	 * Accounts should be full objects. With that said, the objects are fetched to make sure.
	 * 
	 * AccountTransaction can be a partial object but must contain the transaction amount.
	 */
	public void transfer(Account fromAccount, Account toAccount, AccountTransaction accountTransaction) {
		
		LOG.debug("Transfer Between Accounts:");
		
		// From Transaction
		fromAccount = this.getAccountById(fromAccount.getId());
		AccountTransaction fromAt = new AccountTransaction();
		fromAt.setAmount(accountTransaction.getAmount());
		fromAt.setTransactionDate(accountTransaction.getTransactionDate());
		fromAt.setDescription("Transfer to Account (" + toAccount.getAccountNumber() + ")");
		fromAt.setTransactionType(transactionTypeRepository.findByCode(Constants.ACCT_TRAN_TYPE_XFER_CODE));
		debitTransaction(fromAccount, fromAt);
		
		// To Transaction
		toAccount = this.getAccountById(toAccount.getId());
		AccountTransaction toAt = new AccountTransaction();
		toAt.setAmount(accountTransaction.getAmount());
		toAt.setTransactionDate(accountTransaction.getTransactionDate());
		toAt.setDescription("Transfer from Account (" + fromAccount.getAccountNumber() + ")");
		toAt.setTransactionType(transactionTypeRepository.findByCode(Constants.ACCT_TRAN_TYPE_XFER_CODE));		
		creditTransaction(toAccount, toAt);
		
		LOG.debug("Transfer Between Accounts: Accounts Updated.");
	}
	
	/*
	 * Get Account object by Id
	 */
	public Account getAccountById(Long id) {
		Optional<Account> act = accountRepository.findById(id);
		
		if (act.isPresent()) {
			return act.get();
		}else {
			return null;
		}
	}
	
	/*
	 * Save Account
	 */
	public Account save (Account account) {
		return accountRepository.save(account);
	}
	
	/*
	 * Get Account Type by Account Type Code
	 */
	public AccountType getAccoutTypeByCode (String code) {
		return accountTypeRepository.findByCode(code);
	}
	
	/*
	 * Helper method to determine Account Type by Category of Checking
	 */
	public boolean isCheckingAccount (Account account) {

		return account.getAccountType().getCategory().equals(Constants.ACCT_CHK_CAT);
		
	}
	
	/*
	 * Helper method to determine Account Type by Category of Savings
	 */
	public boolean isSavingsAccount (Account account) {
		
		return account.getAccountType().getCategory().equals(Constants.ACCT_SAV_CAT);
		
	}
	
	/*
	 * Get all accounts assigned to the user
	 */
	public List<Account> getAllAccounts (Users user) {
		
		List<Account> allAccounts = accountRepository.findByOwner(user);
		allAccounts.addAll(accountRepository.findByCoowner(user));
		
		return allAccounts;
	}
	
	/*
	 * Get all checking accounts assigned to the user
	 */
	public List<Account> getCheckingAccounts (Users user) {
		
		List<Account> checkingAccounts = accountRepository.findByOwnerAndAccountType_Category(user, Constants.ACCT_CHK_CAT);
		checkingAccounts.addAll(accountRepository.findByCoownerAndAccountType_Category(user, Constants.ACCT_CHK_CAT));
		
		return checkingAccounts;
	}
	
	/*
	 * Get all savings accounts assigned to the user
	 */
	public List<Account> getSavingsAccounts (Users user) {
				
		List<Account> savingsAccounts = accountRepository.findByOwnerAndAccountType_Category(user, Constants.ACCT_SAV_CAT);
		savingsAccounts.addAll(accountRepository.findByCoownerAndAccountType_Category(user, Constants.ACCT_SAV_CAT));
						
		return savingsAccounts;
		
	}
	
	/*
	 * Get all accounts for user
	 */
	public List<Account> getAllAccountsUser (Users user){
		List<Account> accounts = accountRepository.findByOwner(user);
		accounts.addAll(accountRepository.findByCoowner(user));
		
		return accounts;
		
	}
	
	public List<Account> getAllAccounts () {
		return accountRepository.findAll();
	}
	
	public List<Account> getCheckingAccounts () {
		return accountRepository.findByAccountType_Category(Constants.ACCT_CHK_CAT);
	}
	
	public List<Account> getSavingsAccounts () {
		return accountRepository.findByAccountType_Category(Constants.ACCT_SAV_CAT);
	}
	
	public OwnershipType getOwnershipTypeIndividual() {
		return ownershipTypeRepository.findByCode(Constants.ACCT_OWN_IND_CODE);
	}
	
	public OwnershipType getOwnershipTypeJoint() {
		return ownershipTypeRepository.findByCode(Constants.ACCT_OWN_JNT_CODE);
	}
	
	public OwnershipType getOwnershipTypeByCode(String code) {
		return ownershipTypeRepository.findByCode(code);
	}
	
	public List<OwnershipType> getOwnershipTypes () {
		return ownershipTypeRepository.findAll();
	}
	
	public List<AccountType> getAccountTypes(){
		return accountTypeRepository.findAll();
	}
	
	public List<AccountType> getCheckingAccountTypes(){
		return accountTypeRepository.findByCategory(Constants.ACCT_CHK_CAT);
	}
	
	public List<AccountType> getSavingsAccountTypes(){
		return accountTypeRepository.findByCategory(Constants.ACCT_SAV_CAT);
	}
	
	public List<AccountStanding> getAccountStanding(){
		return accountStandingRepository.findAll();
	}
	
	public List<TransactionState> getTransactionState(){
		return transactionStateRepository.findAll();
	}
	
	public List<TransactionType> getTransactionType(){
		return transactionTypeRepository.findAll();
	}
	
	public List<TransactionCategory> getTransactionCategory(){
		return transactionCategoryRepository.findAll();
	}
	
	public TransactionType getTransactionTypeByCode (String code) {
		return transactionTypeRepository.findByCode(code);
	}
	
	public TransactionCategory getTransactionCategoryByCode (String code) {
		return transactionCategoryRepository.findByCode(code);
	}
	
	public AccountTransaction getLatestAccountTransaction (Account account) {
		return accountTransactionRepository.findTopByAccountOrderByTransactionDateDesc(account);
	}
	
	public List<AccountTransaction> getLastTwoAccountTransactions (Account account) {
		return accountTransactionRepository.findTop2ByAccountOrderByTransactionDateDesc(account);
	}
	
	public AccountTransaction getAccountTransactionById(Long id) {
		
		Optional<AccountTransaction> transaction = accountTransactionRepository.findById(id);
		
		if (transaction.isPresent()) {
			return transaction.get();
		}else {
			return null;
		}

	}
	
	/*
	 * Creates an Overdraft transaction to apply an overdraft fee
	 */
	private void overdraftCharge (Account account, AccountTransaction offender) {
		
		LOG.debug("Overdraft Charge: Charge fee for overdraft.");
		
		// Add seconds to current date/time to differentiate transactions on sort
		int seconds = 15;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(offender.getTransactionDate());
		calendar.add(Calendar.SECOND, seconds);
		List<AccountTransaction> transList = account.getAcountTransactionList();
		
		AccountTransaction overTrans = new AccountTransaction();
		BigDecimal overFee = account.getAccountType().getOverdraftFee();
		
		// Convert amount to a negative number since it is a debit
		BigDecimal negOne = new BigDecimal(-1);
		overFee = overFee.multiply(negOne);
		
		BigDecimal currentBalance = account.getCurrentBalance();
		BigDecimal updatedBalance = currentBalance.add(overFee);
		account.setCurrentBalance(updatedBalance);
		
		overTrans.setRunningBalance(updatedBalance);
		overTrans.setAmount(overFee);
		overTrans.setDescription("Overdraft Fee for transaction " + offender.getTransactionNumber());
		overTrans.setTransactionCategory(transactionCategoryRepository.findByCode(Constants.ACCT_TRAN_CAT_FEE_CODE));
		overTrans.setTransactionDate(calendar.getTime());
		overTrans.setTransactionState(transactionStateRepository.findByCode(Constants.ACCT_TRAN_ST_COMP_CODE));
		overTrans.setTransactionType(transactionTypeRepository.findByCode(Constants.ACCT_TRAN_TYPE_OVERDRAFT_FEE_CODE));
		overTrans.setAccount(account);
		transList.add(overTrans);
		
		account.setAcountTransactionList(transList);
		
		// Update Account
		accountRepository.save(account);

	}

}
