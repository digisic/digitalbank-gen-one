package io.digisic.bank.model;

import java.math.BigDecimal;
import java.util.Date;

public class CreditCardBillingDetail {
	
	private Long id;
	private Date lastStatementDate;
	private Date paymentDueDate;
	private Date lastPaymentDate;
	private BigDecimal minimumPaymentDue;
	private BigDecimal lastStatmentBalance;
	private BigDecimal lastPaymentMade;
	
	/*
	 * Default Constructor
	 */
	public CreditCardBillingDetail() {}

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
	 * @return the lastStatementDate
	 */
	public Date getLastStatementDate() {
		return lastStatementDate;
	}

	/**
	 * @param lastStatementDate the lastStatementDate to set
	 */
	public void setLastStatementDate(Date lastStatementDate) {
		this.lastStatementDate = lastStatementDate;
	}

	/**
	 * @return the paymentDueDate
	 */
	public Date getPaymentDueDate() {
		return paymentDueDate;
	}

	/**
	 * @param paymentDueDate the paymentDueDate to set
	 */
	public void setPaymentDueDate(Date paymentDueDate) {
		this.paymentDueDate = paymentDueDate;
	}

	/**
	 * @return the lastPaymentDate
	 */
	public Date getLastPaymentDate() {
		return lastPaymentDate;
	}

	/**
	 * @param lastPaymentDate the lastPaymentDate to set
	 */
	public void setLastPaymentDate(Date lastPaymentDate) {
		this.lastPaymentDate = lastPaymentDate;
	}

	/**
	 * @return the minimumPaymentDue
	 */
	public BigDecimal getMinimumPaymentDue() {
		return minimumPaymentDue;
	}

	/**
	 * @param minimumPaymentDue the minimumPaymentDue to set
	 */
	public void setMinimumPaymentDue(BigDecimal minimumPaymentDue) {
		this.minimumPaymentDue = minimumPaymentDue;
	}

	/**
	 * @return the lastStatmentBalance
	 */
	public BigDecimal getLastStatmentBalance() {
		return lastStatmentBalance;
	}

	/**
	 * @param lastStatmentBalance the lastStatmentBalance to set
	 */
	public void setLastStatmentBalance(BigDecimal lastStatmentBalance) {
		this.lastStatmentBalance = lastStatmentBalance;
	}

	/**
	 * @return the lastPaymentMade
	 */
	public BigDecimal getLastPaymentMade() {
		return lastPaymentMade;
	}

	/**
	 * @param lastPaymentMade the lastPaymentMade to set
	 */
	public void setLastPaymentMade(BigDecimal lastPaymentMade) {
		this.lastPaymentMade = lastPaymentMade;
	}

	@Override
	public String toString() {
		return "CreditCardBillingDetail [id=" + id + ", lastStatementDate=" + lastStatementDate + ", paymentDueDate="
				+ paymentDueDate + ", lastPaymentDate=" + lastPaymentDate + ", minimumPaymentDue=" + minimumPaymentDue
				+ ", lastStatmentBalance=" + lastStatmentBalance + ", lastPaymentMade=" + lastPaymentMade + "]";
	}
	
	
	
}
