package com.poly.ass.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	public String getString(String name, String defaultValue) {
		String value = (String) request.getParameter(name);
		if (value != null) {
			return value;
		}
		return defaultValue;
	}

	public int getInt(String name, int defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Integer.parseInt(value);
	}

	public double getDouble(String name, double defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Integer.parseInt(value);
	}

	public boolean getBoolean(String name, boolean defaultValue) {
		String value = getString(name, String.valueOf(defaultValue));
		return Boolean.parseBoolean(value);
	}

	public Date getDate(String name, String pattern) {
		String value = getString(name, "");
		try {
			return new SimpleDateFormat(pattern).parse(value);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}
}