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
@WebServlet("/PilotRegister")
@MultipartConfig
public class PilotRegister extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String gender=request.getParameter("gender");
			String address=request.getParameter("address");
			String password=request.getParameter("password");
			int experience=Integer.parseInt(request.getParameter("experience"));
			Part part=request.getPart("photo");
			InputStream photo=part.getInputStream();
			HashMap pilot=new HashMap();
			pilot.put("name",name);
			pilot.put("email",email);
			pilot.put("phone",phone);
			pilot.put("gender",gender);
			pilot.put("address",address);
			pilot.put("experience",experience);
			pilot.put("photo",photo);
			pilot.put("password",password);
			Dao d=new Dao();
			String result=d.addPilot(pilot);
			d.disconnect();
			HttpSession session=request.getSession();
			if(result.equalsIgnoreCase("success")) {
				session.setAttribute("msg", "Pilot Added Successfully!");
			}else {
				session.setAttribute("msg", "Pilot Already Exist!");
			}
			response.sendRedirect("Pilot.jsp");
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("ExceptionPage.jsp");
		}
	}

}
