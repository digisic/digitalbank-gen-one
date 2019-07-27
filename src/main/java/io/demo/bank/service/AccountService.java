package io.demo.bank.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import io.demo.bank.model.Account;
import io.demo.bank.model.AccountStanding;
import io.demo.bank.model.AccountTransaction;
import io.demo.bank.model.AccountType;
import io.demo.bank.model.OwnershipType;
import io.demo.bank.model.TransactionState;
import io.demo.bank.model.TransactionType;
import io.demo.bank.model.security.Users;
import io.demo.bank.repository.AccountRepository;
import io.demo.bank.repository.AccountStandingRepository;
import io.demo.bank.repository.AccountTransactionRepository;
import io.demo.bank.repository.AccountTypeRepository;
import io.demo.bank.repository.OwnershipTypeRepository;
import io.demo.bank.repository.TransactionStateRepository;
import io.demo.bank.repository.TransactionTypeRepository;
import io.demo.bank.util.Constants;

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
	
	
	/*
	 * Create a new account
	 */
	public Account createNewAccount (Account newAccount) {
		
		Long lastAccountNumber = accountRepository.findMaxAccountNumber();
		
		// Set Account Details
		newAccount.setAccountNumber(++lastAccountNumber);
		newAccount.setCurrentBalance(newAccount.getOpeningBalance());
		newAccount.setDateOpened(new Date());
		newAccount.setInterestRate(newAccount.getAccountType().getInterestRate());
		newAccount.setAccountStanding(accountStandingRepository.findByCode(Constants.ACCT_STND_OPEN_CODE));

		// Set Initial Transaction
		List<AccountTransaction> atl = new ArrayList<AccountTransaction>();
		AccountTransaction accountTransaction = new AccountTransaction();
		
		long transactionNumber = accountTransactionRepository.findMaxTransactionNumber();
		accountTransaction.setTransactionNumber(++transactionNumber);
		accountTransaction.setAmount(newAccount.getOpeningBalance());
		accountTransaction.setRunningBalance(newAccount.getOpeningBalance());
		accountTransaction.setDescription("Initial Deposit - Open Account");
		accountTransaction.setTransactionDate(new Date());
		accountTransaction.setTransactionState(transactionStateRepository.findByCode(Constants.ACCT_TRAN_ST_COMP_CODE));
		accountTransaction.setTransactionType(transactionTypeRepository.findByCode(Constants.ACCT_TRAN_TYPE_DEPOSIT_CODE));
		accountTransaction.setAccount(newAccount);
		
		atl.add(accountTransaction);
		newAccount.setAcountTransactionList(atl);
		
		// Create Account
		accountRepository.save(newAccount);
		
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
		
		List<AccountTransaction> atl = account.getAcountTransactionList();
		
		LOG.debug("Credit Transaction to Account: Current Number of Transactions: ->" + atl.size());
		
		BigDecimal balance = account.getCurrentBalance();
		
		LOG.debug("Credit Transaction to Account: Current Balance: ->" + balance);
		
		balance = balance.add(accountTransaction.getAmount());
		
		LOG.debug("Credit Transaction to Account: Updated Balance: ->" + balance);
		
		account.setCurrentBalance(balance);
		
		
		long transactionNumber = accountTransactionRepository.findMaxTransactionNumber();
		accountTransaction.setTransactionNumber(++transactionNumber);
		accountTransaction.setRunningBalance(balance);
		accountTransaction.setTransactionDate(new Date());
		accountTransaction.setTransactionState(transactionStateRepository.findByCode(Constants.ACCT_TRAN_ST_COMP_CODE));
		accountTransaction.setAccount(account);
		atl.add(accountTransaction);
		
		LOG.debug("Credit Transaction to Account: New Number of Transactions: ->" + atl.size());
		
		account.setAcountTransactionList(atl);
		
		// Update Account
		accountRepository.save(account);
		
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
		
		long transactionNumber = accountTransactionRepository.findMaxTransactionNumber();
		accountTransaction.setTransactionNumber(++transactionNumber);
		accountTransaction.setRunningBalance(balance);
		accountTransaction.setAmount(amount);
		accountTransaction.setTransactionDate(new Date());
		accountTransaction.setTransactionState(transactionStateRepository.findByCode(Constants.ACCT_TRAN_ST_COMP_CODE));
		accountTransaction.setAccount(account);
		atl.add(accountTransaction);
		
		account.setAcountTransactionList(atl);
		
		// Update Account
		accountRepository.save(account);
		
		
		
		// if there is a fee, then add that transaction
		if (overdraft) {
			
			this.overdraftCharge(account);
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
		
		fromAccount = this.getAccountById(fromAccount.getId());
		toAccount = this.getAccountById(toAccount.getId());
		
		List<AccountTransaction> fromAtl = fromAccount.getAcountTransactionList();
		List<AccountTransaction> toAtl = toAccount.getAcountTransactionList();
		
		BigDecimal fromBalance = fromAccount.getCurrentBalance();
		BigDecimal toBalance = toAccount.getCurrentBalance();
		
		BigDecimal fromAmount = accountTransaction.getAmount();
		BigDecimal toAmount = accountTransaction.getAmount();
		
		// Convert fromAmount to a negative number since it is a withdraw
		BigDecimal negOne = new BigDecimal(-1);
		fromAmount = fromAmount.multiply(negOne);
		
		fromBalance = fromBalance.add(fromAmount);
		toBalance = toBalance.add(toAmount);
		
		fromAccount.setCurrentBalance(fromBalance);
		toAccount.setCurrentBalance(toBalance);
		
		// From Transaction
		AccountTransaction fromAt = new AccountTransaction();
		long transactionNumber = accountTransactionRepository.findMaxTransactionNumber();
		fromAt.setTransactionNumber(++transactionNumber);
		fromAt.setRunningBalance(fromBalance);
		fromAt.setAmount(fromAmount);
		fromAt.setDescription("Transfer to Account (" + toAccount.getAccountNumber() + ")");
		fromAt.setTransactionDate(new Date());
		fromAt.setTransactionState(transactionStateRepository.findByCode(Constants.ACCT_TRAN_ST_COMP_CODE));
		fromAt.setTransactionType(transactionTypeRepository.findByCode(Constants.ACCT_TRAN_TYPE_XFER_CODE));
		fromAt.setAccount(fromAccount);
		fromAtl.add(fromAt);
		
		// To Transaction
		AccountTransaction toAt = new AccountTransaction();
		transactionNumber = accountTransactionRepository.findMaxTransactionNumber();
		toAt.setTransactionNumber(++transactionNumber);
		toAt.setRunningBalance(toBalance);
		toAt.setAmount(toAmount);
		toAt.setDescription("Transfer from Account (" + fromAccount.getAccountNumber() + ")");
		toAt.setTransactionDate(new Date());
		toAt.setTransactionState(transactionStateRepository.findByCode(Constants.ACCT_TRAN_ST_COMP_CODE));
		toAt.setTransactionType(transactionTypeRepository.findByCode(Constants.ACCT_TRAN_TYPE_XFER_CODE));
		toAt.setAccount(toAccount);
		toAtl.add(toAt);
		
		fromAccount.setAcountTransactionList(fromAtl);
		toAccount.setAcountTransactionList(toAtl);
		
		accountRepository.save(fromAccount);
		accountRepository.save(toAccount);
		
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
	
	public TransactionType getTransactionTypeByCode (String code) {
		return transactionTypeRepository.findByCode(code);
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
	private void overdraftCharge (Account account) {
		
		LOG.debug("Overdraft Charge: Charge fee for overdraft.");
		
		// Add seconds to current date/time to differentiate transactions on sort
		int seconds = 15;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
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
		
		long transactionNumber = accountTransactionRepository.findMaxTransactionNumber();
		overTrans.setTransactionNumber(++transactionNumber);
		overTrans.setRunningBalance(updatedBalance);
		overTrans.setAmount(overFee);
		overTrans.setDescription("Overdraft Fee");
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
