package io.digisic.bank.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import io.digisic.bank.security.JwtTokenFilterConfigurer;
import io.digisic.bank.security.JwtTokenProvider;
import io.digisic.bank.service.UserSecurityService;
import io.digisic.bank.util.Constants;
import io.digisic.bank.util.Patterns;

@Configuration
@EnableWebSecurity(debug=false)
@EnableGlobalMethodSecurity(prePostEnabled=true)
public class MultiHttpSecurityConfig {

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
	    	Constants.URI_SIGNUP,
	    	Constants.URI_H2_CONSOLE,
	    	Constants.URI_SWAGGER_UI,
	    	Constants.URI_SWAGGER_V2,
	    	Constants.URI_SWAGGER_RES,
	    	Constants.URI_SWAGGER_CONF,
	    	Constants.URI_MANAGER_RES,
	    	Constants.URI_FAVICON_RES
	    	
	};
  
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
		
	@Configuration
    @Order(1)                                                        
    public static class ApiWebSecurityConfigurationAdapter extends WebSecurityConfigurerAdapter {
		
		@Autowired
		private JwtTokenProvider jwtTokenProvider;
		
		@Bean
		@Override
		public AuthenticationManager authenticationManagerBean() throws Exception {
	       return super.authenticationManagerBean();
		}
		
		
        protected void configure(HttpSecurity http) throws Exception {
        	
        	http.csrf().disable()
        		.exceptionHandling().accessDeniedPage(Constants.URI_API_AUTH)
        		.and()
        		.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
        		.and()
        		.antMatcher(Constants.URI_API_ALL)
        		.authorizeRequests()
        			.antMatchers(HttpMethod.POST, Constants.URI_API_AUTH).permitAll()
        			.antMatchers(HttpMethod.GET, Constants.URI_API_HEALTHCHECK).permitAll()
        			.anyRequest()
        			.hasRole(Patterns.ROLE_API)
        			.and()
        			.apply(new JwtTokenFilterConfigurer(jwtTokenProvider));
   
        }
    }
	
	@Configuration                                                   
    public static class FormLoginWebSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {

        @Override
        protected void configure(HttpSecurity http) throws Exception {
        	
        	http.csrf().disable()
				.cors().disable()
				.authorizeRequests()
					.antMatchers(PUBLIC).permitAll()
					.anyRequest().hasRole(Patterns.ROLE_USER)
					.and()
				.formLogin().failureUrl(Constants.URI_LOGIN_ERR).defaultSuccessUrl(Constants.URI_HOME)
					.loginPage(Constants.URI_LOGIN).permitAll()
					.and()
					.logout().logoutRequestMatcher(new AntPathRequestMatcher(Constants.URI_LOGOUT)).logoutSuccessUrl(Constants.URI_LOGOUT_SUCC)
					.deleteCookies(Constants.COO_JSESSION_ID).permitAll()
					.and()
					.rememberMe().key(Constants.COO_REMEBER_ME).tokenValiditySeconds(86400);
		
		
			// Needed to support the h2-console interface
			http.headers().frameOptions().disable();
        }
    }
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userSecurityService).passwordEncoder(encoder());
	}
}
