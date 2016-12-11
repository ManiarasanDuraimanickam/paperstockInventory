package com.utech.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utech.util.Constants;
import com.utech.util.ControllerUtil;
import com.utech.util.ControllerUtil.VIWEPAGE;

/**
 * Servlet implementation class NavigationController
 */
@WebServlet("/navigation")
public class NavigationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		RequestDispatcher dispatcher = getRedirectToSelectedPage(page, request);
		
		dispatcher.forward(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String page = request.getParameter("menu");
		RequestDispatcher dispatcher = getRedirectToSelectedPage(page, request);
		
		dispatcher.forward(request, response);
	}
	
	private RequestDispatcher getRedirectToSelectedPage(String page,HttpServletRequest request){
		RequestDispatcher dispatcher = null;
		if (!ControllerUtil.checkUserSession(request)) {
			dispatcher = ControllerUtil.redirectToLoginpage(request, Constants.LOGIN_ERROR_KEY,
					Constants.SESSION_EXPIRED_TXT);
			return dispatcher;
		}
		switch (page) {
		case "dashboard":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.DASHBOARD.getPage(), request, "navpage", "dashboard");
			break;
		case "purchase":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.PURCHASE.getPage(), request, "navpage", "purchase");
			break;
		case "stockout":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.STOCKOUT.getPage(), request, "navpage", "stockout");
			break;
		case "report":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.REPORT.getPage(), request, "navpage", "report");
			break;
		case "milldetail":
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.MILLDETAIL.getPage(), request, "navpage", "milldetail");
			break;
		default:
			dispatcher = ControllerUtil.redirectToLoginpage(request, Constants.LOGIN_ERROR_KEY,
					"Sorry, You have select an Incorrect Menu");
			break;
		}
		return dispatcher;
	}
}
