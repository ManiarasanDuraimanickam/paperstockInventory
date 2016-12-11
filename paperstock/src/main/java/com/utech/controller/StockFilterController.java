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

import com.google.gson.Gson;
import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
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
		if (!ControllerUtil.checkUserSession(request)) {
			response.getWriter().write(Constants.SESSION_EXPIRED_TXT);
			return ;
		}
		int queryIndex = Integer.parseInt(request.getParameter("queryIndex"));
		PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
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
			List<PSIStockDetail> stockDetail = PSI_SERVICE.getFilteredStockByUserQuery(datavo, queryIndex,
					query.toArray());
			Gson gson = new Gson();
			String responseData = gson.toJson(stockDetail);
			response.setContentType("application/json");
			StringBuilder builder = new StringBuilder();
			builder.append(",");
			builder.append("\"");
			builder.append("queryIndex");
			builder.append("\"");
			builder.append(":");
			builder.append("\"");
			builder.append(queryIndex);
			builder.append("\"");
			builder.append("}]");
			responseData = responseData.substring(0, responseData.lastIndexOf("}"));
			responseData = responseData.concat(builder.toString());
			response.getWriter().write(responseData);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			ControllerUtil.redirectToLoginpage(request, Constants.LOGIN_ERROR_KEY, e.getMessage());
		}
	}

}
