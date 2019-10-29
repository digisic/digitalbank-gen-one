package io.demo.bank.test.junit.service;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.any;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.Spy;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;

import io.demo.bank.model.Account;
import io.demo.bank.model.AccountTransaction;
import io.demo.bank.model.TransactionCategory;
import io.demo.bank.model.TransactionState;
import io.demo.bank.model.TransactionType;
import io.demo.bank.model.security.User;
import io.demo.bank.repository.AccountTransactionRepository;
import io.demo.bank.service.AccountService;

@ContextConfiguration(classes = AccountService.class)
@SpringBootTest
@RunWith(MockitoJUnitRunner.class)
public class AccountServiceTests {

	@Spy
	@Autowired
	private AccountService acctSvc;

	@Mock
	@Autowired
	private AccountTransactionRepository acctTranxRepoMock;

	@Before
	public void setup() {
		acctSvc.setAccountTransactionRepository(acctTranxRepoMock);
	}

	@Test
	public void getChartDataTransactionByCategoryTest() {
		// Initialize data for this particular test
		User user = new User("AlexP", "test123");

		Account acct = new Account(new BigDecimal(200.0), new BigDecimal(200.0), 7.5, 10.00, 72);

		List<AccountTransaction> acctTranxList = new ArrayList<>();
		TransactionCategory shoppingTranxCtgy = new TransactionCategory("789", "Online Shopping");
		createAndAddShoppingPurchaseAcctTranx(acct, acctTranxList, shoppingTranxCtgy);

		// Initialize Mockito return objects
		List<Account> acctList = new ArrayList<>();
		acctList.add(acct);

		List<TransactionCategory> tranxCtgyList = new ArrayList<>();
		tranxCtgyList.add(shoppingTranxCtgy);

		// Set up Mockito hooks
		doReturn(acctList).when(acctSvc).getAllAccounts(user);
		doReturn(tranxCtgyList).when(acctSvc).getTransactionCategory();
		doReturn(acctTranxList).when(acctTranxRepoMock).findByAccountAndTransactionCategoryAndTransactionDateAfter(
				any(Account.class), any(TransactionCategory.class), any(Date.class));

		// Execute method under test
		List<List<String>> tranxByCategory = acctSvc.getChartDataTransactionByCategory(user);

		// Assertions
		System.out.println(tranxByCategory);
		assertNotNull(tranxByCategory);
	}

	private void createAndAddShoppingPurchaseAcctTranx(Account acct, List<AccountTransaction> acctTranxList,
			TransactionCategory shoppingTranxCtgy) {
		AccountTransaction acctTranx = new AccountTransaction(12345L, "tranx desc", new BigDecimal(15.0),
				new BigDecimal(185.0), 56789L, new Date(), acct,
				new TransactionType("123", "Purchase", "Online Shopping"), new TransactionState("456", "Pending"),
				shoppingTranxCtgy);
		acctTranxList.add(acctTranx);
		acct.setAcountTransactionList(acctTranxList);
	}

}
