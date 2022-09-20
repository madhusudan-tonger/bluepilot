package com.incapp.controller;

import java.io.IOException;
import java.io.InputStream;

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
@WebServlet("/AddCourse")
@MultipartConfig
public class AddCourse extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("name");
			int fee=Integer.parseInt(request.getParameter("fee"));
			String duration=request.getParameter("duration");
			String content=request.getParameter("content");
			Part part=request.getPart("image");
			InputStream image=part.getInputStream();
			Dao d=new Dao();
			String result=d.addCourse(name, fee,duration,content,image);
			d.disconnect();
			HttpSession session=request.getSession();
			if(result.equalsIgnoreCase("success")) {
				session.setAttribute("msg", "Course Added Successfully!");
			}else {
				session.setAttribute("msg", "Course Already Exist!");
			}
			response.sendRedirect("adminCourses.jsp");
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
