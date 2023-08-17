

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Remove Student</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url('https://static.tumblr.com/bcbf0b78bc5299592586b895192c3eda/sza0yfa/EOjp5i8lw/tumblr_static_tumblr_static_d1unhgq4n74s0gk0c00kccgk0_focused_v3.jpg');
            background-size: cover;
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
            border: 3px solid black;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .view-button{
      		margin-top:20px;
      		padding:10px 20px;
      		background-color: #f0f0f0;
      		box-shadow: 6px 6px 12px #d9d9d9;
      		border: none;
      		cursor: pointer;
      		text-decoration: none;
   			color: #333;
      		font-weight: bold;
  		}
        

        .input-container {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        input[type="text"] {
            width: 300px;
            padding: 10px;
            border: none;
            background-color: #f0f0f0;
            box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
            transition: all 0.3s ease-in-out;
        }

        input[type="text"]:focus {
            outline: none;
            box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
        }

        input[type="submit"] {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            outline: none;
            box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #222;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="header">REMOVE STUDENT</h1>
    <table class="neumorphic-table">
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
        Statement stmt = null;
        Connection con = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/crs";
            String user = "root";
            String pwd = "Rahulg01*";
            con = DriverManager.getConnection(url, user, pwd);
            String sql = "select * from student";
            stmt = con.createStatement();
            resultSet = stmt.executeQuery(sql);
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
    <div class="input-container">
        <form action="RemoveStudent" method="post">
            <label>Enter Student ID to be deleted:</label>
            <input type="text" name="sid">
            <input type="submit" value="Delete">
            <br><br>
            <br>
            <a class="view-button" href="AdminHomePage.jsp">Back to Admin Services</a>
        </form>
    </div>
</div>
</body>
</html>