package com.utech.util;

import java.io.InputStream;

import org.apache.log4j.Logger;

public final class Constants {

	public static final String PSIDATAVO = "PSIDatavo";
	public static final String STR_FINACIAL_YEAR = "finacialYear";
	public static final String LOGIN_ERROR_KEY="validationfailed";

	public final static Logger logger = Logger.getLogger(Constants.class);

	public static final InputStream getPropertiesAsStream(String name) {
		return Thread.currentThread().getContextClassLoader().getResourceAsStream(name);
	}
}
