package com.utech.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utech.mapper.RequestMapper;
import com.utech.mapper.RequestMapperImpl;
import com.utech.model.PSIDatavo;
import com.utech.model.USERINFO;
import com.utech.service.PSIService;
import com.utech.service.PSIServiceImpl;
import com.utech.util.Constants;
import com.utech.util.Constants.VIWEPAGE;
import com.utech.util.ControllerUtil;

/**
 * Servlet implementation class Authenticate
 */
@WebServlet(urlPatterns = { "/authenticate" })
public class Authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final PSIService PSI_SERVICE = new PSIServiceImpl();
	private static final RequestMapper REQUEST_MAPPER = new RequestMapperImpl();

	public Authenticate() throws IOException {
		super();
		ControllerUtil.APP_PROPERTIES.load(Constants.getPropertiesAsStream("app.properties"));
	}

	/**
	 * https://github.com/ManiarasanDuraimanickam/paperstockInventory
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean isValid = false;
		USERINFO userinfo = REQUEST_MAPPER.mapUserInfo(request);
		userinfo.setFinacialYear(ControllerUtil.APP_PROPERTIES.getProperty(Constants.STR_FINACIAL_YEAR));
		try {
			isValid = PSI_SERVICE.isValidUser(userinfo);
		} catch (SQLException e) {
			Constants.logger.error(e.getMessage(), e);
		}
		RequestDispatcher dispatcher = null;
		if (isValid) {
			dispatcher = request.getRequestDispatcher(VIWEPAGE.DASHBOARD.getPage());
			PSIDatavo datavo = new PSIDatavo();
			datavo.setUserinfo(userinfo);
			try {
				datavo.getStockDetails().addAll(PSI_SERVICE.getAllStockDetails(datavo));
			} catch (SQLException e) {
				ControllerUtil.redirectToLoginpage(dispatcher, request, "validationfailed", e.getMessage());
			}
			request.getSession().setAttribute(Constants.PSIDATAVO, datavo);
		} else {
			ControllerUtil.redirectToLoginpage(dispatcher, request, "validationfailed",
					"Your Username or Password is not valid");
		}
		dispatcher.forward(request, response);
	}

	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean logout = Boolean.valueOf(request.getParameter("logout"));
		if (logout) {
			request.getSession().invalidate();
		}
		RequestDispatcher dispatcher = null;/*
											 * request.getRequestDispatcher(
											 * VIWEPAGE.LOGIN.getPage());
											 * dispatcher.forward(request,
											 * response);
											 */
		ControllerUtil.redirectToLoginpage(dispatcher, request, "validationfailed",
				"Thank you, You have successfully logout.");
		dispatcher.forward(request, response);
	}
}
