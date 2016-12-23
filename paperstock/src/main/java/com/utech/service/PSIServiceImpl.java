package com.utech.service;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
import com.utech.model.USERINFO;
import com.utech.repo.PSIRepositoryImpl;
import com.utech.repo.PSIRespository;

public class PSIServiceImpl implements PSIService {

	/**
	 * 
	 */
	private PSIRespository respository = null;

	public PSIServiceImpl() {
		this.respository = new PSIRepositoryImpl();
	}

	private static final long serialVersionUID = -6450266146316163331L;

	@Override
	public boolean isValidUser(USERINFO userinfo) throws SQLException {
		return this.respository.isValidUser(userinfo);
	}

	@Override
	public List<PSIStockDetail> getAllStockDetails(PSIDatavo datavo) throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.getAllStockDetails(datavo);
	}

	@Override
	public List<PSIStockDetail> getFilteredStockByUserQuery(PSIDatavo datavo, int queryIndex, Object... query)
			throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.getFilteredStockByUserQuery(datavo, queryIndex, query);
	}

	@Override
	public boolean isMillAvailability(PSIDatavo datavo, String... milldetails) throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.isMillAvailability(datavo, milldetails);
	}

	@Override
	public boolean doSaveMillDetails(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.doSaveMillDetails(datavo, detail);
	}

	@Override
	public boolean updateMillDetail(PSIDatavo datavo, PSIStockDetail milldetails) throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.updateMillDetail(datavo, milldetails);
	}

	@Override
	public List<PSIStockDetail> getMillDetails(PSIDatavo datavo) throws SQLException {
		return this.respository.getMillDetails(datavo);
	}

	@Override
	public boolean getStockIn(PSIDatavo datavo, PSIStockDetail detail) throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.getStockIn(datavo, detail);
	}

	@Override
	public boolean getStockout(PSIDatavo datavo, PSIStockDetail detail) {
		// TODO Auto-generated method stub
		return false;
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
		return this.respository.getPurchase_UsedTransBySelectedDate(startDate, endDate, datavo);
	}

}
