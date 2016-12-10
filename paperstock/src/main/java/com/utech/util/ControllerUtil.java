package com.utech.util;

import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import com.utech.model.PSIDatavo;

public class ControllerUtil {

	public static enum VIWEPAGE {

		LOGIN("/login.ftl"), DASHBOARD("/dashboard.ftl"), PURCHASE("/purchase.ftl"), STOCKOUT("/stockout.ftl"), REPORT(
				"/report.ftl"), MILLDETAIL("/milldetail.ftl");

		private final String page;

		VIWEPAGE(String page) {
			this.page = page;
		}

		public String getPage() {
			return page;
		}

	}

	public static Properties APP_PROPERTIES = new Properties();

	public static RequestDispatcher redirectToLoginpage(HttpServletRequest request, String key, String msg) {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher(VIWEPAGE.LOGIN.getPage());
		request.getSession().removeAttribute(Constants.PSIDATAVO);
		request.getSession().invalidate();
		request.setAttribute(key, msg);
		return dispatcher;
	}

	public static RequestDispatcher redirectToSelectedPage(String page, HttpServletRequest request, String key,
			String msg) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(page);
		request.setAttribute(key, msg);
		return dispatcher;
	}

	public static boolean checkUserSession(HttpServletRequest request) {
		PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
		String navpage = (String) request.getSession().getAttribute("navpage");
		return navpage!=null && !navpage.isEmpty()&& datavo != null && datavo.getUserinfo() != null && datavo.getUserinfo().getUsername() != null ? true
				: false;
	}
}
