package com.poly.ass.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.poly.ass.dao.UserDAO;
import com.poly.ass.entity.User;

@Service
public class UserService implements UserDetailsService {
	@Autowired
	UserDAO userDao;
	@Autowired
	PasswordEncoder encoder;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {
			User user = userDao.getById(username);
			String password = user.getPassword();
			String Role = user.getAdmin();
			if(!user.isActived()) {
				password = System.currentTimeMillis()+ String.valueOf(Math.random());
			}
			return org.springframework.security.core.userdetails.User.withUsername(username)
					.password(encoder.encode(password)).roles(Role).build();
		} catch (Exception e) {
			throw new UsernameNotFoundException(username + " Not found ");
		}

	}

}
