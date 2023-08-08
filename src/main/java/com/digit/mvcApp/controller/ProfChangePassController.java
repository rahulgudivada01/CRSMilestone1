package com.digit.mvcApp.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.digit.mvcApp.model.professor;

@WebServlet("/ProfChangePassController")
public class ProfChangePassController extends HttpServlet {
	@Override

	public void service(HttpServletRequest req,HttpServletResponse resp)  throws ServletException, IOException{

		professor prof=new professor() ;

		HttpSession session=req.getSession();

		int pid=(int)session.getAttribute("pid");

		prof.setPpass(req.getParameter("ppass"));

		String newpassword=req.getParameter("newpass");

		String confirmpassword=req.getParameter("cpass");

		if(confirmpassword.equals(newpassword))
		{
			boolean b=prof.changepass(pid,newpassword);
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

