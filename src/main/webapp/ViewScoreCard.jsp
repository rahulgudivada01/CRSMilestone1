<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>

<html>

<!DOCTYPE html>

<html>

<head>

  <style>

      @import url('https://fonts.googleapis.com/css2?family=Lobster&family=Ysabeau+SC:wght@600&display=swap');

    /* Reset some default styling */

    body, h1, table {
    

      margin: 0;

      padding: 0;

    }

 

    /* Global styling */

    body {
      		font-family: Arial, sans-serif;
			background-image: url('https://static.tumblr.com/bcbf0b78bc5299592586b895192c3eda/sza0yfa/EOjp5i8lw/tumblr_static_tumblr_static_d1unhgq4n74s0gk0c00kccgk0_focused_v3.jpg');
    }

    h1 {

        text-align: center;

        color: black;

        font-family: 'Lobster', cursive;

        font-family: 'Ysabeau SC', sans-serif;
       

    }

 

    .report-container {

      display: flex;

      flex-direction: column;

      align-items: center;

      justify-content: center;

      min-height: 100vh;

    }

 

    .report-header {

      font-size: 36px;

      font-weight: bold;

      margin-bottom: 20px;

    }

    

    .student-details {

    text-align: left;

    padding: 20px;

    margin-bottom: 10px;

 

    box-sizing: border-box;

      }

 

    .report-table {

      width: 80%;

      margin: 0 auto;

      border-collapse: collapse;

      box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;

      background-color: #ffffff;

    }

 

    .report-table th,

    .report-table td {

      padding: 10px;

      text-align: center;

      border: 5px solid #d9d9d9;

    }

 

    .report-table th {

      background-color: #f0f0f0;

    }

 

    .numeric {

      font-family: monospace;

    }

 

    .button-container {

      margin-top: 20px;

    }

 

    .back-button {

      display: inline-block;

      padding: 10px 20px;

      background-color: #f0f0f0;

      box-shadow: 6px 6px 12px #d9d9d9;

      border: none;

      cursor: pointer;

      text-decoration: none;

      color: #333;

      font-weight: bold;

      transition: background-color 0.3s ease-in-out;

    }

 

    .back-button:hover {

      background-color: #e0e0e0;

    }

  </style>

  <meta charset="UTF-8">

  <title>Report Card</title>

</head>

<body>

  <div class="report-container">

    <h1 class="report-header">Report Card</h1>

    <div class="student-details">

          <strong>Student ID:</strong> <%= session.getAttribute("sid") %><br><br>

          <strong>Student Name:</strong> <%= session.getAttribute("sname") %><br><br>

          <strong>Email:</strong> <%= session.getAttribute("email") %>

    </div>

    <table class="report-table">

      <tr>

        <th>Student ID</th>

        <th>Student Name</th>

        <th>Email ID</th>

        <th>Course</th>

        <th>Marks</th>
        
        <th> Professor</th>

      </tr>

      <%

        PreparedStatement pstmt = null;

        Connection con = null;

        ResultSet resultSet = null;

        try {

          Class.forName("com.mysql.cj.jdbc.Driver");

          String url = "jdbc:mysql://localhost:3306/crs";

          String user = "root";

          String pwd = "Rahulg01*";

          con = DriverManager.getConnection(url, user, pwd);

          pstmt = con.prepareStatement("SELECT * FROM student where sid=?");
          int sid=(int)session.getAttribute("sid");
          pstmt.setInt(1,sid);
          resultSet = pstmt.executeQuery();

          while (resultSet.next()) {

      %>

      <tr>

        <td><%= resultSet.getInt("sid") %></td>

        <td><%= resultSet.getString("sname") %></td>

        <td><%= resultSet.getString("email") %></td>

        <td><%= resultSet.getString("course") %></td>

        <td class="numeric"><%= resultSet.getInt("marks") %></td>

        <td><%= resultSet.getString("professor") %></td>

      </tr>

      <%

          }

        } catch (Exception e) {

          out.println(e);

        } finally {

          if (resultSet != null) resultSet.close();

          if (pstmt != null) pstmt.close();

          if (con != null) con.close();

        }

      %>

    </table>

    <div class="button-container">

      <a class="back-button" href="StudentHomePage.html">Back to Student Services</a>

    </div>

  </div>

</body>

</html>