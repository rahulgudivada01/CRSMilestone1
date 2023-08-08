<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="ISO-8859-1">

    <title>Select which course you want to take.</title>

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

        .view-button {

            margin-top: 20px;

            margin-left: auto;

            margin-right: auto;

            padding: 10px 20px;

            background-color: #f0f0f0;

            box-shadow: 6px 6px 12px #d9d9d9;

            border: none;

            cursor: pointer;

            text-decoration: none;

            color: #333;

            font-weight: bold;

            display: block;

        }

        .input-group {

            display: flex;

            flex-direction: column;

            align-items: center;

            margin-top: 20px;

        }

        label, input {

            margin-bottom: 10px;

        }

    </style>

</head>

<body>

<div class="container">

    <h2>Select a Course</h2>

    <table class="neumorphic-table" border="1">

        <tr>

            <th>Course ID</th>

            <th>Course Name</th>

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

                String sql = "select cid, cname from course";

                stmt = con.createStatement();

                resultSet = stmt.executeQuery(sql);

                while (resultSet.next()) {

        %>

        <tr>

            <td><%=resultSet.getInt(1)%></td>

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

    <form action="AddcoursetoProfessor" method="post" class="input-group">

        <label> Please Enter Professor Name: </label>

        <input type="text" name="pname">

        <label> Please Select Course ID</label>

        <input type="text" name="cid">

        <label> Please Select Course Name</label>

        <input type="text" name="course">

        <input type="submit" value="Submit" class="view-button">

    </form>

</div>

</body>

</html>