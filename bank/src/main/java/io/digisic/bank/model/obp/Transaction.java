package io.digisic.bank.model.obp;


public class Transaction {
	
	private String id;
	private AccountSelf this_account;
	private AccountOther other_account;
	private TransactionDetail details;
	
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the this_account
	 */
	public AccountSelf getThis_account() {
		return this_account;
	}
	/**
	 * @param this_account the this_account to set
	 */
	public void setThis_account(AccountSelf this_account) {
		this.this_account = this_account;
	}
	/**
	 * @return the other_account
	 */
	public AccountOther getOther_account() {
		return other_account;
	}
	/**
	 * @param other_account the other_account to set
	 */
	public void setOther_account(AccountOther other_account) {
		this.other_account = other_account;
	}
	/**
	 * @return the details
	 */
	public TransactionDetail getDetails() {
		return details;
	}
	/**
	 * @param details the details to set
	 */
	public void setDetails(TransactionDetail details) {
		this.details = details;
	}
	
	
}
