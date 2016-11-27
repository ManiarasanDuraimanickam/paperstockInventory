package com.utech.repo;

import java.io.Serializable;
import java.sql.SQLException;

import com.utech.model.USERINFO;

public interface PSIRespository extends Serializable{

	public boolean isValidUser(USERINFO userinfo)throws SQLException;

}
