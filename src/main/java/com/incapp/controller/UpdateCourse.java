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
@WebServlet("/UpdateCourse")
@MultipartConfig
public class UpdateCourse extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String oldName=request.getParameter("oldName");
			String name=request.getParameter("name");
			int fee=Integer.parseInt(request.getParameter("fee"));
			String duration=request.getParameter("duration");
			String content=request.getParameter("content");
			Part part=request.getPart("image");
			InputStream image;
			if(part.getSize()==0) {
				image=null;
			}else {
				image=part.getInputStream();
			}
			Dao d=new Dao();
			String result=d.updateCourse(name, fee, duration, content, image, oldName);
			d.disconnect();
			HttpSession session=request.getSession();
			if(result.equalsIgnoreCase("success")) {
				session.setAttribute("msg", "Course Updated Successfully!");
				response.sendRedirect("adminCourseDetails.jsp?name="+name);
			}else {
				session.setAttribute("msg", "Course Name Already Exist!");
				response.sendRedirect("adminCourseDetails.jsp?name="+oldName);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
