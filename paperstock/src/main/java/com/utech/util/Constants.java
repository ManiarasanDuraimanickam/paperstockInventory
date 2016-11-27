package com.utech.util;

import java.io.InputStream;

import org.apache.log4j.Logger;

public final class Constants {

	public static enum VIWEPAGE {
		LOGIN("/login.ftl"), DASHBOARD("/dashboard.ftl");

		private final String page;

		VIWEPAGE(String page) {
			this.page = page;
		}

		public String getPage() {
			return page;
		}

	}

	public final static Logger logger = Logger.getLogger(Constants.class);

	public static final InputStream getPropertiesAsStream(String name) {
		return Thread.currentThread().getContextClassLoader().getResourceAsStream(name);
	}
}
