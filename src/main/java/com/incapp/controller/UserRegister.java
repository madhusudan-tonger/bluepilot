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
@WebServlet("/UserRegister")
@MultipartConfig
public class UserRegister extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String gender=request.getParameter("gender");
			String address=request.getParameter("address");
			String password=request.getParameter("password");
			int age=Integer.parseInt(request.getParameter("age"));
			Part part=request.getPart("photo");
			InputStream photo=part.getInputStream();
			HashMap user=new HashMap();
			user.put("name",name);
			user.put("email",email);
			user.put("phone",phone);
			user.put("gender",gender);
			user.put("address",address);
			user.put("age",age);
			user.put("photo",photo);
			user.put("password",password);
			Dao d=new Dao();
			String result=d.addUser(user);
			d.disconnect();
			HttpSession session=request.getSession();
			if(result.equalsIgnoreCase("success")) {
				session.setAttribute("msg", "User Added Successfully!");
			}else {
				session.setAttribute("msg", "User Already Exist!");
			}
			response.sendRedirect("User.jsp");
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
