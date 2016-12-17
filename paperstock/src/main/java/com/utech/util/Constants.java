package com.utech.util;

import java.io.InputStream;

import org.apache.log4j.Logger;

public final class Constants {

	public static enum RECORD_STATUS {
		SUCCESS("Your record has been saved successfully..!"), FALIUR(
				"We are facing some technical issue so cannot save your record.");
		private final String msg;

		RECORD_STATUS(String msg) {
			this.msg = msg;
		}

		public String getMsg() {
			return msg;
		}
	}

	public static final String PSIDATAVO = "PSIDatavo";
	public static final String STR_FINACIAL_YEAR = "finacialYear";
	public static final String LOGIN_ERROR_KEY = "validationfailed";
	public static final String SESSION_EXPIRED_TXT = "Your session has expired..";

	public final static Logger logger = Logger.getLogger(Constants.class);

	public static final InputStream getPropertiesAsStream(String name) {
		return Thread.currentThread().getContextClassLoader().getResourceAsStream(name);
	}
}
