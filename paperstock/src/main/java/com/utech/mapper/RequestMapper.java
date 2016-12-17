package com.utech.mapper;

import javax.servlet.http.HttpServletRequest;

import com.utech.model.PSIStockDetail;
import com.utech.model.USERINFO;

public interface RequestMapper {

	public USERINFO mapUserInfo(HttpServletRequest request);
	
	public PSIStockDetail mapMillDetails(HttpServletRequest request);
	
	public PSIStockDetail mapStockInStockOutDetails(HttpServletRequest request, boolean isStockout);

}
