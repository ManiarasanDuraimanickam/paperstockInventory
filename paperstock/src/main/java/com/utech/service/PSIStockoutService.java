package com.utech.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
import com.utech.model.USERINFO;
import com.utech.repo.PSIRespository;
import com.utech.repo.StockoutRepo;

public class PSIStockoutService implements PSIService {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5866895437552421258L;

	private PSIRespository respository = null;

	public PSIStockoutService() {
		this.respository = new StockoutRepo();
	}
	@Override
	public boolean isValidUser(USERINFO userinfo) throws SQLException {
		return false;
	}

	@Override
	public List<PSIStockDetail> getAllStockDetails(PSIDatavo datavo) throws SQLException {
		return this.respository.getAllStockDetails(datavo);
	}

	@Override
	public List<PSIStockDetail> getFilteredStockByUserQuery(PSIDatavo datavo, int queryIndex, Object... query)
			throws SQLException {
		return this.respository.getFilteredStockByUserQuery(datavo, queryIndex, query);
	}

	@Override
	public boolean isMillAvailability(PSIDatavo datavo, String... milldetails) throws SQLException {
		return false;
	}

	@Override
	public boolean doSaveMillDetails(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		return false;
	}

	@Override
	public List<PSIStockDetail> getMillDetails(PSIDatavo datavo) throws SQLException {
		return null;
	}

	@Override
	public boolean updateMillDetail(PSIDatavo datavo, PSIStockDetail milldetails) throws SQLException {
		return false;
	}

	@Override
	public boolean getStockIn(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		return false;
	}
	@Override
	public boolean getStockout(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.getStockout(datavo,detail);
	}
	@Override
	public List<PSIStockDetail> getLast30DaysPurchaseTrans(PSIDatavo datavo) throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.getLast30DaysPurchaseTrans(datavo);
	}
	@Override
	public List<PSIStockDetail> getLast30DaysPurchase_UsedTrans(PSIDatavo datavo) throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.getLast30DaysPurchase_UsedTrans(datavo);
	}
	@Override
	public List<PSIStockDetail> getPurchase_UsedTransBySelectedDate(Date startDate, Date endDate, PSIDatavo datavo)
			throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
