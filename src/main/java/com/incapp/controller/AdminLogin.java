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
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id=request.getParameter("id");
			String password=request.getParameter("password");
			Dao d=new Dao();
			String name=d.adminLogin(id, password);
			d.disconnect();
			HttpSession session=request.getSession();
			if(name!=null) {
				session.setAttribute("adminName", name);
				response.sendRedirect("adminHome.jsp");
			}else {
				session.setAttribute("msg", "Incorrect ID or Password!");
				response.sendRedirect("index.jsp");
			}
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
