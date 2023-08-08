package com.digit.mvcApp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class student{
	int sid;
	String sname;
	String spass;
	String email;
	String course;
	int marks;
	String professor;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet resultSet;
	private ResultSet res1;
	private PreparedStatement pstmt1;
	public student() {
		String url = "jdbc:mysql://localhost:3306/crs";
		String user = "root";
		String pwd = "Rahulg01*";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);
		}
		catch (Exception e) {

			e.printStackTrace();

		}
	}
	public int getSid() {
		return sid;
	}
	public String getSname() {
		return sname;
	}
	public String getSpass() {
		return spass;
	}
	public String getEmail() {
		return email;
	}
	public String getCourse() {
		return course;
	}
	public int getMarks() {
		return marks;
	}
	public String getProfessor() {
		return professor;
	}
	public Connection getCon() {
		return con;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public void setSpass(String spass) {
		this.spass = spass;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public void setMarks(int marks) {
		this.marks = marks;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
	public boolean checkstud(String course) {
		try {
			pstmt=con.prepareStatement("select * from student where course=?");
			pstmt.setString(1,course);
			resultSet=pstmt.executeQuery();
			while(resultSet.next()==true)
			{
				this.setSid(resultSet.getInt("sid"));
				this.setSname(resultSet.getString("sname"));
				this.setSpass(resultSet.getString("spass"));
				this.setEmail(resultSet.getString("email"));
				this.setCourse(resultSet.getString("course"));
				this.setMarks(resultSet.getInt("marks"));
				this.setProfessor(resultSet.getString("professor"));
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean givemarks() {
		try {
			pstmt=con.prepareStatement("update student set marks=? where sid=?");
			pstmt.setInt(1,marks);
			pstmt.setInt(2,sid);
			int x=pstmt.executeUpdate();
			if(x>0)
			{
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean login() {
		try {
			pstmt = con.prepareStatement("select * from student where sname=? and spass=?");
			pstmt.setString(1, sname);
			pstmt.setString(2, spass);
			res1= pstmt.executeQuery();

			if(res1.next()==true) {
				this.setSid(res1.getInt("sid"));
				this.setSname(res1.getString("sname"));
				this.setSpass(res1.getString("spass"));
				this.setEmail(res1.getString("email"));
				this.setCourse(res1.getString("course"));
				this.setMarks(res1.getInt("marks"));
				this.setProfessor(res1.getString("professor"));
					return true;
			}
			else {
				return false;
			}
		}

		catch (Exception e) {

			e.printStackTrace();

		}
		return false;
	}
	public boolean addstudent() {
		try {
			pstmt =con.prepareStatement("insert into student(sname,spass,email) values(?,?,?)");
			pstmt.setString(1,sname);
			pstmt.setString(2,spass);
			pstmt.setString(3,email);
			int x=pstmt.executeUpdate();
			if(x>0)
			{
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean removestudent() {
		try {
			pstmt = con.prepareStatement("delete from student where sid=?");
			pstmt.setInt(1,sid);
			int x=pstmt.executeUpdate();
			if(x>0) {
				return true;
			}
			else {
				return false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public boolean choosecourse() {
		try {
			pstmt1=con.prepareStatement("update student set professor =? where sid=?");
			pstmt=con.prepareStatement("update student set course=? where sid=?");
			pstmt.setString(1,course);
			pstmt.setInt(2,sid);
			pstmt1.setString(1,professor);
			pstmt1.setInt(2,sid);
			int x=pstmt.executeUpdate();
			int y=pstmt1.executeUpdate();
			if(x>0)
			{
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean changepass(String newpassword) {
		try {
			pstmt=con.prepareStatement("update student set spass=? where sid=? and spass=?");
			pstmt.setString(1,newpassword);
			pstmt.setInt(2,sid);
			pstmt.setString(3,spass);

			int x=pstmt.executeUpdate();
			if(x>0)
			{
				return true;
			}
			else
			{
				return false;

			} 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	
	
}