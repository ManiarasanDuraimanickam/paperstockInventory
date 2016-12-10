package com.utech.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utech.service.PSIService;
import com.utech.service.PSIServiceImpl;
import com.utech.util.Constants;
import com.utech.util.ControllerUtil;

/**
 * Servlet implementation class StockFilterController
 */
@WebServlet("/stockfilter")
public class StockFilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final PSIService PSI_SERVICE = new PSIServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StockFilterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = null;
		if (!ControllerUtil.checkUserSession(request)) {
			dispatcher = ControllerUtil.redirectToLoginpage(request, Constants.LOGIN_ERROR_KEY,
					"Your session has expired..");
			dispatcher.forward(request, response);
		}
		int queryIndex = Integer.parseInt(request.getParameter("queryIndex"));
		List<String> query = new ArrayList<>();
		switch (queryIndex) {
		case 0:
			query.add(request.getParameter("millname"));
			break;
		case 1:
			query.add(request.getParameter("millname"));
			query.add(request.getParameter("gsm"));
			break;
		case 2:
			query.add(request.getParameter("millname"));
			query.add(request.getParameter("gsm"));
			query.add(request.getParameter("grade"));
			break;
		case 3:
			query.add(request.getParameter("millname"));
			query.add(request.getParameter("gsm"));
			query.add(request.getParameter("grade"));
			query.add(request.getParameter("size"));
			break;
		}
		try {
			PSI_SERVICE.getFilteredStockByUserQuery(queryIndex, query.toArray());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			ControllerUtil.redirectToLoginpage(request, Constants.LOGIN_ERROR_KEY, e.getMessage());
		}
	}

}
