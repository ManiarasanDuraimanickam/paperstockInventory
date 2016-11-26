package com.utech.conection;

import java.sql.Connection;

public interface DBConnection {

	public Connection getConnection();
	
	public boolean close();
	
}
