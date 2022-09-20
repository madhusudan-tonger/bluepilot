package com.incapp.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.incapp.dao.Dao;

/**
 * Servlet implementation class AddEnquiry
 */
@WebServlet("/UserLogin")
@MultipartConfig
public class UserLogin extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			Dao d=new Dao();
			String name=d.userLogin(email,password);
			d.disconnect();
			HttpSession session=request.getSession();
			if(name!=null) {
				session.setAttribute("userName", name);
				session.setAttribute("userEmail", email);
				response.sendRedirect("UserHome.jsp");
			}else {
				session.setAttribute("msg", "Wrong Entries!");
				response.sendRedirect("User.jsp");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
