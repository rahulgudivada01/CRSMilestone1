package com.digit.mvcApp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class users{
	String username;
	String password;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet res1;
	public users() {
		String url="jdbc:mysql://localhost:3306/crs";
		String user="root";
		String pwd="Rahulg01*";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,user,pwd);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean login() {
		try {
			pstmt = con.prepareStatement("select * from users where username=? and password=?");
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			res1= pstmt.executeQuery();
			if(res1.next()==true) {
					this.setUsername(res1.getString("username"));
					this.setPassword(res1.getString("password"));
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
}