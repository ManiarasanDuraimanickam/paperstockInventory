package com.utech.repo;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
import com.utech.model.USERINFO;

public interface PSIRespository extends Serializable {

	public boolean isValidUser(USERINFO userinfo) throws SQLException;

	public List<PSIStockDetail> getAllStockDetails(PSIDatavo datavo) throws SQLException;

	public List<PSIStockDetail> getFilteredStockByUserQuery(PSIDatavo datavo, int queryIndex, Object... query)
			throws SQLException;

	public boolean isMillAvailability(PSIDatavo datavo, String... milldetails) throws SQLException;

	public boolean doSaveMillDetails(PSIDatavo datavo, PSIStockDetail detail) throws SQLException;

	public boolean updateMillDetail(PSIDatavo datavo, PSIStockDetail milldetails) throws SQLException;

	public List<PSIStockDetail> getMillDetails(PSIDatavo datavo) throws SQLException;

	public boolean getStockIn(PSIDatavo datavo, PSIStockDetail detail) throws SQLException;

	public boolean getStockout(PSIDatavo datavo, PSIStockDetail detail) throws SQLException;

	public List<PSIStockDetail> getLast30DaysPurchaseTrans(PSIDatavo datavo1) throws SQLException;

	public List<PSIStockDetail> getLast30DaysPurchase_UsedTrans(PSIDatavo datavo) throws SQLException;

	public List<PSIStockDetail> getPurchase_UsedTransBySelectedDate(Date startDate, Date endDate, PSIDatavo datavo) throws SQLException;
}
