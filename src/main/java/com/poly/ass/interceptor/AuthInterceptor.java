package com.poly.ass.interceptor;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.ass.dao.UserDAO;
import com.poly.ass.entity.User;
import com.poly.ass.service.SessionService;

@Service
public class AuthInterceptor implements HandlerInterceptor {
//	@Autowired
//	SessionService session;
//	@Autowired
//	UserDAO userDao;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) {
		if (!req.isUserInRole("ADMIN") && !req.isUserInRole("USER")) {
			req.setAttribute("isLogin", false);
		} else {
			req.setAttribute("isLogin", true);
			if (req.isUserInRole("ADMIN")) {
				req.setAttribute("Admin", true);
			} else {
				req.setAttribute("Admin", false);
			}
		}
		return true;
	}

//	@Override
//	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws IOException {
//		String uri = req.getRequestURI();
//		String username = session.get("username");
//		String error = "";
//		if (username != null) {
//			User u = userDao.getById(username);
//			if (!u.getAdmin().equals("USER") && uri.startsWith("/admin/")) {
//				error = "Access denied";
//			}
//		} else {
//			error = "Please Login !";
//		}
//		if (error.length() > 0) {
//			Map<String, String[]> map = new HashMap<>();
//			//get all Attribute of path
//			map = req.getParameterMap();
//			Set<String> set = map.keySet();
//			//Create StringBuffer
//			StringBuffer buffer = new StringBuffer();
//			//set value for StringBuffrer
//			for (String key : set) {
//				buffer.append(key+"="+map.get(key)[0]+"&");
//			}
//			//set session
//			session.set("security-uri", uri+"?"+buffer.toString());
//			if (error.contains("Login")) {
//				res.sendRedirect("/account/login?error=" + error);
//			} else {
//				res.sendRedirect("/errors?error=" + error);
//			}
//			return false;
//		}
//		return true;
}
