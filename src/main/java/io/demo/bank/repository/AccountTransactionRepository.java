package io.demo.bank.repository;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.Account;
import io.demo.bank.model.AccountTransaction;
import io.demo.bank.model.TransactionCategory;


public interface AccountTransactionRepository extends CrudRepository<AccountTransaction, Long> {
	
	public List<AccountTransaction> findAllByAccount (Account account);
	public AccountTransaction findTopByAccountOrderByTransactionDateDesc (Account account);
	public List<AccountTransaction> findTop2ByAccountOrderByTransactionDateDesc (Account account);
	
	public List<AccountTransaction> findAllByAccountAndAmountGreaterThan (Account account, BigDecimal amount);
	public List<AccountTransaction> findAllByAccountAndAmountLessThan (Account account, BigDecimal amount);
	
	public List<AccountTransaction> findAllByAccountAndAmountGreaterThanAndTransactionDateAfter (Account account, BigDecimal amount, Date date);
	public List<AccountTransaction> findAllByAccountAndAmountLessThanAndTransactionDateAfter (Account account, BigDecimal amount, Date date);
	
	public List<AccountTransaction> findByAccountAndTransactionCategory (Account account, TransactionCategory category);
	public List<AccountTransaction> findByAccountAndTransactionCategoryAndTransactionDateAfter (Account account, TransactionCategory category, Date date);

}
