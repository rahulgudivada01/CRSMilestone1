package com.digit.mvcApp.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.digit.mvcApp.model.course;


@WebServlet("/RemoveCourse")
public class RemoveCourse extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
	course c=new course();
	c.setCid(Integer.parseInt(req.getParameter("cid")));
	boolean b=c.removecourse();
	if(b==true) {
		resp.sendRedirect("RemoveSuccess.html");
	}
	else {
		resp.sendRedirect("AdminFail.html");
	}
	}
}

