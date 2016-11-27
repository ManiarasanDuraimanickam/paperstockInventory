package com.utech.mapper;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.utech.model.USERINFO;

public class RequestMapperImpl implements RequestMapper {

	@Override
	public USERINFO mapUserInfo(HttpServletRequest request) {
		USERINFO userinfo = new USERINFO();
		userinfo.setUsername(request.getParameter("username"));
		userinfo.setPassword(request.getParameter("password").toCharArray());
		userinfo.setLoggedInMachine(request.getRemoteAddr());
		userinfo.setLoggedInTime(new Date(System.currentTimeMillis()));
		return userinfo;
	}

}
