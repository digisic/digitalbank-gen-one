package io.demo.bank.config;

import io.demo.bank.service.UserSecurityService;
import io.demo.bank.util.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity(debug=false)
@EnableGlobalMethodSecurity(prePostEnabled=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter
{
	@Autowired
	private UserSecurityService userSecurityService;

	private static final String[] PUBLIC = {
		
			Constants.URI_WEBJARS_RES, 
	    	Constants.URI_CSS_RES, 
	    	Constants.URI_SCSS_RES, 
	    	Constants.URI_FONTS_RES, 
	    	Constants.URI_JS_RES, 
	    	Constants.URI_IMAGES_RES, 
	    	Constants.URI_REGISTER, 
	    	Constants.URI_ABOUT_RES, 
	    	Constants.URI_CONTACT_RES, 
	    	Constants.URI_ERROR_RES,
	    	Constants.URI_ROOT,
	    	Constants.URI_SIGNUP
	};
  
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
  
	protected void configure(HttpSecurity http) throws Exception {
    
		http
			.authorizeRequests()
			.antMatchers(PUBLIC).permitAll()
			.anyRequest().authenticated();
    
		http
			.csrf().disable()
			.cors().disable()
			.formLogin().failureUrl(Constants.URI_LOGIN_ERR).defaultSuccessUrl(Constants.URI_HOME)
			.loginPage(Constants.URI_LOGIN).permitAll()
			.and()
			.logout().logoutRequestMatcher(new AntPathRequestMatcher(Constants.URI_LOGOUT)).logoutSuccessUrl(Constants.URI_LOGOUT_SUCC)
			.deleteCookies(Constants.COO_JSESSION_ID).permitAll()
			.and()
			.rememberMe().key(Constants.COO_REMEBER_ME).tokenValiditySeconds(86400);
		
		http.headers().frameOptions().disable();
  }
  
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userSecurityService).passwordEncoder(encoder());
	}
}
