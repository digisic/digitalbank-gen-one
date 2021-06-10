package io.digisic.bank.security;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import io.digisic.bank.exception.RestInvalidArguementException;

public class JwtTokenFilter extends OncePerRequestFilter {

	private JwtTokenProvider jwtTokenProvider;

	  public JwtTokenFilter(JwtTokenProvider jwtTokenProvider) {
	    this.jwtTokenProvider = jwtTokenProvider;
	  }

	  @Override
	  protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
	    
		  String token = jwtTokenProvider.resolveToken(httpServletRequest);
	    
		  try {
			  
			  if (token != null && jwtTokenProvider.validateToken(token)) {
				  Authentication auth = jwtTokenProvider.getAuthentication(token);
				  SecurityContextHolder.getContext().setAuthentication(auth);
			  }
	    } catch (RestInvalidArguementException ex) {
	    	
	      // this is very important, since it guarantees the user is not authenticated at all
	      SecurityContextHolder.clearContext();
	      
	      httpServletResponse.sendError(HttpStatus.BAD_REQUEST.value(), ex.getMessage());
	      
	      return;
	    }

	    filterChain.doFilter(httpServletRequest, httpServletResponse);
	  }

}
