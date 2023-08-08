<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="ISO-8859-1">

    <title>View All Users</title>

    <style>

        body {

            display: flex;

            justify-content: center;

            align-items: center;

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

    </style>

</head>

<body>

<div class="container">

    <h2>View All Users</h2>

    <table class="neumorphic-table" border="1">

        <tr>

            <th>UserName</th>

            <th>Password</th>

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

                String sql = "select * from users";

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

        }

        %>

    </table>

    <br>

    <a href="AdminHomePage.jsp" class="back-link">Back to Admin Services</a>

</div>

</body>

</html>
