package com.utech.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PSIDatavo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1673907931035163638L;
	private USERINFO userinfo;
	private List<PSIStockDetail> stockDetails;

	public USERINFO getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(USERINFO userinfo) {
		this.userinfo = userinfo;
	}

	public List<PSIStockDetail> getStockDetails() {
		if (null == this.stockDetails) {
			this.stockDetails = new ArrayList<>();
		}
		return stockDetails;
	}

	public void setStockDetails(List<PSIStockDetail> stockDetails) {
		this.stockDetails = stockDetails;
	}

}
