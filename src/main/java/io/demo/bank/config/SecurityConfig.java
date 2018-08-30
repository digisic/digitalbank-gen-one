package io.demo.bank.config;

import io.demo.bank.service.UserSecurityService;
import io.demo.bank.util.Mappings;
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
		
			Mappings.URI_WEBJARS_RES, 
	    	Mappings.URI_CSS_RES, 
	    	Mappings.URI_SCSS_RES, 
	    	Mappings.URI_FONTS_RES, 
	    	Mappings.URI_JS_RES, 
	    	Mappings.URI_IMAGES_RES, 
	    	Mappings.URI_REGISTER, 
	    	Mappings.URI_ABOUT_RES, 
	    	Mappings.URI_CONTACT_RES, 
	    	Mappings.URI_ERROR_RES,
	    	Mappings.URI_ROOT,
	    	Mappings.URI_SIGNUP
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
			.formLogin().failureUrl(Mappings.URI_LOGIN_ERR).defaultSuccessUrl(Mappings.URI_HOME)
			.loginPage(Mappings.URI_LOGIN).permitAll()
			.and()
			.logout().logoutRequestMatcher(new AntPathRequestMatcher(Mappings.URI_LOGOUT)).logoutSuccessUrl(Mappings.URI_LOGOUT_SUCC)
			.deleteCookies(Mappings.COO_REMEBER_ME).permitAll()
			.and()
			.rememberMe();
  }
  
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userSecurityService).passwordEncoder(encoder());
	}
}
