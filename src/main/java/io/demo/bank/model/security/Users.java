package io.demo.bank.model.security;

import java.util.Collection;
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
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import com.fasterxml.jackson.annotation.JsonIgnore;

import io.demo.bank.model.Account;
import io.demo.bank.model.UserProfile;


@Entity
public class Users implements UserDetails {
	

	private static final long serialVersionUID = -1173435728882792083L;

	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", nullable = false, updatable = false)
    private Long id;
    private String username;
    private String password;

    private boolean enabled = true;
    private boolean accountNotExpired = true;
    private boolean accountNotLocked = true;
    private boolean credentialNotExpired = true;
    
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name="profile_id")
    private UserProfile userProfile;
    
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonIgnore
    private Set<UserRole> userRoles = new HashSet<>();
    
    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="owner_id")
    private List<Account> ownerAccounts;
    
    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="coowner_id")
    private List<Account> coownerAccounts;
       
    public Users () {}
    
    public Users (String username, String password) {
    	this.username = username;
    	this.password = password;
    }
    
    	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		Set<GrantedAuthority> authorities = new HashSet<>();
        userRoles.forEach(ur -> authorities.add(new Authority(ur.getRole().getName())));
        
        return authorities;
	}
	

	@Override
	public String getPassword() {
		
		return password;
	}

	@Override
	public String getUsername() {
		
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return accountNotExpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		
		return accountNotLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		
		return credentialNotExpired;
	}

	@Override
	public boolean isEnabled() {
		
		return enabled;
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
	 * @param accountNotExpired the accountNotExpired to set
	 */
	public void setAccountNotExpired(boolean accountNotExpired) {
		this.accountNotExpired = accountNotExpired;
	}

	/**
	 * @param accountNotLocked the accountNotLocked to set
	 */
	public void setAccountNotLocked(boolean accountNotLocked) {
		this.accountNotLocked = accountNotLocked;
	}

	/**
	 * @param credentialNotExpired the credentialNotExpired to set
	 */
	public void setCredentialNotExpired(boolean credentialNotExpired) {
		this.credentialNotExpired = credentialNotExpired;
	}

	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @param enabled the enabled to set
	 */
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	/**
	 * @return the userProfile
	 */
	public UserProfile getUserProfile() {
		return userProfile;
	}

	/**
	 * @param userProfile the userProfile to set
	 */
	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	/**
	 * @return the userRoles
	 */
	public Set<UserRole> getUserRoles() {
		return userRoles;
	}

	/**
	 * @param userRoles the userRoles to set
	 */
	public void setUserRoles(Set<UserRole> userRoles) {
		this.userRoles = userRoles;
	}

	
	/**
	 * @return the ownerAccounts
	 */
	public List<Account> getOwnerAccounts() {
		return ownerAccounts;
	}

	/**
	 * @param ownerAccounts the ownerAccounts to set
	 */
	public void setOwnerAccounts(List<Account> ownerAccounts) {
		this.ownerAccounts = ownerAccounts;
	}

	/**
	 * @return the coownerAccounts
	 */
	public List<Account> getCoownerAccounts() {
		return coownerAccounts;
	}

	/**
	 * @param coownerAccounts the coownerAccounts to set
	 */
	public void setCoownerAccounts(List<Account> coownerAccounts) {
		this.coownerAccounts = coownerAccounts;
	}

	public String toString() {
	    
		String user = "\n\nUser Profile ***********************";
	    
	    user += "\nId:\t\t\t" 					+ this.getId();
	    user += "\nUser Name:\t\t" 				+ this.getUsername();
	    user += "\nPassword:\t\t" 				+ this.getPassword();
	    user += "\nEnabled:\t\t" 				+ this.isEnabled();
	    user += "\nNot Locked:\t\t" 			+ this.isAccountNonLocked();
	    user += "\nNot Expired:\t\t" 			+ this.isAccountNonExpired();
	    user += "\nCredential Not Expired:\t" 	+ this.isCredentialsNonExpired();
	    user += "\n" 							+ this.getUserProfile();

	    user += "\n*******************************************\n";
    
	    return user;
	}
	
}
