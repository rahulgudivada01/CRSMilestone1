package com.digit.mvcApp.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.digit.mvcApp.model.student;




@WebServlet("/RemoveStudent")
public class RemoveStudent extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
		student stud=new student();
		stud.setSid(Integer.parseInt(req.getParameter("sid")));
		boolean b=stud.removestudent();
		if(b==true) {
			resp.sendRedirect("RemoveSuccess.html");
		}
		else {
			resp.sendRedirect("AdminFail.html");
		}
	}
}

