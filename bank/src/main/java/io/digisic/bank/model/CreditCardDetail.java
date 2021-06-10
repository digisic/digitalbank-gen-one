package io.digisic.bank.model;

import java.math.BigDecimal;

public class CreditCardDetail {
	
	private Long id;
	private String cardNumber;
	private String dateExpire;
	private String dateValid;
	private String cvv;
	private BigDecimal creditLimit;
	private BigDecimal apr;
	private BigDecimal currentBalance;
	private BigDecimal availableBalance;
	
	/*
	 * Default Constructor
	 */
	public CreditCardDetail () {}
	
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
	public BigDecimal getCreditLimit() {
		return creditLimit;
	}
	/**
	 * @param limit the limit to set
	 */
	public void setCreditLimit(BigDecimal limit) {
		this.creditLimit = limit;
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
	/**
	 * @return the currentBalance
	 */
	public BigDecimal getCurrentBalance() {
		return currentBalance;
	}

	/**
	 * @param currentBalance the currentBalance to set
	 */
	public void setCurrentBalance(BigDecimal currentBalance) {
		this.currentBalance = currentBalance;
	}

	/**
	 * @return the availableBalance
	 */
	public BigDecimal getAvailableBalance() {
		return availableBalance;
	}

	/**
	 * @param availableBalance the availableBalance to set
	 */
	public void setAvailableBalance(BigDecimal availableBalance) {
		this.availableBalance = availableBalance;
	}

	@Override
	public String toString() {
		return "CreditCardDetail [id=" + id + ", cardNumber=" + cardNumber
				+ ", dateExpire=" + dateExpire + ", dateValid=" + dateValid + ", cvv=" + cvv + ", creditLimit="
				+ creditLimit + ", apr=" + apr + "]";
	}
	
	
	
}
