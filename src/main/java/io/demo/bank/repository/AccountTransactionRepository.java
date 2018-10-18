package io.demo.bank.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import io.demo.bank.model.Account;
import io.demo.bank.model.AccountTransaction;

public interface AccountTransactionRepository extends CrudRepository<AccountTransaction, Long> {
	
	
	@Query ("select coalesce(max(transactionNumber), 10000000) from AccountTransaction")
	Long findMaxTransactionNumber();
	
	public List<AccountTransaction> findAllByAccount (Account account);


}
