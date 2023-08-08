package com.digit.mvcApp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.digit.mvcApp.model.professor;


@WebServlet("/AddProfessor")
public class AddProfessor extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
		professor prof=new professor();
		prof.setPname(req.getParameter("pname"));
		prof.setPpass(req.getParameter("ppass"));
		prof.setExp(Integer.parseInt(req.getParameter("exp")));
		boolean b=prof.addprofessor();
		if(b==true) {
			resp.sendRedirect("ProfCourse.jsp");
		}
		else {
			resp.sendRedirect("AdminFail.html");
		}
	}
}

