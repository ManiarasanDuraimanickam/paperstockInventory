package com.utech.conection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.utech.util.Constants;

public final class MySQLConnection implements DBConnection {

	private static final connection conn = new connection();

	@Override
	public Connection getConnection() {
		// TODO Auto-generated method stub
		return conn.getMYSQLCon();
	}

	@Override
	public boolean closeConnection() {
		// TODO Auto-generated method stub
		try {
			if (!conn.getMYSQLCon().isClosed()) {
				this.conn.getMYSQLCon().close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			Constants.logger.error(e.getMessage(), e);
		}
		return false;
	}

	private final static class connection {
		private Connection conn = null;
		private Properties dbConnProp = null;

		public final Connection getMYSQLCon() {

			synchronized (this) {
				if (null == conn) {
					try {
						Constants.logger.info("DB COnnection creations");
						dbConnProp = new Properties();
						dbConnProp.load(Constants.getPropertiesAsStream("connfile.properties"));
						Class.forName(dbConnProp.getProperty("driver"));
						conn = DriverManager.getConnection(dbConnProp.getProperty("url"),
								dbConnProp.getProperty("username"), dbConnProp.getProperty("password"));
					} catch (ClassNotFoundException | SQLException | IOException e) {
						Constants.logger.error(e.getMessage(), e);
					} finally {
						dbConnProp = null;
					}
				}
			}
			return conn;
		}
	}

}
