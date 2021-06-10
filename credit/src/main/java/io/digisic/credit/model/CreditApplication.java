package io.digisic.credit.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.PositiveOrZero;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import io.digisic.credit.util.Messages;
import io.digisic.credit.util.Patterns;

@Entity
public class CreditApplication {
	
	// Message Correlation
	private String correlationId;
	
	// Banking Status
	public static final String BK_ST_CHK_AND_SAV 		= "Checking and Savings";
	public static final String BK_ST_CHK_ONLY 			= "Checking Only";
	public static final String BK_ST_SAV_ONLY 			= "Savings Only";
	public static final String BK_ST_NEITHER 			= "Neither";
	
	// Employment Status
	public static final String EMP_ST_EMPLOYED 			= "Employed";
	public static final String EMP_ST_SELF_EMPLOYED 	= "Self-Employed";
	public static final String EMP_ST_RETIRED 			= "Retired";
	public static final String EMP_ST_STUDENT 			= "Student";
	public static final String EMP_ST_UNEMPLOYED 		= "Unemployed";
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false, updatable=false)
	@JsonProperty (access = Access.READ_ONLY)
	private Long id;
	
	@OneToOne (cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "application_number")
	@JsonProperty (access = Access.READ_ONLY)
	private ApplicationNumberSeq applicationNumber;
	
	@JsonProperty (access = Access.READ_ONLY)
	private String applicationStatus;
	
	@JsonProperty (access = Access.READ_ONLY)
	@Column(length = 1024)
	private String applicationStatusDetails;
	
	@JsonProperty (access = Access.READ_ONLY)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
	@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
	private Date applicationDate;
	
	@JsonProperty (access = Access.READ_ONLY)
	private Long userId;
	
	// Personal Info
	@NotEmpty (message=Messages.USER_FIRST_NAME_REQUIRED)
	private String firstName;
	
	@NotEmpty (message=Messages.USER_LAST_NAME_REQUIRED)
	private String lastName;
	
	@NotEmpty (message=Messages.USER_SSN_REQUIRED)
	@Pattern(regexp=Patterns.USER_SSN, message=Messages.USER_SSN_FORMAT)
	private String ssn;
	
	@NotNull (message=Messages.USER_DOB_REQUIRED)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
	@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
	private Date dob;
	
	@NotEmpty (message=Messages.USER_TITLE_REQUIRED)
	@Pattern(regexp=Patterns.USER_TITLE, message=Messages.USER_TITLE_FORMAT)
	private String title;
	
	@NotEmpty (message=Messages.USER_GENDER_REQUIRED)
	@Pattern(regexp=Patterns.USER_GENDER, message=Messages.USER_GENDER_FORMAT)
	private String gender;
	
	// Contact Info
	@NotEmpty (message=Messages.USER_PHONE_HOME_REQUIRED)
	@Pattern(regexp=Patterns.USER_PHONE_REQ, message=Messages.USER_PHONE_HOME_FORMAT)
	private String homePhone;
	
	@Pattern(regexp=Patterns.USER_PHONE_NOT_REQ, message=Messages.USER_PHONE_MOBILE_FORMAT)
	private String mobilePhone;
	
	@Pattern(regexp=Patterns.USER_PHONE_NOT_REQ, message=Messages.USER_PHONE_WORK_FORMAT)
	private String workPhone;
	
	@NotEmpty (message=Messages.USER_ADDRESS_REQUIRED)
	private String address;
	
	@NotEmpty (message=Messages.USER_LOCALITY_REQUIRED)
	private String locality;
	
	@NotEmpty (message=Messages.USER_REGION_REQUIRED)
	private String region;
	
	@NotEmpty (message=Messages.USER_POSTAL_CODE_REQUIRED)
	private String postalCode;
	
	@NotEmpty (message=Messages.USER_COUNTRY_REQUIRED)
	private String country;
	
	@NotEmpty (message=Messages.USER_EMAIL_REQUIRED)
	@Pattern(regexp=Patterns.USER_EMAIL, message=Messages.USER_EMAIL_FORMAT)
	private String emailAddress;
	
	// Financial Info
	@NotEmpty (message=Messages.APP_EMP_STATUS_REQUIRED)
	@Pattern(regexp=Patterns.APP_EMP_STATUS, message=Messages.APP_EMP_STATUS_FORMAT)
	private String employmentStatus;
	
	@NotEmpty (message=Messages.APP_BANK_STATUS_REQUIRED)
	@Pattern(regexp=Patterns.APP_BANK_STATUS, message=Messages.APP_BANK_STATUS_FORMAT)
	private String bankStatus;
	
	@PositiveOrZero (message=Messages.APP_ANNUAL_INCOME)
	private BigDecimal annualIncome;
	
	@PositiveOrZero (message=Messages.APP_MONTHLY_MORTGAGE)
	private BigDecimal monthlyMortgage;
	
	@PositiveOrZero (message=Messages.APP_MONTHLY_AUTO_LOAN)
	private BigDecimal monthlyAutoLoan;
	
	@PositiveOrZero (message=Messages.APP_MONTHLY_CREDIT_CARD)
	private BigDecimal minimumCreditCard;
	
	@PositiveOrZero (message=Messages.APP_MONTHLY_OTHER_LOAN)
	private BigDecimal monthlyOtherLoan;
	
	private BigDecimal monthlySpend = BigDecimal.ZERO;
	private boolean cashAdvance = false;
	private boolean balanceTransfer = false;
	
	@AssertTrue (message=Messages.APP_AGREE_TERMS)
	private boolean agreeTerms;
	
	@JsonProperty (access = Access.READ_ONLY)
	private Long riskScore;
	
	@JsonProperty (access = Access.READ_ONLY)
	private Long creditScore;
	
	@JsonProperty (access = Access.READ_ONLY)
	private Long approvedCardId;
	
	/*
	 * Empty Application
	 */
	public CreditApplication(){
		applicationNumber = new ApplicationNumberSeq();
	}
	
	/*
	 * Pre-filled Application
	 */
	public CreditApplication(UserProfile profile){
		
		applicationNumber = new ApplicationNumberSeq();
		firstName = profile.getFirstName();
		lastName = profile.getLastName();
		ssn = profile.getSsn();
		dob = profile.getDob();
		homePhone = profile.getHomePhone();
		workPhone = profile.getWorkPhone();
		mobilePhone = profile.getMobilePhone();
		address = profile.getAddress();
		locality = profile.getLocality();
		region = profile.getRegion();
		postalCode = profile.getPostalCode();
		emailAddress = profile.getEmailAddress();
	}
	
	
	/**
	 * @return the applicationNumber
	 */
	public Long getApplicationNumber() {
		return applicationNumber.getId();
	}

	/**
	 * @return the employmentStatus
	 */
	public String getEmploymentStatus() {
		return employmentStatus;
	}
	/**
	 * @param employmentStatus the employmentStatus to set
	 */
	public void setEmploymentStatus(String employmentStatus) {
		this.employmentStatus = employmentStatus;
	}
	/**
	 * @return the bankStatus
	 */
	public String getBankStatus() {
		return bankStatus;
	}
	/**
	 * @param bankStatus the bankStatus to set
	 */
	public void setBankStatus(String bankStatus) {
		this.bankStatus = bankStatus;
	}
	/**
	 * @return the annualIncome
	 */
	public BigDecimal getAnnualIncome() {
		return annualIncome;
	}
	/**
	 * @param annualIncome the annualIncome to set
	 */
	public void setAnnualIncome(BigDecimal annualIncome) {
		this.annualIncome = annualIncome;
	}
	/**
	 * @return the monthlyMortgage
	 */
	public BigDecimal getMonthlyMortgage() {
		return monthlyMortgage;
	}
	/**
	 * @param monthlyMortgage the monthlyMortgage to set
	 */
	public void setMonthlyMortgage(BigDecimal monthlyMortgage) {
		this.monthlyMortgage = monthlyMortgage;
	}
	/**
	 * @return the monthlySpend
	 */
	public BigDecimal getMonthlySpend() {
		return monthlySpend;
	}
	/**
	 * @param monthlySpend the monthlySpend to set
	 */
	public void setMonthlySpend(BigDecimal monthlySpend) {
		this.monthlySpend = monthlySpend;
	}
	/**
	 * @return the cashAdvance
	 */
	public boolean isCashAdvance() {
		return cashAdvance;
	}
	/**
	 * @param cashAdvance the cashAdvance to set
	 */
	public void setCashAdvance(boolean cashAdvance) {
		this.cashAdvance = cashAdvance;
	}
	/**
	 * @return the balanceTransfer
	 */
	public boolean isBalanceTransfer() {
		return balanceTransfer;
	}
	/**
	 * @param balanceTransfer the balanceTransfer to set
	 */
	public void setBalanceTransfer(boolean balanceTransfer) {
		this.balanceTransfer = balanceTransfer;
	}
	/**
	 * @return the agreeTerms
	 */
	public boolean isAgreeTerms() {
		return agreeTerms;
	}
	/**
	 * @param agreeTerms the agreeTerms to set
	 */
	public void setAgreeTerms(boolean agreeTerms) {
		this.agreeTerms = agreeTerms;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return the ssn
	 */
	public String getSsn() {
		return ssn;
	}
	/**
	 * @param ssn the ssn to set
	 */
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	/**
	 * @return the dob
	 */
	public Date getDob() {
		return dob;
	}
	/**
	 * @param dob the dob to set
	 */
	public void setDob(Date dob) {
		this.dob = dob;
	}
	/**
	 * @return the homePhone
	 */
	public String getHomePhone() {
		return homePhone;
	}
	/**
	 * @param homePhone the homePhone to set
	 */
	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}
	/**
	 * @return the workPhone
	 */
	public String getWorkPhone() {
		return workPhone;
	}
	/**
	 * @param workPhone the workPhone to set
	 */
	public void setWorkPhone(String workPhone) {
		this.workPhone = workPhone;
	}
	/**
	 * @return the mobilePhone
	 */
	public String getMobilePhone() {
		return mobilePhone;
	}
	/**
	 * @param mobilePhone the mobilePhone to set
	 */
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * @return the locality
	 */
	public String getLocality() {
		return locality;
	}
	/**
	 * @param locality the locality to set
	 */
	public void setLocality(String locality) {
		this.locality = locality;
	}
	/**
	 * @return the region
	 */
	public String getRegion() {
		return region;
	}
	/**
	 * @param region the region to set
	 */
	public void setRegion(String region) {
		this.region = region;
	}
	/**
	 * @return the postalCode
	 */
	public String getPostalCode() {
		return postalCode;
	}
	/**
	 * @param postalCode the postalCode to set
	 */
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}
	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}
	/**
	 * @return the emailAddress
	 */
	public String getEmailAddress() {
		return emailAddress;
	}
	/**
	 * @param emailAddress the emailAddress to set
	 */
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
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
	 * @return the applicationStatus
	 */
	public String getApplicationStatus() {
		return applicationStatus;
	}

	/**
	 * @param applicationStatus the applicationStatus to set
	 */
	@JsonIgnore
	public void setApplicationStatus(String applicationStatus) {
		this.applicationStatus = applicationStatus;
	}

	/**
	 * @return the userId
	 */
	public Long getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
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
	@JsonIgnore
	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	/**
	 * @return the monthlyAutoLoan
	 */
	public BigDecimal getMonthlyAutoLoan() {
		return monthlyAutoLoan;
	}

	/**
	 * @param monthlyAutoLoan the monthlyAutoLoan to set
	 */
	public void setMonthlyAutoLoan(BigDecimal monthlyAutoLoan) {
		this.monthlyAutoLoan = monthlyAutoLoan;
	}

	/**
	 * @return the minimumCreditCard
	 */
	public BigDecimal getMinimumCreditCard() {
		return minimumCreditCard;
	}

	/**
	 * @param minimumCreditCard the minimumCreditCard to set
	 */
	public void setMinimumCreditCard(BigDecimal minimumCreditCard) {
		this.minimumCreditCard = minimumCreditCard;
	}

	/**
	 * @return the monthlyOtherLoan
	 */
	public BigDecimal getMonthlyOtherLoan() {
		return monthlyOtherLoan;
	}

	/**
	 * @param monthlyOtherLoan the monthlyOtherLoan to set
	 */
	public void setMonthlyOtherLoan(BigDecimal monthlyOtherLoan) {
		this.monthlyOtherLoan = monthlyOtherLoan;
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
	 * @return the riskScore
	 */
	public Long getRiskScore() {
		return riskScore;
	}

	/**
	 * @param riskScore the riskScore to set
	 */
	public void setRiskScore(Long riskScore) {
		this.riskScore = riskScore;
	}

	/**
	 * @return the creditScore
	 */
	public Long getCreditScore() {
		return creditScore;
	}

	/**
	 * @param creditScore the creditScore to set
	 */
	public void setCreditScore(Long creditScore) {
		this.creditScore = creditScore;
	}

	/**
	 * @return the applicationStatusDetails
	 */
	public String getApplicationStatusDetails() {
		return applicationStatusDetails;
	}

	/**
	 * @param applicationStatusDetails the applicationStatusDetails to set
	 */
	public void setApplicationStatusDetails(String applicationStatusDetails) {
		this.applicationStatusDetails = applicationStatusDetails;
	}

	/**
	 * @return the approvedCardId
	 */
	public Long getApprovedCardId() {
		return approvedCardId;
	}

	/**
	 * @param approvedCardId the approvedCardId to set
	 */
	public void setApprovedCardId(Long approvedCardId) {
		this.approvedCardId = approvedCardId;
	}
	
}
