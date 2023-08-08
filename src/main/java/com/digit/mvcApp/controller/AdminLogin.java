package com.digit.mvcApp.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.digit.mvcApp.model.users;

@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		users us=new users();
		us.setUsername(req.getParameter("username"));
		us.setPassword(req.getParameter("password"));
		HttpSession session=req.getSession(true);
		boolean b=us.login();
	    if(b==true) {
	    	session.setAttribute("username",us.getUsername());
	    	session.setAttribute("password",us.getPassword());
	    	resp.sendRedirect("AdminHomePage.jsp");
	    }
	    else {
	    	resp.sendRedirect("AdminLoginFail.html");
	    }
	}
}