<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Choose Courses</title>

<style>

  body {

    display: flex;

    flex-direction: column;

    align-items: center;

    justify-content: center;

    height: 100vh;

    margin: 0;

    background-color: #f0f0f0;

  }

 

  .container {

    text-align: center;

  }

 

  .neumorphic-table {

    width: 80%;

    margin: 0 auto;

    border-collapse: collapse;

    box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;

    background-color: #f0f0f0;

    opacity: 0;

    transform: translateY(20px);

    animation: fadeAndSlide 1s ease-out forwards;

    margin-bottom: 20px;

  }

 

  @keyframes fadeAndSlide {

    0% {

      opacity: 0;

      transform: translateY(20px);

    }

    100% {

      opacity: 1;

      transform: translateY(0);

    }

  }

 

  th, td {

    padding: 10px;

    text-align: center;

    border: 1px solid #d9d9d9;

  }

 

  label, input {

    display: block;

    margin: 10px 0;

  }

  form{

      text-align: center;

  }

 

  input[type="text"] {

    padding: 10px;

    border: none;

    border-radius: 5px;

    width: 250px;

    box-shadow: 3px 3px 6px #d9d9d9, -3px -3px 6px #ffffff;

  }

 

  input[type="submit"] {

    padding: 10px 20px;

    background-color: #f0f0f0;

    margin-top: 10px;

    box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;

    border: none;

    cursor: pointer;

    text-decoration: none;

    color: #333;

    font-weight: bold;

  }

 

  .header {

    font-size: 24px;

    font-weight: bold;

    margin-bottom: 20px;

  }

</style>

</head>

<body>

  <div class="container">

    <div class="header">Choose Courses</div>

    <table class="neumorphic-table">

      <tr>

        <th>Course Name</th>

        <th>Professor Name</th>

      </tr>

      <%

      Statement stmt = null;

      Connection con = null;

      ResultSet resultSet = null;

      try {

        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/crs";

        String user = "root";

        String pwd = "Rahulg01*";

        con = DriverManager.getConnection(url, user, pwd);

        String sql = "select c.cname,p.pname from course c ,professor p where p.course=c.cname";

        stmt = con.createStatement();

        resultSet = stmt.executeQuery(sql);

 

        while (resultSet.next()) {

      %>

      <tr>

        <td><%=resultSet.getString(1)%></td>

        <td><%=resultSet.getString(2)%></td>

      </tr>

      <%

        }

      } catch (Exception e) {

        out.println(e);

      } finally {

        try {

          if (resultSet != null) resultSet.close();

          if (stmt != null) stmt.close();

          if (con != null) con.close();

        } catch (Exception ex) {

          ex.printStackTrace();

        }

      }

      %>

    </table>

    <form action="StudCourse" method="post" class="neumorphic-form">

      <label>Enter the Course Name:</label>

      <input type="text" name="course">

      <label>Enter the Professor Name:</label>

      <input type="text" name="professor">

      <input type="submit" value="Submit">

    </form>

  </div>

</body>

</html>