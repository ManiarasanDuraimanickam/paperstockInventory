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
import com.utech.model.PSIStockDetail;
import com.utech.service.PSIService;
import com.utech.service.PSIStockoutService;
import com.utech.util.Constants;
import com.utech.util.Constants.RECORD_STATUS;
import com.utech.util.ControllerUtil;

/**
 * Servlet implementation class StockoutController
 */
@WebServlet("/stockout")
public class StockoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final PSIService PSI_SERVICE = new PSIStockoutService();
	private static final RequestMapper REQUEST_MAPPER = new RequestMapperImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StockoutController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		if (!ControllerUtil.checkUserSession(request)) {
			dispatcher = ControllerUtil.redirectToLoginpage(request, Constants.LOGIN_ERROR_KEY,
					Constants.SESSION_EXPIRED_TXT);
			dispatcher.forward(request, response);
		}
		PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
		PSIStockDetail detail = REQUEST_MAPPER.mapStockInStockOutDetails(request, true);
		try {
			boolean savedstatus = PSI_SERVICE.getStockout(datavo, detail);
			String msg = savedstatus ? RECORD_STATUS.SUCCESS.getMsg() : RECORD_STATUS.FALIUR.getMsg();
			dispatcher = ControllerUtil.redirectToSelectedPage("/navigation?menu=stockout", request, "savestatus", msg);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dispatcher = ControllerUtil.redirectToSelectedPage("/navigation?menu=purchase", request, "savestatus",
					e.getMessage());
		}
		dispatcher.forward(request, response);
	}

}
