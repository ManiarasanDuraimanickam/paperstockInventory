package com.utech.repo;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
import com.utech.model.USERINFO;

public interface PSIRespository extends Serializable{

	public boolean isValidUser(USERINFO userinfo)throws SQLException;
	
	public List<PSIStockDetail> getAllStockDetails(PSIDatavo datavo) throws SQLException;
	
	public List<PSIStockDetail> getFilteredStockByUserQuery(int queryIndex,Object... query) throws SQLException;

}
