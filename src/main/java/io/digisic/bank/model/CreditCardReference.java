package io.digisic.bank.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

import io.digisic.bank.util.Patterns;

@Entity
public class CreditCardReference {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name="id", nullable=false, updatable=false)
	private Long id;
	
	private Long bankUserId;
	private Long creditUserId;
	private Long applicationId;
	private Long creditCardId;
	private String creditScore;
	private String riskScore;
	private String applicationStatus;
	private String accountStatus;
	private String applicationNumber;
	private String correlationId;
	
	@Column(length = 1024)
	private String applicationStatusDetail;
	
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
	@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
	private Date applicationDate;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
	@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
	private Date accountOpenDate;

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
	 * @return the applicationId
	 */
	public Long getApplicationId() {
		return applicationId;
	}

	/**
	 * @param applicationId the applicationId to set
	 */
	public void setApplicationId(Long applicationId) {
		this.applicationId = applicationId;
	}

	/**
	 * @return the creditCardId
	 */
	public Long getCreditCardId() {
		return creditCardId;
	}

	/**
	 * @param creditCardId the creditCardId to set
	 */
	public void setCreditCardId(Long creditCardId) {
		this.creditCardId = creditCardId;
	}

	/**
	 * @return the applicationStatus
	 */
	public String getApplicationStatus() {
		return applicationStatus;
	}

	/**
	 * @param applicationStatus the applicationStatus to set
	 */
	public void setApplicationStatus(String applicationStatus) {
		this.applicationStatus = applicationStatus;
	}

	/**
	 * @return the accountStatus
	 */
	public String getAccountStatus() {
		return accountStatus;
	}

	/**
	 * @param accountStatus the accountStatus to set
	 */
	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	/**
	 * @return the applicationDate
	 */
	public Date getApplicationDate() {
		return applicationDate;
	}

	/**
	 * @param applicationDate the applicationDate to set
	 */
	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	/**
	 * @return the accountOpenDate
	 */
	public Date getAccountOpenDate() {
		return accountOpenDate;
	}

	/**
	 * @param accountOpenDate the accountOpenDate to set
	 */
	public void setAccountOpenDate(Date accountOpenDate) {
		this.accountOpenDate = accountOpenDate;
	}

	/**
	 * @return the correlationId
	 */
	public String getCorrelationId() {
		return correlationId;
	}

	/**
	 * @param correlationId the correlationId to set
	 */
	public void setCorrelationId(String correlationId) {
		this.correlationId = correlationId;
	}

	/**
	 * @return the applicationNumber
	 */
	public String getApplicationNumber() {
		return applicationNumber;
	}

	/**
	 * @param applicationNumber the applicationNumber to set
	 */
	public void setApplicationNumber(String applicationNumber) {
		this.applicationNumber = applicationNumber;
	}

	/**
	 * @return the creditScore
	 */
	public String getCreditScore() {
		return creditScore;
	}

	/**
	 * @param creditScore the creditScore to set
	 */
	public void setCreditScore(String creditScore) {
		this.creditScore = creditScore;
	}

	/**
	 * @return the riskScore
	 */
	public String getRiskScore() {
		return riskScore;
	}

	/**
	 * @param riskScore the riskScore to set
	 */
	public void setRiskScore(String riskScore) {
		this.riskScore = riskScore;
	}

	/**
	 * @return the applicationStatusDetail
	 */
	public String getApplicationStatusDetail() {
		return applicationStatusDetail;
	}

	/**
	 * @param applicationStatusDetail the applicationStatusDetail to set
	 */
	public void setApplicationStatusDetail(String applicationStatusDetail) {
		this.applicationStatusDetail = applicationStatusDetail;
	}
	
}
