package com.utech.service;

import java.io.Serializable;
import java.sql.SQLException;

import com.utech.model.USERINFO;

public interface PSIService extends Serializable {
	public boolean isValidUser(USERINFO userinfo) throws SQLException;
}
