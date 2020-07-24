package io.digisic.bank.model;

import java.math.BigDecimal;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

import io.digisic.bank.util.Patterns;

public class CreditCardApplication {
	
	// Personal Info
	private String firstName;
	private String lastName;
	private String title;
	private String gender;
	private String ssn;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
	@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
	private Date dob;
	
	// Contact Info
	private String homePhone;
	private String workPhone;
	private String mobilePhone;
	private String address;
	private String locality;
	private String region;
	private String postalCode;
	private String country;
	private String emailAddress;
	
	// Financial Info
	private String employmentStatus;
	private String bankStatus;
	private BigDecimal annualIncome;
	private BigDecimal monthlyMortgage;
	private BigDecimal monthlyAutoLoan;
	private BigDecimal monthlyOtherLoan;
	private BigDecimal minimumCreditCard;
	private BigDecimal monthlySpend;
	private boolean cashAdvance;
	private boolean balanceTransfer;
	private boolean agreeTerms;
	
	/*
	 * Empty Application
	 */
	public CreditCardApplication(){}
	
	/*
	 * Prefilled Application
	 */
	public CreditCardApplication(UserProfile profile){
		
		this.firstName = profile.getFirstName();
		this.lastName = profile.getLastName();
		this.gender = profile.getGender();
		this.title = profile.getTitle();
		this.ssn = profile.getSsn();
		this.dob = profile.getDob();
		this.homePhone = profile.getHomePhone();
		this.workPhone = profile.getWorkPhone();
		this.mobilePhone = profile.getMobilePhone();
		this.address = profile.getAddress();
		this.locality = profile.getLocality();
		this.region = profile.getRegion();
		this.country = profile.getCountry();
		this.postalCode = profile.getPostalCode();
		this.emailAddress = profile.getEmailAddress();
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

	public String toString() {
	    
		String app = "*** Credit Application ***********************";
    
		app += "\n\n*** Personal Information ***********************";
		app += "\nTitle:\t\t\t" 		+ this.getTitle();
	    app += "\nFrist Name:\t\t" 		+ this.getFirstName();
	    app += "\nLast Name:\t\t" 		+ this.getLastName();
	    app += "\nEmail Address:\t\t" 	+ this.getEmailAddress();
	    app += "\nSSN:\t\t\t" 			+ this.getSsn();
	    app += "\nDOB:\t\t\t" 			+ this.getDob();
	    app += "\nGender:\t\t\t" 		+ this.getGender();
	    
	    app += "\n*** Contact Information ***********************";
	    app += "\nHome Phone:\t\t" 		+ this.getHomePhone();
	    app += "\nMobile Phone:\t\t" 	+ this.getMobilePhone();
	    app += "\nWork Phone:\t\t" 		+ this.getWorkPhone();
	    app += "\nAddress:\t\t" 		+ this.getAddress();
	    app += "\nLocality:\t\t" 		+ this.getLocality();
	    app += "\nRegion:\t\t\t" 		+ this.getRegion();
	    app += "\nPostal Code:\t\t" 	+ this.getPostalCode();
	    app += "\nCountry:\t\t" 		+ this.getCountry();
	    
	    app += "\n***Financial Information ***********************";
	    app += "\nBank Status:\t\t" 						+ this.getBankStatus();
	    app += "\nEmployment Status:\t" 					+ this.getEmploymentStatus();
	    app += "\nAnnual Income:\t\t" 						+ this.getAnnualIncome();
	    app += "\nMonthly Mortgage:\t"						+ this.getMonthlyMortgage();
	    app += "\nMonthly Car Loan:\t"						+ this.getMonthlyAutoLoan();
	    app += "\nMonthly Other Loans:\t"					+ this.getMonthlyOtherLoan();
	    app += "\nMonthly Mimimum Credit Card Payments:\t"	+ this.getMinimumCreditCard();
	    app += "\nMonthly Spend:\t\t" 						+ this.getMonthlySpend();

	    app += "\n*******************************************\n";
	    
	    return app;
	}
	
}
