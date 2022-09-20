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
@WebServlet("/Answer")
public class Answer extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String user_email=request.getParameter("user_email");
			String answer=request.getParameter("answer");
			int id=Integer.parseInt(request.getParameter("id"));
			HttpSession session=request.getSession();
			Dao d=new Dao();			d.reply(id, answer);
			d.disconnect();
			session.setAttribute("msg", "Reply Sent Successfully!");
			response.sendRedirect("PilotConversation.jsp?user_email="+user_email);
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
