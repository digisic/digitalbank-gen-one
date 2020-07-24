package io.digisic.bank.model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;
import io.digisic.bank.model.security.Users;

@Entity
public class Account {
		
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name="id", nullable=false, updatable=false)
	private Long id;
	private String name;
	
	@OneToOne (cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "account_number")
	@JsonProperty (access = Access.READ_ONLY)
	private AccountNumberSeq accountNumber;
	
	private BigDecimal currentBalance;
	private BigDecimal openingBalance;
	private double interestRate;
	private double paymentAmount;
	private int paymentTerm;
	
	@OneToOne (fetch = FetchType.EAGER)
	private AccountType accountType;
	
	@OneToOne (fetch = FetchType.EAGER)
	private OwnershipType ownershipType;
		
	@OneToOne (fetch = FetchType.EAGER)
	private AccountStanding accountStanding;
	
	@JsonFormat(pattern="yyyy-MM-dd'T'hh:mm")
	@DateTimeFormat(pattern="yyyy-MM-dd'T'hh:mm")
	private Date dateOpened;
	
	@JsonFormat(pattern="yyyy-MM-dd'T'hh:mm")
	@DateTimeFormat(pattern="yyyy-MM-dd'T'hh:mm")
	private Date dateClosed;
	
	@JsonFormat(pattern="yyyy-MM-dd'T'hh:mm")
	@DateTimeFormat(pattern="yyyy-MM-dd'T'hh:mm")
	private Date paymentDue;
	
	@JsonIgnore
	@ManyToOne (fetch = FetchType.EAGER)
	private Users owner;
	
	@JsonIgnore
	@ManyToOne (fetch = FetchType.EAGER)
	private Users coowner;
	
	@OneToMany(mappedBy = "account", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("transaction_date DESC")
    @JsonIgnore
    private List<AccountTransaction> acountTransactionList;
	
	
	/*
	 * Constructor
	 */
	public Account () {
		accountNumber = new AccountNumberSeq();
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the accountNumber
	 */
	public Long getAccountNumber() {
		return accountNumber.getId();
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
		this.currentBalance = new BigDecimal(currentBalance.doubleValue()).setScale(2, RoundingMode.HALF_UP);
	}

	/**
	 * @return the openingBalance
	 */
	public BigDecimal getOpeningBalance() {
		return openingBalance;
	}

	/**
	 * @param openingBalance the openingBalance to set
	 */
	public void setOpeningBalance(BigDecimal openingBalance) {
		this.openingBalance = new BigDecimal(openingBalance.doubleValue()).setScale(2, RoundingMode.HALF_UP);
	}

	/**
	 * @return the interestRate
	 */
	public double getInterestRate() {
		return interestRate;
	}

	/**
	 * @param interestRate the interestRate to set
	 */
	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	/**
	 * @return the paymentAmount
	 */
	public double getPaymentAmount() {
		return paymentAmount;
	}

	/**
	 * @param paymentAmount the paymentAmount to set
	 */
	public void setPaymentAmount(double paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	/**
	 * @return the paymentTerm
	 */
	public int getPaymentTerm() {
		return paymentTerm;
	}

	/**
	 * @param paymentTerm the paymentTerm to set
	 */
	public void setPaymentTerm(int paymentTerm) {
		this.paymentTerm = paymentTerm;
	}

	/**
	 * @return the accountType
	 */
	public AccountType getAccountType() {
		return accountType;
	}

	/**
	 * @param accountType the accountType to set
	 */
	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}

	/**
	 * @return the standing
	 */
	public AccountStanding getAccountStanding() {
		return accountStanding;
	}

	/**
	 * @param standing the standing to set
	 */
	public void setAccountStanding(AccountStanding accountStanding) {
		this.accountStanding = accountStanding;
	}

	/**
	 * @return the dateOpened
	 */
	public Date getDateOpened() {
		return dateOpened;
	}

	/**
	 * @param dateOpened the dateOpened to set
	 */
	public void setDateOpened(Date dateOpened) {
		this.dateOpened = dateOpened;
	}

	/**
	 * @return the dateClosed
	 */
	public Date getDateClosed() {
		return dateClosed;
	}

	/**
	 * @param dateClosed the dateClosed to set
	 */
	public void setDateClosed(Date dateClosed) {
		this.dateClosed = dateClosed;
	}

	/**
	 * @return the paymentDue
	 */
	public Date getPaymentDue() {
		return paymentDue;
	}

	/**
	 * @param payementDue the paymentDue to set
	 */
	public void setPaymentDue(Date paymentDue) {
		this.paymentDue = paymentDue;
	}

	/**
	 * @return the acountTransactionList
	 */
	public List<AccountTransaction> getAcountTransactionList() {
		return acountTransactionList;
	}
	
	/**
	 * @param acountTransactionList the acountTransactionList to set
	 */
	public void setAcountTransactionList(List<AccountTransaction> acountTransactionList) {
		this.acountTransactionList = acountTransactionList;
	}

	/**
	 * @return the ownershipType
	 */
	public OwnershipType getOwnershipType() {
		return ownershipType;
	}

	/**
	 * @param ownershipType the ownershipType to set
	 */
	public void setOwnershipType(OwnershipType ownershipType) {
		this.ownershipType = ownershipType;
	}

	/**
	 * @return the owner
	 */
	public Users getOwner() {
		return owner;
	}

	/**
	 * @param owner the owner to set
	 */
	public void setOwner(Users owner) {
		this.owner = owner;
	}

	/**
	 * @return the coowner
	 */
	public Users getCoowner() {
		return coowner;
	}

	/**
	 * @param coowner the coowner to set
	 */
	public void setCoowner(Users coowner) {
		this.coowner = coowner;
	}


	public String toString() {
	    
		String account = "\n\nAccount ***********************";
    
		account += "\nId:\t\t\t" 		+ this.getId();
		account += "\nName:\t\t" 		+ this.getName();
		account += "\nType:\t\t\t" 		+ this.getAccountType();
	    
	    return account;
	    
	}
	
}
