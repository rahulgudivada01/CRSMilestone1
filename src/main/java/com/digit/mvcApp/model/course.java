package com.digit.mvcApp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class course {
	int cid;
	String cname;
	int fees;
	int dur_months;
	private Connection con;
	private PreparedStatement pstmt;
	public course() {
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
	public int getCid() {
		return cid;
	}
	public String getCname() {
		return cname;
	}
	public int getFees() {
		return fees;
	}
	public int getDur_months() {
		return dur_months;
	}
	public Connection getCon() {
		return con;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public void setFees(int fees) {
		this.fees = fees;
	}
	public void setDur_months(int dur_months) {
		this.dur_months = dur_months;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
	public boolean addcourse() {
		try {
			pstmt = con.prepareStatement("insert into course(cname,fees,dur_months) values(?,?,?)");
			pstmt.setString(1,cname);
			pstmt.setInt(2,fees);
			pstmt.setInt(3,dur_months);
			int x=pstmt.executeUpdate();
			if(x>0)
			{
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
	public boolean removecourse() {
		try {
			pstmt = con.prepareStatement("delete from course where cid=?");
			pstmt.setInt(1,cid);
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

