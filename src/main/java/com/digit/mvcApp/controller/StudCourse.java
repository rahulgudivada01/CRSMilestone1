package com.digit.mvcApp.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.digit.mvcApp.model.student;
@WebServlet("/StudCourse")
public class StudCourse extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
    student stud=new student();
    HttpSession session=req.getSession();
    stud.setSid((int)session.getAttribute("sid"));
    stud.setCourse(req.getParameter("course"));
    stud.setProfessor(req.getParameter("professor"));
    boolean b=stud.choosecourse();
    if(b==true) {
        session.setAttribute("course",stud.getCourse());
        session.setAttribute("professor",stud.getProfessor());
        resp.sendRedirect("StudHomePage.jsp");
    }
    else {
        resp.sendRedirect("AddCourseFail.html");
    }
    }

}