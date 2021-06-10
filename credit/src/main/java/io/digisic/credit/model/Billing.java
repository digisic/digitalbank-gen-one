package io.digisic.credit.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

@Entity
public class Billing {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false, updatable=false)
	@JsonProperty (access = Access.READ_ONLY)
	private Long id;
	
	@JsonFormat(pattern="yyyy-MM-dd'T'hh:mm")
	@DateTimeFormat(pattern="yyyy-MM-dd'T'hh:mm")
	private Date lastStatementDate;
	
	@JsonFormat(pattern="yyyy-MM-dd'T'hh:mm")
	@DateTimeFormat(pattern="yyyy-MM-dd'T'hh:mm")
	private Date paymentDueDate;
	
	@JsonFormat(pattern="yyyy-MM-dd'T'hh:mm")
	@DateTimeFormat(pattern="yyyy-MM-dd'T'hh:mm")
	private Date lastPaymentDate;
	
	@JsonIgnore
	@OneToOne
    @JoinColumn(name = "card_id")
    private CreditCard card; 
	
	private BigDecimal minimumPaymentDue;
	private BigDecimal lastStatmentBalance;
	private BigDecimal lastPaymentMade;
	
	/*
	 * Default Constructor
	 */
	public Billing() {}
	
	/*
	 * Constructor
	 */
	public Billing (CreditCard card) {
		this.card = card;
	}
	
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
	 * @return the card
	 */
	public CreditCard getCard() {
		return card;
	}
	/**
	 * @param card the card to set
	 */
	public void setCard(CreditCard card) {
		this.card = card;
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
	
	

}
