package com.utech.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utech.model.PSIDatavo;
import com.utech.model.PSIStockDetail;
import com.utech.service.PSIService;
import com.utech.service.PSIServiceImpl;
import com.utech.service.PSIStockoutService;
import com.utech.util.Constants;
import com.utech.util.ControllerUtil;
import com.utech.util.ControllerUtil.VIWEPAGE;

/**
 * Servlet implementation class NavigationController
 */
@WebServlet("/navigation")
public class NavigationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static PSIService PSI_SERVICE = new PSIServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NavigationController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("menu");
		RequestDispatcher dispatcher = null;
		try {
			dispatcher = getRedirectToSelectedPage(page, request);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("menu");
		RequestDispatcher dispatcher = null;
		try {
			dispatcher = getRedirectToSelectedPage(page, request);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		dispatcher.forward(request, response);
	}

	private RequestDispatcher getRedirectToSelectedPage(String page, HttpServletRequest request) throws SQLException {
		RequestDispatcher dispatcher = null;
		if (!ControllerUtil.checkUserSession(request)) {
			dispatcher = ControllerUtil.redirectToLoginpage(request, Constants.LOGIN_ERROR_KEY,
					Constants.SESSION_EXPIRED_TXT);
			return dispatcher;
		}
		PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
		switch (page) {
		case "dashboard":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.DASHBOARD.getPage(), request, "navpage",
					"dashboard");
			List<PSIStockDetail> stockDetail = PSI_SERVICE.getAllStockDetails(datavo);
			datavo.getStockDetails().clear();
			datavo.getStockDetails().addAll(stockDetail);
			request.getSession().setAttribute(Constants.PSIDATAVO, datavo);
			break;
		case "purchase":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.PURCHASE.getPage(), request, "navpage",
					"purchase");
			request.setAttribute("milldetails", PSI_SERVICE.getMillDetails(datavo));
			List<PSIStockDetail> last30DaysTrans = PSI_SERVICE.getLast30DaysPurchaseTrans(datavo);
			request.setAttribute("last30DaysTrans", last30DaysTrans);
			break;
		case "stockout":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.STOCKOUT.getPage(), request, "navpage",
					"stockout");
			addAllStockDetails(request);
			break;
		case "report":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.REPORT.getPage(), request, "navpage", "report");
			List<PSIStockDetail> last30DaysPurchase_Used = PSI_SERVICE.getLast30DaysPurchase_UsedTrans(datavo);
			request.setAttribute("last30DaysTrans", last30DaysPurchase_Used);
			break;
		case "milldetail":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.MILLDETAIL.getPage(), request, "navpage",
					"milldetail");
			request.setAttribute("milldetails", PSI_SERVICE.getMillDetails(datavo));
			break;
		default:
			dispatcher = ControllerUtil.redirectToLoginpage(request, Constants.LOGIN_ERROR_KEY,
					"Sorry, You have select an Incorrect Menu");
			break;
		}
		return dispatcher;
	}

	private void addAllStockDetails(HttpServletRequest request) throws SQLException {
		PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
		PSIService psiServiceStockOut = new PSIStockoutService();
		List<PSIStockDetail> stockDetail = psiServiceStockOut.getAllStockDetails(datavo);
		List<PSIStockDetail> last30DaysTrans = psiServiceStockOut.getLast30DaysPurchaseTrans(datavo);
		request.setAttribute("last30DaysTrans", last30DaysTrans);
		request.setAttribute("stockoutMill", stockDetail);
	}
}
