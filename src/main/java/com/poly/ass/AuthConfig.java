package com.poly.ass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration.WebMvcAutoConfigurationAdapter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.ass.interceptor.AuthInterceptor;
import com.poly.ass.service.UserService;

@Configuration
@EnableWebSecurity
public class AuthConfig extends WebSecurityConfigurerAdapter {
	@Bean
	public PasswordEncoder passwordEncoder()
	{
	    return new BCryptPasswordEncoder();
	}
	@Autowired
	UserService userService;
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	   auth.userDetailsService(userService);
   }
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.cors().disable();
		http.csrf().disable();
		http.formLogin().loginPage("/account/login").defaultSuccessUrl("/home",false).failureUrl("/login/error").usernameParameter("username").passwordParameter("password");
		http.oauth2Login().loginPage("/account/login").defaultSuccessUrl("/home/login/oauth2",true).authorizationEndpoint().baseUri("/login/oauth2/authorization");
		http.rememberMe().rememberMeParameter("remember").rememberMeCookieName("rememberlogin").tokenValiditySeconds(100);
		http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN").antMatchers("/home/order","/home/cart","/home/bought").authenticated().anyRequest().permitAll();
		http.logout().deleteCookies("JSESSIONID").logoutUrl("/home/logout").logoutSuccessUrl("/home");
		http.exceptionHandling().accessDeniedPage("/errors");
	}
}
//public class AuthConfig implements WebMvcConfigurer {
//	 @Autowired
//	 AuthInterceptor auth;
//	 @Override
//	 public void addInterceptors(InterceptorRegistry registry ) {
//		 registry.addInterceptor(auth).addPathPatterns("/**").excludePathPatterns("/resources/**");
//	 }
//	}
