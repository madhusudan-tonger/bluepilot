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
@WebServlet("/AskQuestion")
public class AskQuestion extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String question=request.getParameter("question");
			String pilot_email=request.getParameter("pilot_email");
			HttpSession session=request.getSession();
			String userEmail=(String)session.getAttribute("userEmail");
			Dao d=new Dao();
			d.addQuestion(userEmail, pilot_email,question);
			d.disconnect();
			session.setAttribute("msg", "Question Sent Successfully!");
			response.sendRedirect("UserConversation.jsp?pilot_email="+pilot_email);
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
