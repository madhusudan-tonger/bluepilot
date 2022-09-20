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
@WebServlet("/AddEnquiry")
public class AddEnquiry extends HttpServlet {
	
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			Dao d=new Dao();
			d.addEnquiry(name, phone);
			d.disconnect();
			HttpSession session=request.getSession();
			session.setAttribute("msg", "Thanks for Contacting us..! We Will Contact You Soon.");
			response.sendRedirect("index.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
