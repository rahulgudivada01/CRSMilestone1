package com.digit.mvcApp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.digit.mvcApp.model.course;

@WebServlet("/AddCourse")
public class AddCourse extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
		course c=new course();
		c.setCname(req.getParameter("cname"));
		c.setFees(Integer.parseInt(req.getParameter("fees")));
		c.setDur_months(Integer.parseInt(req.getParameter("dur_months")));
		boolean b=c.addcourse();
		if(b==true) {
			resp.sendRedirect("AddedSuccess.html");
		}
		else {
			resp.sendRedirect("AdminFail.html");
		}
	}

}

