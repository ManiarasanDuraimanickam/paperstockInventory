package com.utech.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.runners.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class TestAuthenticate {

	@Mock
	HttpServletRequest httpRequest;

	@Mock
	HttpServletResponse httpResponse;

	@Mock
	HttpSession httpSession;

	@Before
	public void intiSetup() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void testAuthentication() throws ServletException, IOException {
		Mockito.when(httpRequest.getParameter("username")).thenReturn("admin");
		Mockito.when(httpRequest.getParameter("password")).thenReturn("admin");
		Mockito.when(httpRequest.getSession()).thenReturn(httpSession);
		new Authenticate().doPost(httpRequest, httpResponse);
		
	}

}
