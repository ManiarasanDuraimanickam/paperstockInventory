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
		switch (page) {
		case "dashboard":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.DASHBOARD.getPage(), request, "navpage",
					"dashboard");
			PSIDatavo dsdatavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
			List<PSIStockDetail> stockDetail = PSI_SERVICE.getAllStockDetails(dsdatavo);
			dsdatavo.getStockDetails().clear();
			dsdatavo.getStockDetails().addAll(stockDetail);
			request.getSession().setAttribute(Constants.PSIDATAVO, dsdatavo);
			break;
		case "purchase":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.PURCHASE.getPage(), request, "navpage",
					"purchase");
			PSIDatavo datavo1 = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
			request.setAttribute("milldetails", PSI_SERVICE.getMillDetails(datavo1));
			List<PSIStockDetail> last30DaysTrans = PSI_SERVICE.getLast30DaysPurchaseTrans(datavo1);
			request.setAttribute("last30DaysTrans", last30DaysTrans);
			break;
		case "stockout":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.STOCKOUT.getPage(), request, "navpage",
					"stockout");
			addAllStockDetails(request);
			break;
		case "report":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.REPORT.getPage(), request, "navpage", "report");
			break;
		case "milldetail":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.MILLDETAIL.getPage(), request, "navpage",
					"milldetail");
			PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
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
