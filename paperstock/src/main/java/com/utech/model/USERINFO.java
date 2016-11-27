package com.utech.model;

import java.io.Serializable;
import java.util.Date;

public class USERINFO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5079239260809447047L;

	private String username;

	private char[] password;

	private Date loggedInTime;

	private String loggedInMachine;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public char[] getPassword() {
		return password;
	}

	public void setPassword(char[] password) {
		this.password = password;
	}

	public Date getLoggedInTime() {
		return loggedInTime;
	}

	public void setLoggedInTime(Date loggedInTime) {
		this.loggedInTime = loggedInTime;
	}

	public String getLoggedInMachine() {
		return loggedInMachine;
	}

	public void setLoggedInMachine(String loggedInMachine) {
		this.loggedInMachine = loggedInMachine;
	}
}
