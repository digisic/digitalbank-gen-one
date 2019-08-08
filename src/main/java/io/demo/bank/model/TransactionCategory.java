package io.demo.bank.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TransactionCategory {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name="id", nullable=false, updatable=false)
	private Long id;
	
	private String name;
	private String code;
	private boolean checking;
	private boolean savings;
	private boolean credit;
	
	public TransactionCategory() {}
	
	public TransactionCategory(String code, 
							   String name, 
							   boolean checking,
							   boolean savings,
							   boolean credit) {
		this.code = code;
		this.name = name;
		this.checking = checking;
		this.savings = savings;
		this.credit = credit;
		
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
	 * @return the code
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}

	/**
	 * @return the checking
	 */
	public boolean isChecking() {
		return checking;
	}

	/**
	 * @param checking the checking to set
	 */
	public void setChecking(boolean checking) {
		this.checking = checking;
	}

	/**
	 * @return the savings
	 */
	public boolean isSavings() {
		return savings;
	}

	/**
	 * @param savings the savings to set
	 */
	public void setSavings(boolean savings) {
		this.savings = savings;
	}

	/**
	 * @return the credit
	 */
	public boolean isCredit() {
		return credit;
	}

	/**
	 * @param credit the credit to set
	 */
	public void setCredit(boolean credit) {
		this.credit = credit;
	}

}
