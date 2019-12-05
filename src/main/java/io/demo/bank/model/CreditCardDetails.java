package io.demo.bank.model;

import java.math.BigDecimal;

public class CreditCardDetails {
	
	private Long id;
	private String cardNumber;
	private Long accountId;
	private String dateExpire;
	private String dateValid;
	private String cvv;
	private BigDecimal limit;
	private BigDecimal apr;
	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * @return the cardNumber
	 */
	public String getCardNumber() {
		return cardNumber;
	}
	/**
	 * @param cardNumber the cardNumber to set
	 */
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	/**
	 * @return the accountId
	 */
	public Long getAccountId() {
		return accountId;
	}
	/**
	 * @param accountId the accountId to set
	 */
	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}
	/**
	 * @return the dateExpire
	 */
	public String getDateExpire() {
		return dateExpire;
	}
	/**
	 * @param dateExpire the dateExpire to set
	 */
	public void setDateExpire(String dateExpire) {
		this.dateExpire = dateExpire;
	}
	/**
	 * @return the dateValid
	 */
	public String getDateValid() {
		return dateValid;
	}
	/**
	 * @param dateValid the dateValid to set
	 */
	public void setDateValid(String dateValid) {
		this.dateValid = dateValid;
	}
	/**
	 * @return the cvv
	 */
	public String getCvv() {
		return cvv;
	}
	/**
	 * @param cvv the cvv to set
	 */
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	/**
	 * @return the limit
	 */
	public BigDecimal getLimit() {
		return limit;
	}
	/**
	 * @param limit the limit to set
	 */
	public void setLimit(BigDecimal limit) {
		this.limit = limit;
	}
	/**
	 * @return the apr
	 */
	public BigDecimal getApr() {
		return apr;
	}
	/**
	 * @param apr the apr to set
	 */
	public void setApr(BigDecimal apr) {
		this.apr = apr;
	}
	
}
