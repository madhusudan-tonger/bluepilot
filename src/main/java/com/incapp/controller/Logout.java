package com.incapp.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.incapp.dao.Dao;



/**
 * Servlet implementation class AddEnquiry
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session= request.getSession();
			session.invalidate();
			response.sendRedirect("index.jsp");
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
