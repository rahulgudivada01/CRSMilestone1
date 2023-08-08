package com.digit.mvcApp.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.digit.mvcApp.model.student;


@WebServlet("/AddStudent")
public class AddStudent extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
	student stud=new student();
	stud.setSname(req.getParameter("sname"));
	stud.setSpass(req.getParameter("spass"));
	stud.setEmail(req.getParameter("email"));
	boolean b=stud.addstudent();
	if(b==true) {
		resp.sendRedirect("AddedSuccess.html");
	}
	else {
		resp.sendRedirect("AdminFail.html");
	}
	}
}