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
import com.utech.model.PaperDetail;
import com.utech.service.PSIService;
import com.utech.service.PSIServiceImpl;
import com.utech.util.Constants;
import com.utech.util.Constants.RECORD_STATUS;
import com.utech.util.ControllerUtil;
import com.utech.util.ControllerUtil.VIWEPAGE;

/**
 * Servlet implementation class MillRegister
 */
@WebServlet(urlPatterns = { "/milldetails" })
public class MillDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final PSIService PSI_SERVICE = new PSIServiceImpl();
	private static final RequestMapper REQUEST_MAPPER = new RequestMapperImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MillDetailsController() {
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
					Constants.SESSION_EXPIRED_TXT);
			dispatcher.forward(request, response);
		}
		PSIDatavo datavo = (PSIDatavo) request.getSession().getAttribute(Constants.PSIDATAVO);
		PSIStockDetail detail = REQUEST_MAPPER.mapMillDetails(request);

		try {
			int millid = Integer.parseInt(request.getParameter("editselected"));
			String msg = null;
			if (millid > 0) {
				detail.setMillid(millid);
				boolean status = PSI_SERVICE.updateMillDetail(datavo, detail);
				msg = status ? RECORD_STATUS.SUCCESS.getMsg() : RECORD_STATUS.FALIUR.getMsg();
			} else {
				boolean status = PSI_SERVICE.doSaveMillDetails(datavo, detail);
				msg = status ? RECORD_STATUS.SUCCESS.getMsg() : RECORD_STATUS.FALIUR.getMsg();
			} // VIWEPAGE.MILLDETAIL.getPage()
			dispatcher = ControllerUtil.redirectToSelectedPage("/navigation?menu=milldetail", request, "savestatus",
					msg);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			dispatcher = ControllerUtil.redirectToSelectedPage(VIWEPAGE.MILLDETAIL.getPage(), request, "savestatus",
					e.getMessage());
		}
		dispatcher.forward(request, response);
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
