package com.digit.mvcApp.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.digit.mvcApp.model.professor;



@WebServlet("/RemoveProfessor")
public class RemoveProfessor extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
	professor prof=new professor();
	prof.setPid(Integer.parseInt(req.getParameter("pid")));
	boolean b=prof.removeprofessor();
	if(b==true) {
		resp.sendRedirect("RemoveSuccess.html");
	}
	else {
		resp.sendRedirect("AdminFail.html");
	}
	}
}

