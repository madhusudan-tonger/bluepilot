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
@WebServlet("/UserEnroll")
public class UserEnroll extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String course_name=request.getParameter("course_name");
			HttpSession session=request.getSession();
			String userEmail=(String)session.getAttribute("userEmail");
			if(userEmail==null){
				session.setAttribute("msg", "Please Login!");
				response.sendRedirect("User.jsp");
			}else{
				Dao d=new Dao();
				String result=d.userEnroll(userEmail, course_name);
				d.disconnect();
				if(result.equalsIgnoreCase("success")) {
					session.setAttribute("msg", "Successfully Enrolled!");
				}else {
					session.setAttribute("msg", "User Already Enrolled!");
				}
				response.sendRedirect("CourseDetails.jsp?name="+course_name);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
