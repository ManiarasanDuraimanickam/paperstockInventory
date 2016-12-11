package com.utech.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utech.model.PSIDatavo;
import com.utech.service.PSIService;
import com.utech.service.PSIServiceImpl;
import com.utech.util.Constants;
import com.utech.util.ControllerUtil;

/**
 * Servlet implementation class MillRegister
 */
@WebServlet(urlPatterns = { "/milldetails" })
public class MillDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final PSIService PSI_SERVICE = new PSIServiceImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MillDetailsController() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
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

	protected void doOptions(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!ControllerUtil.checkUserSession(request)) {
			response.getWriter().write(Constants.SESSION_EXPIRED_TXT);
			return;
		}

		String mill = request.getParameter("millname");
		String gsm = request.getParameter("gsm");
		String grade = request.getParameter("grade");
		String size = request.getParameter("size");
		PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
		try {
			boolean ismillAvailable = PSI_SERVICE.isMillAvailability(datavo, mill, gsm, grade, size);
			response.getWriter().write("" + ismillAvailable);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().write(e.getMessage());
			return;
		}
	}

}
