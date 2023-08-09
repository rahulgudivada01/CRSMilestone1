<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>

<html>

<head>

  <meta charset="ISO-8859-1">

  <title>Remove Courses</title>

<style>

    body {

  font-family: sans-serif;

     background-image: url('https://static.tumblr.com/bcbf0b78bc5299592586b895192c3eda/sza0yfa/EOjp5i8lw/tumblr_static_tumblr_static_d1unhgq4n74s0gk0c00kccgk0_focused_v3.jpg');
   		background-size: cover;
  

}

 

h1 {

  text-align: center;

  margin-top: 20px;

}

 

table {

  width: 100%;

  border-collapse: collapse;

}

 

th, td {

  border: 1px solid black;

  padding: 10px;

}

 

input[type="text"] {

  width: 200px;

  border: 1px solid #ccc;

  padding: 10px;

  margin-bottom: 10px;

  outline: none;

  box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.1);

  -webkit-transition: all 0.3s ease-in-out;

  -moz-transition: all 0.3s ease-in-out;

  -o-transition: all 0.3s ease-in-out;

  transition: all 0.3s ease-in-out;

}

 

input[type="text"]:focus {

  border-color: #333;

  box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.2);

}

 

input[type="submit"] {

  background-color: #333;

  color: white;

  padding: 10px 20px;

  border: none;

  cursor: pointer;

  outline: none;

  box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.2);

  -webkit-transition: all 0.3s ease-in-out;

  -moz-transition: all 0.3s ease-in-out;

  -o-transition: all 0.3s ease-in-out;

  transition: all 0.3s ease-in-out;

}

 

input[type="submit"]:hover {

  background-color: #222;

}

 

.animated {

  -webkit-animation: pulse 1s infinite;

  -moz-animation: pulse 1s infinite;

  -o-animation: pulse 1s infinite;

  animation: pulse 1s infinite;

}

 

@keyframes pulse {

  0% {

    transform: scale(1);

  }

  50% {

    transform: scale(1.1);

  }

  100% {

    transform: scale(1);

  }

}

</style>

</head>

<body>

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

    String sql = "select * from course";

    stmt = con.createStatement();

    resultSet = stmt.executeQuery(sql);

%>

  <h1>REMOVE COURSES</h1>

  <table border="1">

    <tr>

      <th>Course ID</th>

      <th>Course Name</th>

      <th>Fees</th>

      <th>Duration Month</th>

    </tr>

<%

    while (resultSet.next()) {

%>

    <tr>

      <td><%=resultSet.getInt(1)%></td>

      <td><%=resultSet.getString(2)%></td>

      <td><%=resultSet.getInt(3)%></td>

      <td><%=resultSet.getInt(4)%></td>

    </tr>

<%

    }

  } catch (Exception e) {

    out.println(e);

  }

%>

  </table>

  <br>

  <form action="RemoveCourse" method="post">

    <label>Enter Course ID to be deleted:</label>

    <input type="text" name="cid"><br><br>

    <input type="submit" value="Delete">

  </form>

</body>

</html>