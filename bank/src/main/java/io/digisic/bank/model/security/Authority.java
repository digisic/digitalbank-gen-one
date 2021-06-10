package io.digisic.bank.model.security;

import org.springframework.security.core.GrantedAuthority;

public class Authority implements GrantedAuthority {
  
	private static final long serialVersionUID = -1181614711533143961L;
  
	private final String authority;
  
	public Authority(String authority) {
		this.authority = authority;
	}

	/**
	 * @return the authority
	 */
	public String getAuthority() {
		return authority;
	}
  
}
