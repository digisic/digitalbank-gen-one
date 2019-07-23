package io.demo.bank.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

import io.demo.bank.util.Patterns;

@Entity
public class CreditReference {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name="id", nullable=false, updatable=false)
	private Long id;
	
	private Long bankUserId;
	private Long creditUserId;
	private Long appId;
	private Long acctId;
	private String appStatus;
	private String acctStatus;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
	@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
	private Date appDate;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
	@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
	private Date acctOpenDate;

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
	 * @return the bankUserId
	 */
	public Long getBankUserId() {
		return bankUserId;
	}

	/**
	 * @param bankUserId the bankUserId to set
	 */
	public void setBankUserId(Long bankUserId) {
		this.bankUserId = bankUserId;
	}

	/**
	 * @return the creditUserId
	 */
	public Long getCreditUserId() {
		return creditUserId;
	}

	/**
	 * @param creditUserId the creditUserId to set
	 */
	public void setCreditUserId(Long creditUserId) {
		this.creditUserId = creditUserId;
	}

	/**
	 * @return the appId
	 */
	public Long getAppId() {
		return appId;
	}

	/**
	 * @param appId the appId to set
	 */
	public void setAppId(Long appId) {
		this.appId = appId;
	}

	/**
	 * @return the acctId
	 */
	public Long getAcctId() {
		return acctId;
	}

	/**
	 * @param acctId the acctId to set
	 */
	public void setAcctId(Long acctId) {
		this.acctId = acctId;
	}

	/**
	 * @return the appStatus
	 */
	public String getAppStatus() {
		return appStatus;
	}

	/**
	 * @param appStatus the appStatus to set
	 */
	public void setAppStatus(String appStatus) {
		this.appStatus = appStatus;
	}

	/**
	 * @return the acctStatus
	 */
	public String getAcctStatus() {
		return acctStatus;
	}

	/**
	 * @param acctStatus the acctStatus to set
	 */
	public void setAcctStatus(String acctStatus) {
		this.acctStatus = acctStatus;
	}

	/**
	 * @return the appDate
	 */
	public Date getAppDate() {
		return appDate;
	}

	/**
	 * @param appDate the appDate to set
	 */
	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	/**
	 * @return the acctOpenDate
	 */
	public Date getAcctOpenDate() {
		return acctOpenDate;
	}

	/**
	 * @param acctOpenDate the acctOpenDate to set
	 */
	public void setAcctOpenDate(Date acctOpenDate) {
		this.acctOpenDate = acctOpenDate;
	}
	
}
