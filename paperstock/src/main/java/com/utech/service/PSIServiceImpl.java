package com.utech.service;

import java.sql.SQLException;

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

}
