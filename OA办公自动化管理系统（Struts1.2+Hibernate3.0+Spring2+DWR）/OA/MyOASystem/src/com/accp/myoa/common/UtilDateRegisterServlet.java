package com.accp.myoa.common;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.beanutils.ConvertUtils;

public class UtilDateRegisterServlet extends HttpServlet {
	public void init() throws ServletException {
		ConvertUtils.register(new UtilDateConverter(), java.util.Date.class);
	}
}
