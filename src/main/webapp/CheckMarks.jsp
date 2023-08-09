<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>View All Students</title>

<style>

body {

    font-family: Arial, sans-serif;

    
   background-image: url('https://static.tumblr.com/bcbf0b78bc5299592586b895192c3eda/sza0yfa/EOjp5i8lw/tumblr_static_tumblr_static_d1unhgq4n74s0gk0c00kccgk0_focused_v3.jpg');
   		background-size: cover;

    margin: 0;

    padding: 0;

}

 

h1 {

    font-size: 24px;

    font-weight: bold;

    text-align: center;

    margin-top: 20px;

}

 

table {

    width: 80%;

    margin: auto;

    border-collapse: collapse;

    background-color: white;

    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);

}

 

th, td {

    padding: 10px;

    text-align: left;

}

 

th {

    background-color: #f2f2f2;

}

 

tr:nth-child(even) {

    background-color: #f2f2f2;

}

 

tr:hover {

    background-color: #e0e0e0;

}


a {

    display: inline-block;

    margin-top: 20px;

    text-decoration: none;

    padding: 10px 20px;

    background-color: #007bff;

    color: white;

    border-radius: 5px;

    transition: background-color 0.3s ease-in-out;

}

a:hover {

    background-color: #0056b3;

}

.neumorphic-table {

    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);

}

</style>

</head>

<body>

    <%

    PreparedStatement pstmt = null;

    Connection con = null;

    ResultSet resultSet = null;

    try {

        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://localhost:3306/crs";

        String user = "root";

        String pwd = "Rahulg01*";

        session = request.getSession();

        int sid = (int) session.getAttribute("sid");

        con = DriverManager.getConnection(url, user, pwd);

        pstmt = con.prepareStatement("select * from student where sid=?");

        pstmt.setInt(1, sid);

        resultSet = pstmt.executeQuery();

    %>

    <h1>View All Students</h1>

    <table class="neumorphic-table" border="1">

        <tr>

            <th>Student ID</th>

            <th>Student Name</th>

            <th>spass</th>

            <th>Email</th>

            <th>Course</th>

            <th>Marks</th>

            <th>Professor</th>

        </tr>

        <%

        while (resultSet.next()) {

        %>

        <tr>

            <td><%=resultSet.getInt(1)%></td>

            <td><%=resultSet.getString(2)%></td>

            <td><%=resultSet.getString(3)%></td>

            <td><%=resultSet.getString(4)%></td>

            <td><%=resultSet.getString(5)%></td>

            <td><%=resultSet.getInt(6)%></td>

            <td><%=resultSet.getString(7)%></td>

        </tr>

        <%

        }

        } catch (Exception e) {

        out.println(e);

        }

        %>

    </table>

    <br>

    <a href="StudHomePage.jsp">Back to Student Services</a>

</body>

</html>