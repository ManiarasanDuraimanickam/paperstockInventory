package com.utech.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

/**
 * Servlet implementation class ReportController
 */
@WebServlet("/report")
public class ReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static PSIService PSI_SERVICE = new PSIServiceImpl();
	SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy hh:mm a");

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		response.setContentType("application/json");
		Gson gson = new Gson();
		PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
		List<PSIStockDetail> last30DaysPurchase_Used = null;
		try {
			Date stDate = dateFormat.parse(startDate);
			Date enDate = dateFormat.parse(endDate);
			last30DaysPurchase_Used = PSI_SERVICE.getPurchase_UsedTransBySelectedDate(stDate, enDate, datavo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String responseData = gson.toJson(last30DaysPurchase_Used);

		response.getWriter().write(responseData);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
