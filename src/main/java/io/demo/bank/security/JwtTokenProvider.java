package io.demo.bank.security;

import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import io.demo.bank.exception.RestInvalidArguementException;
import io.demo.bank.model.security.Role;
import io.demo.bank.service.UserSecurityService;
import io.demo.bank.util.Constants;
import io.demo.bank.util.Messages;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JwtTokenProvider {
	
	private String secretKey = Constants.API_SECRET;
	
	// Token expiration -> 1 hour (3600000)
	private long validityInMilliseconds = 3600000;
	
	@Autowired
	private UserSecurityService userSecurityService;
	  
	@PostConstruct
	protected void init() {
		secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
	}
	
	/*
	 * Create Token
	 */
	public String createToken(String username, List<Role> roles) {
	
		Claims claims = Jwts.claims().setSubject(username);
	    claims.put("auth", roles.stream().map(s -> new SimpleGrantedAuthority(s.getName())).filter(Objects::nonNull).collect(Collectors.toList()));
	
	    Date now = new Date();
	    Date validity = new Date(now.getTime() + validityInMilliseconds);
	
	    return Jwts.builder()
	        .setClaims(claims)
	        .setIssuedAt(now)
	        .setExpiration(validity)
	        .signWith(SignatureAlgorithm.HS256, secretKey)
	        .compact();
	}
	
	/*
	 * Get Authentication
	 */
	public Authentication getAuthentication(String token) {
		
		UserDetails userDetails = userSecurityService.loadUserByUsername(getUsername(token));
	    
		return new UsernamePasswordAuthenticationToken(userDetails, "", userDetails.getAuthorities());
	}
	
	/*
	 * Get Username
	 */
	public String getUsername(String token) {
	    
		return Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token).getBody().getSubject();
	}
	
	/*
	 * Resolve Token 
	 */
	public String resolveToken(HttpServletRequest req) {
	
		String bearerToken = req.getHeader(Constants.API_AUTH_HEADER);
	
		if (bearerToken != null && bearerToken.startsWith(Constants.API_TOKEN_BEGIN)) {
			return bearerToken.substring(7);
	    }
	   
		return null;
	}
	
	/*
	 * Validate Token  
	 */
	public boolean validateToken(String token) {
		  
		try {
			  
			Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
			return true;
			  
	    } catch (JwtException | IllegalArgumentException e) {
	    	
	    	throw new RestInvalidArguementException (Messages.API_INVALID_TOKEN);
	    }
	}
	
}
