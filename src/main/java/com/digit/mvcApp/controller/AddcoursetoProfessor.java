package com.digit.mvcApp.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.digit.mvcApp.model.professor;

@WebServlet("/AddcoursetoProfessor")
public class AddcoursetoProfessor extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException,ServletException{
		professor prof=new professor();
		prof.setPname(req.getParameter("pname"));
		prof.setCid(Integer.parseInt(req.getParameter("cid")));
		prof.setCourse(req.getParameter("course"));
		boolean b=prof.addcourse();
		if(b==true) {
			resp.sendRedirect("AddedSuccess.html");
		}
		else {
			resp.sendRedirect("ProfCourse.jsp");
		}

	}

}


