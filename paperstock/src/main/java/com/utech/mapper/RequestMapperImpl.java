package com.utech.mapper;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.utech.model.PSIStockDetail;
import com.utech.model.PaperDetail;
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

	@Override
	public PSIStockDetail mapMillDetails(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String mill = request.getParameter("millname");
		String gsm = request.getParameter("gsm");
		String grade = request.getParameter("grade");
		String size = request.getParameter("size");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String remarks = request.getParameter("remarks");
		PSIStockDetail detail = new PSIStockDetail();
		detail.setMillname(mill);
		detail.setContactNum(phone);
		detail.setAddress(address);
		detail.setMailId(email);
		PaperDetail paperDetail = new PaperDetail();
		paperDetail.setGsm(gsm);
		paperDetail.setGrade(grade);
		paperDetail.setSize(size);
		paperDetail.setRemarks(remarks);
		detail.getPaperDetail().add(paperDetail);
		return detail;
	}

	@Override
	public PSIStockDetail mapStockInStockOutDetails(HttpServletRequest request, boolean isStockout) {
		// TODO Auto-generated method stub
		PSIStockDetail detail = new PSIStockDetail();
		PaperDetail paperDetail = new PaperDetail();
		String remarks = request.getParameter("remarks");
		double currentStock = Double.parseDouble(request.getParameter("currentStock"));
		if (isStockout) {
			double stockout = Double.parseDouble(request.getParameter("stockout"));
			paperDetail.setStockOut(stockout);
		} else {
			double purchase = Double.parseDouble(request.getParameter("purchase"));
			paperDetail.setStockIn(purchase);
		}
		int selectedMill = Integer.parseInt(request.getParameter("selectedMill"));

		detail.setMillid(selectedMill);

		paperDetail.setStock(currentStock);

		paperDetail.setRemarks(remarks);
		detail.getPaperDetail().add(paperDetail);
		return detail;
	}

}
