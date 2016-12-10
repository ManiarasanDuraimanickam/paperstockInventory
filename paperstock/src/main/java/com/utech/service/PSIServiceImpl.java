package com.utech.service;

import java.sql.SQLException;
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
	public List<PSIStockDetail> getFilteredStockByUserQuery(int queryIndex, Object... query) throws SQLException {
		// TODO Auto-generated method stub
		return this.respository.getFilteredStockByUserQuery(queryIndex, query);
	}

}
