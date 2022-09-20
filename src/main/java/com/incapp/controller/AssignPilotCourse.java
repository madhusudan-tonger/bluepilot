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
@WebServlet("/AssignPilotCourse")
public class AssignPilotCourse extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String pilot_email=request.getParameter("pilot_email");
			String course_name=request.getParameter("course_name");
			
			Dao d=new Dao();
			String result=d.assignPilotCourse(pilot_email, course_name);
			d.disconnect();
			HttpSession session=request.getSession();
			if(result.equalsIgnoreCase("success")) {
				session.setAttribute("msg", "Pilot Assigned Successfully!");
			}else {
				session.setAttribute("msg", "Pilot Already Assigned!");
			}
			response.sendRedirect("adminCourseDetails.jsp?name="+course_name);
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
