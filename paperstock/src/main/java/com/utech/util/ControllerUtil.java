package com.utech.util;

import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import com.utech.util.Constants.VIWEPAGE;

public class ControllerUtil {
	
	public static Properties APP_PROPERTIES=new Properties();

	public static void redirectToLoginpage(RequestDispatcher dispatcher, HttpServletRequest request, String key,
			String msg) {
		// TODO Auto-generated method stub
		dispatcher = request.getRequestDispatcher(VIWEPAGE.LOGIN.getPage());
		request.getSession().removeAttribute(Constants.PSIDATAVO);
		request.getSession().invalidate();
		request.setAttribute(key, msg);
	}
}
