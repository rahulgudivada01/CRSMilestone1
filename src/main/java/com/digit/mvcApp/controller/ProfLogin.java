package com.digit.mvcApp.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digit.mvcApp.model.professor;
@WebServlet("/ProfLogin")
public class ProfLogin extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		professor prof=new professor();
		prof.setPname(req.getParameter("pname"));
		prof.setPpass(req.getParameter("ppass"));
		HttpSession session=req.getSession(true);
		boolean b=prof.login();
	    if(b==true) {
	    	session.setAttribute("pid",prof.getPid());
	    	session.setAttribute("pname",prof.getPname());
	    	session.setAttribute("ppass",prof.getPpass());
	    	session.setAttribute("exp",prof.getExp());
	    	session.setAttribute("course",prof.getCourse());
	    	session.setAttribute("cid",prof.getCid());
	    	resp.sendRedirect("ProfHomePage.jsp");
	    }
	    else {
	    	resp.sendRedirect("ProfLoginFail.html");
	    }
	}
}
