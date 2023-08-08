package com.digit.mvcApp.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digit.mvcApp.model.student;

@WebServlet("/CheckStudController")
public class CheckStudController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		student stud=new student();
		HttpSession session=req.getSession();
		String course=(String) session.getAttribute("course");
		
		boolean b=stud.checkstud(course);
	    if(b==true) {
	    	session.setAttribute("sid",stud.getSid());
	    	session.setAttribute("sname",stud.getSname());
	    	session.setAttribute("spass",stud.getSpass());
	    	session.setAttribute("email",stud.getEmail());
	    	session.setAttribute("course",stud.getCourse());
	    	session.setAttribute("marks",stud.getMarks());
	    	session.setAttribute("professor",stud.getProfessor());
	    	resp.sendRedirect("CheckStud.jsp");
	    }
	    else {
	    	resp.sendRedirect("CheckStudFail.html");
	    }
	}
}

