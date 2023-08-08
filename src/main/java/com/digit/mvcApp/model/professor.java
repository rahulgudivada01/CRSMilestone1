package com.digit.mvcApp.model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class professor {
	int pid;
	String pname;
	String ppass;
	int exp;
	String course;
	int cid;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet res1;
	public professor() {
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
	public int getPid() {
		return pid;
	}
	public String getPname() {
		return pname;
	}
	public String getPpass() {
		return ppass;
	}
	public int getExp() {
		return exp;
	}
	public String getCourse() {
		return course;
	}
	public int getCid() {
		return cid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public void setPpass(String ppass) {
		this.ppass = ppass;
	}
	public void setExp(int exp) {
		this.exp = exp;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public boolean login() {
		try {
			pstmt = con.prepareStatement("select * from professor where pname=? and ppass=?");
			pstmt.setString(1, pname);
			pstmt.setString(2, ppass);
			res1= pstmt.executeQuery();

			if(res1.next()==true) {
				this.setPid(res1.getInt("pid"));
				this.setPname(res1.getString("pname"));
				this.setPpass(res1.getString("ppass"));
				this.setExp(res1.getInt("exp"));
				this.setCourse(res1.getString("course"));
				this.setCid(res1.getInt("cid"));
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
	public boolean changepass(int pid,String newpassword)
	{
		try {
			pstmt=con.prepareStatement("update professor set ppass=? where pid=? and ppass=?");
			pstmt.setString(1,newpassword);
			pstmt.setInt(2,pid);
			pstmt.setString(3,ppass);

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
	public boolean addprofessor() {
		try {
			pstmt = con.prepareStatement("insert into professor(pname,ppass,exp) values(?,?,?)");
			pstmt.setString(1,pname);
			pstmt.setString(2,ppass);
			pstmt.setInt(3,exp);
			int x=pstmt.executeUpdate();
			if(x>0)
			{
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
	public boolean addcourse() {
		try {
			pstmt=con.prepareStatement("update professor set course=?,cid=? where pname=?");
			pstmt.setString(1,course);
			pstmt.setInt(2,cid);
			pstmt.setString(3, pname);
			int x=pstmt.executeUpdate();
			if(x>0)
			{
				return true;
			}
			else {
				return false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean removeprofessor() {
		try {
			pstmt = con.prepareStatement("delete from professor where pid=?");
			pstmt.setInt(1,pid);
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

}