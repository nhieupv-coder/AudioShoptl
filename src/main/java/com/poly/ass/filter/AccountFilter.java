package com.poly.ass.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.poly.ass.dao.UserDAO;
import com.poly.ass.entity.User;
import com.poly.ass.service.SessionService;
import com.poly.ass.service.UserService;

@Component
public class AccountFilter implements Filter {
	@Autowired
	SessionService sesionService;
	@Autowired
	UserDAO userDao;
	@Override
	public void destroy() {
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		String username = sesionService.get("username");
		if(username != null) {
			User user = userDao.getById(username);
			request.setAttribute("userLogin", user);
		}
		chain.doFilter(request, response);

	}

}
