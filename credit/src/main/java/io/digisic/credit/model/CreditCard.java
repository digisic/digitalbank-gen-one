package io.digisic.credit.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.validation.constraints.Digits;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import io.digisic.credit.model.security.Users;

@Entity
public class CreditCard {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false, updatable=false)
	@JsonProperty (access = Access.READ_ONLY)
	private Long id;
	
	@Column(nullable=false, unique=true)
	private String cardNumber;
	
	@OneToOne(fetch=FetchType.EAGER)
	private Account account;
	
	@JsonIgnore
	@OneToOne(fetch=FetchType.EAGER)
	private Users cardHolder;
	
	@JsonIgnore
	@OnDelete(action = OnDeleteAction.CASCADE)
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private Set<AuthorizedUsers> authorizedUsers = new HashSet<>();
	
	@Digits(integer=4, fraction=0)
	private Long dateValid;
	
	@Digits(integer=4, fraction=0)
	private Long dateExpire;
	
	@Digits(integer=3, fraction=0)
	private Long cvv;
	
	private BigDecimal creditLimit;
	private BigDecimal apr;
	private BigDecimal currentBalance;
	private BigDecimal availableBalance;
	
	@OnDelete(action = OnDeleteAction.CASCADE)
	@OneToMany(mappedBy = "card", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@OrderBy("transaction_date DESC")
    @JsonIgnore
    private List<CreditTransaction> creditTransactionList;
	

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
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
	 * @return the account
	 */
	public Account getAccount() {
		return account;
	}

	/**
	 * @param account the account to set
	 */
	public void setAccount(Account account) {
		this.account = account;
	}

	/**
	 * @return the cardHolder
	 */
	public Users getCardHolder() {
		return cardHolder;
	}

	/**
	 * @param cardHolder the cardHolder to set
	 */
	public void setCardHolder(Users cardHolder) {
		this.cardHolder = cardHolder;
	}

	/**
	 * @return the authorizedUsers
	 */
	public Set<AuthorizedUsers> getAuthorizedUsers() {
		return authorizedUsers;
	}

	/**
	 * @param authorizedUsers the authorizedUsers to set
	 */
	public void setAuthorizedUsers(Set<AuthorizedUsers> authorizedUsers) {
		this.authorizedUsers = authorizedUsers;
	}

	/**
	 * @return the dateValid
	 */
	public Long getDateValid() {
		return dateValid;
	}

	/**
	 * @param dateValid the dateValid to set
	 */
	public void setDateValid(Long dateValid) {
		this.dateValid = dateValid;
	}

	/**
	 * @return the dateExpire
	 */
	public Long getDateExpire() {
		return dateExpire;
	}

	/**
	 * @param dateExpire the dateExpire to set
	 */
	public void setDateExpire(Long dateExpire) {
		this.dateExpire = dateExpire;
	}

	/**
	 * @return the cvv
	 */
	public Long getCvv() {
		return cvv;
	}

	/**
	 * @param cvv the cvv to set
	 */
	public void setCvv(Long cvv) {
		this.cvv = cvv;
	}

	/**
	 * @return the creditLimit
	 */
	public BigDecimal getCreditLimit() {
		return creditLimit;
	}

	/**
	 * @param creditLimit the creditLimit to set
	 */
	public void setCreditLimit(BigDecimal creditLimit) {
		this.creditLimit = creditLimit;
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

	/**
	 * @return the creditTransactionList
	 */
	public List<CreditTransaction> getCreditTransactionList() {
		return creditTransactionList;
	}

	/**
	 * @param creditTransactionList the creditTransactionList to set
	 */
	public void setCreditTransactionList(List<CreditTransaction> creditTransactionList) {
		this.creditTransactionList = creditTransactionList;
	}
		
}
