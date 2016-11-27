package com.utech.util;

import java.io.InputStream;

import org.apache.log4j.Logger;

public final class Constants {
	public final static Logger logger = Logger.getLogger(Constants.class);

	public static final InputStream getPropertiesAsStream(String name) {
		return Thread.currentThread().getContextClassLoader().getResourceAsStream(name);
	}
}
