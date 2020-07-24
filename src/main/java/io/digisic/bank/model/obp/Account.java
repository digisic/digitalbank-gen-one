package io.digisic.bank.model.obp;

import java.util.ArrayList;
import java.util.List;

public class Account {
	
	private String id;
	private String label;
	private String bank_id;
	private String number;
	private String product_code;
	AccountBalance balance;
	
	List<Users> owners = new ArrayList<Users>();
	List<Routing> account_routings = new ArrayList<Routing>();
	List<AccountViews> views_available = new ArrayList<AccountViews>();
	List<AccountViews> views_basic = new ArrayList<AccountViews>();
	List<AccountAttributes> account_attributes = new ArrayList<AccountAttributes>();
	List<Tags> tags = new ArrayList<Tags>();

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
	 * @return the label
	 */
	public String getLabel() {
		return label;
	}

	/**
	 * @param label the label to set
	 */
	public void setLabel(String label) {
		this.label = label;
	}

	/**
	 * @return the bank_id
	 */
	public String getBank_id() {
		return bank_id;
	}

	/**
	 * @param bank_id the bank_id to set
	 */
	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}

	/**
	 * @return the views_available
	 */
	public List<AccountViews> getViews_available() {
		return views_available;
	}

	/**
	 * @param views_available the views_available to set
	 */
	public void setViews_available(List<AccountViews> views_available) {
		this.views_available = views_available;
	}

	/**
	 * @return the number
	 */
	public String getNumber() {
		return number;
	}

	/**
	 * @param number the number to set
	 */
	public void setNumber(String number) {
		this.number = number;
	}

	/**
	 * @return the product_code
	 */
	public String getProduct_code() {
		return product_code;
	}

	/**
	 * @param product_code the product_code to set
	 */
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	/**
	 * @return the balance
	 */
	public AccountBalance getBalance() {
		return balance;
	}

	/**
	 * @param balance the balance to set
	 */
	public void setBalance(AccountBalance balance) {
		this.balance = balance;
	}

	/**
	 * @return the owners
	 */
	public List<Users> getOwners() {
		return owners;
	}

	/**
	 * @param owners the owners to set
	 */
	public void setOwners(List<Users> owners) {
		this.owners = owners;
	}

	/**
	 * @return the account_routings
	 */
	public List<Routing> getAccount_routings() {
		return account_routings;
	}

	/**
	 * @param account_routings the account_routings to set
	 */
	public void setAccount_routings(List<Routing> account_routings) {
		this.account_routings = account_routings;
	}

	/**
	 * @return the views_basic
	 */
	public List<AccountViews> getViews_basic() {
		return views_basic;
	}

	/**
	 * @param views_basic the views_basic to set
	 */
	public void setViews_basic(List<AccountViews> views_basic) {
		this.views_basic = views_basic;
	}

	/**
	 * @return the account_attributes
	 */
	public List<AccountAttributes> getAccount_attributes() {
		return account_attributes;
	}

	/**
	 * @param account_attributes the account_attributes to set
	 */
	public void setAccount_attributes(List<AccountAttributes> account_attributes) {
		this.account_attributes = account_attributes;
	}

	/**
	 * @return the tags
	 */
	public List<Tags> getTags() {
		return tags;
	}

	/**
	 * @param tags the tags to set
	 */
	public void setTags(List<Tags> tags) {
		this.tags = tags;
	}
	
}
