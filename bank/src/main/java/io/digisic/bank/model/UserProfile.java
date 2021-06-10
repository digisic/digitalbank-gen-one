package io.digisic.bank.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonProperty.Access;

import io.digisic.bank.util.Messages;
import io.digisic.bank.util.Patterns;

@Entity
public class UserProfile {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(nullable=false, updatable=false)
	@JsonProperty (access = Access.READ_ONLY)
	private Long id;
	
	@NotEmpty (message=Messages.USER_FIRST_NAME_REQUIRED)
	private String firstName;
	
	@NotEmpty (message=Messages.USER_LAST_NAME_REQUIRED)
	private String lastName;
	
	@NotEmpty (message=Messages.USER_TITLE_REQUIRED)
	@Pattern(regexp=Patterns.USER_TITLE, message=Messages.USER_TITLE_FORMAT)
	private String title;
	
	@NotEmpty (message=Messages.USER_GENDER_REQUIRED)
	@Pattern(regexp=Patterns.USER_GENDER, message=Messages.USER_GENDER_FORMAT)
	private String gender;
	
	@NotEmpty (message=Messages.USER_SSN_REQUIRED)
	@Pattern(regexp=Patterns.USER_SSN, message=Messages.USER_SSN_FORMAT)
	@Column(nullable=false, unique=true)
	private String ssn;
	  
	@NotNull (message=Messages.USER_DOB_REQUIRED)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
	@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
	private Date dob;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern=Patterns.DATE_FORMAT)
	@DateTimeFormat(pattern=Patterns.DATE_FORMAT)
	private Date dom;
	
	@NotEmpty (message=Messages.USER_EMAIL_REQUIRED)
	@Pattern(regexp=Patterns.USER_EMAIL, message=Messages.USER_EMAIL_FORMAT)
	@Column(nullable=false, unique=true)
	private String emailAddress;
	
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
	
	
	
	// default constructor
	public UserProfile () {}
		
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
	 * @return the dom
	 */
	public Date getDom() {
		return dom;
	}



	/**
	 * @param dom the dom to set
	 */
	public void setDom(Date dom) {
		this.dom = dom;
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
	

	public String toString() {
    
		String userProfile = "\n\nUser Profile ***********************";
    
	    userProfile += "\nId:\t\t\t" 			+ this.getId();
	    userProfile += "\nMemeber Since:\t\t" 	+ this.getDom();
	    userProfile += "\nTitle:\t\t\t" 		+ this.getTitle();
	    userProfile += "\nFrist Name:\t\t" 		+ this.getFirstName();
	    userProfile += "\nLast Name:\t\t" 		+ this.getLastName();
	    userProfile += "\nEmail Address:\t\t" 	+ this.getEmailAddress();
	    userProfile += "\nSSN:\t\t\t" 			+ this.getSsn();
	    userProfile += "\nDOB:\t\t\t" 			+ this.getDob();
	    userProfile += "\nGender:\t\t\t" 		+ this.getGender();
	    userProfile += "\nHome Phone:\t\t" 		+ this.getHomePhone();
	    userProfile += "\nMobile Phone:\t\t" 	+ this.getMobilePhone();
	    userProfile += "\nWork Phone:\t\t" 		+ this.getWorkPhone();
	    userProfile += "\nAddress:\t\t" 		+ this.getAddress();
	    userProfile += "\nLocality:\t\t" 		+ this.getLocality();
	    userProfile += "\nRegion:\t\t\t" 		+ this.getRegion();
	    userProfile += "\nPostal Code:\t\t" 	+ this.getPostalCode();
	    userProfile += "\nCountry:\t\t" 		+ this.getCountry();

	    userProfile += "\n*******************************************\n";
	    
	    return userProfile;
	}
}
