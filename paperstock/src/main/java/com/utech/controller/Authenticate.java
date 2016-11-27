package com.utech.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
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
@WebServlet(urlPatterns = { "/authenticate" })
public class Authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DBConnection connection = new MySQLConnection();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Authenticate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * https://github.com/ManiarasanDuraimanickam/paperstockInventory
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String username = request.getParameter("username");
			String pass = request.getParameter("password");
			Connection connection = this.connection.getConnection();
			Statement st = connection.createStatement();
			ResultSet resultSet = st
					.executeQuery("select * from auth where uname='" + username + "' and pass='" + pass + "'");
			resultSet.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard.ftl");
		dispatcher.forward(request, response);
	}

}
