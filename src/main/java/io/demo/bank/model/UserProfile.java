package io.demo.bank.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
public class UserProfile {
	
	private static final Logger LOG = LoggerFactory.getLogger(UserProfile.class);
  
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(name="id", nullable=false, updatable=false)
	private Long id;
	private String firstName;
	private String lastName;
	private String title;
	private String gender;
	  
	@Column(name="ssn", nullable=false, unique=true)
	private String ssn;
	  
	@JsonFormat(pattern="MM/dd/yyyy")
	@DateTimeFormat(pattern="MM/dd/yyyy")
	private Date dob;
	  
	@JsonFormat(pattern="MM/dd/yyyy")
	@DateTimeFormat(pattern="MM/dd/yyyy")
	private Date dom;
	
	@Column(name="emailAddress", nullable=false, unique=true)
	private String emailAddress;
	private String homePhone;
	private String mobilePhone;
	private String workPhone;
	private String address;
	private String locality;
	private String region;
	private String postalCode;
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
