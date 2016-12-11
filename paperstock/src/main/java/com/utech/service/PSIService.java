package com.utech.service;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
import com.utech.model.USERINFO;

public interface PSIService extends Serializable {
	public boolean isValidUser(USERINFO userinfo) throws SQLException;

	public List<PSIStockDetail> getAllStockDetails(PSIDatavo datavo) throws SQLException;
	
	public List<PSIStockDetail>  getFilteredStockByUserQuery(PSIDatavo datavo, int queryIndex,Object... query) throws SQLException;

	public boolean isMillAvailability(PSIDatavo datavo,String...milldetails) throws SQLException;
}
