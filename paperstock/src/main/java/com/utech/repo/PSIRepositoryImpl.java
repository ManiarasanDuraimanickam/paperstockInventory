package com.utech.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.utech.conection.DBConnection;
import com.utech.conection.MySQLConnection;
import com.utech.model.USERINFO;

public class PSIRepositoryImpl implements PSIRespository {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4360965807739632241L;
	private DBConnection connection = new MySQLConnection();

	private static final String[] query = { "select * from auth where uname=? and pass=? and rights=?" };

	@Override
	public boolean isValidUser(USERINFO userinfo) throws SQLException {
		boolean valid = false;
		try {
			Connection connection = this.connection.getConnection();
			PreparedStatement pst = connection.prepareStatement(query[0]);
			pst.setString(1, userinfo.getUsername());
			pst.setString(2, new String(userinfo.getPassword()));
			pst.setBoolean(3, Boolean.TRUE);
			ResultSet resultSet = pst.executeQuery();
			valid = !resultSet.wasNull() && resultSet.next() ? (Boolean) resultSet.getObject("rights") : false;
		} finally {
			this.connection.getConnection().close();
		}
		return valid;
	}

}
