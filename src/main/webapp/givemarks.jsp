<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>GIVE MARKS</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
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
            border: 3px solid #d9d9d9;
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
            margin-bottom: 20px;
        }

        .view-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #f0f0f0;
            box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
            border: none;
            cursor: pointer;
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }

        .form-container {
            margin-top: 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
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

        .form-container label,
        .form-container input {
            animation: fadeIn 1s ease-out forwards;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        input[type="text"] {
            width: 300px;
            padding: 10px;
            border: none;
            background-color: #f0f0f0;
            box-shadow: 6px 6px 12px #d9d9d9, -6px -6px 12px #ffffff;
            transition: all 0.3s ease-in-out;
            margin-bottom: 10px;
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
    <div class="header">Give Marks</div>
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
        PreparedStatement pstmt = null;
        Connection con = null;
        ResultSet resultSet = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/crs";
            String user = "root";
            String pwd = "Rahulg01*";
            session=request.getSession();
            String course=(String)session.getAttribute("course");
            con = DriverManager.getConnection(url, user, pwd);
            pstmt = con.prepareStatement("select * from student where course=?");
            pstmt.setString(1,course);
            resultSet = pstmt.executeQuery();
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
        } finally {
            if (resultSet != null) resultSet.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        }
        %>
    </table>
    <form class="form-container" action="GiveMarksController" method="post">
    	<br>
        <label>Enter Student Id</label>
        <br>
        <input type="text" name="sid"><br>
        <label>Enter marks</label>
        <br>
        <input type="text" name="marks">
        <input type="submit" class="view-button" value="Submit">
        <br>
        <br>
    </form>
    <div>
        <a class="view-button" href="ProfHomePage.jsp">Back to Professor Services</a>
    </div>
</div>
</body>
</html>