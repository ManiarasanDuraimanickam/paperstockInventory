package com.utech.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utech.conection.DBConnection;
import com.utech.conection.MySQLConnection;

/**
 * Servlet implementation class Authenticate
 */
@WebServlet(description = "To validate the user credentials", urlPatterns = { "/Authenticate" })
public class Authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DBConnection connection1 = new MySQLConnection();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Authenticate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**https://github.com/ManiarasanDuraimanickam/paperstockInventory
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			connection1.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
