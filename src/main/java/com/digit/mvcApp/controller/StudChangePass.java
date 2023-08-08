package com.digit.mvcApp.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.digit.mvcApp.model.student;


@WebServlet("/StudChangePass")
public class StudChangePass extends HttpServlet {
	@Override

	public void service(HttpServletRequest req,HttpServletResponse resp)  throws ServletException, IOException{

		student stud=new student() ;

		HttpSession session=req.getSession();

		stud.setSid((int)session.getAttribute("sid"));

		stud.setSpass(req.getParameter("spass"));

		String newpassword=req.getParameter("newpass");

		String confirmpassword=req.getParameter("cpass");

		if(confirmpassword.equals(newpassword))
		{
			boolean b=stud.changepass(newpassword);
			if(b==true)
			{
				resp.sendRedirect("PassSuccess.html");

			}
			else
			{
				resp.sendRedirect("PassFail.html");

			}
		}
	}
}
