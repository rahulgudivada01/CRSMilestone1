<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management</title>
    <style>
   		@import url('https://rsms.me/inter/inter-ui.css');
        @import url('https://fonts.googleapis.com/css2?family=Lobster&family=Ysabeau+SC:wght@600&display=swap');
         :root {
            /* color type A */
            --line_color: #555555;
            --back_color: #FFECF6;
        }
        body{
        background-image: url('https://static.tumblr.com/bcbf0b78bc5299592586b895192c3eda/sza0yfa/EOjp5i8lw/tumblr_static_tumblr_static_d1unhgq4n74s0gk0c00kccgk0_focused_v3.jpg');
   		background-size: cover;      
        }
        h1 {
            text-align: center;
            color: black;
            font-family: 'Lobster', cursive;
            font-family: 'Ysabeau SC', sans-serif;
        }
        .button-container {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            gap: 20px;
            height: 60vh;
            /* adjust the height of then button*/
        }
        .button {
            position: relative;
            z-index: 0;
            width: 240px;
            height: 56px;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            color: black;
            letter-spacing: 2px;
            transition: all .3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .button::before,
        .button::after,
        .button__text::before,
        .button__text::after {
            content: '';
            position: absolute;
            height: 3px;
            border-radius: 2px;
            background: black;
            transition: all .5s ease;
        }
        .button::before {
            top: 0;
            left: 54px;
            width: calc(100% - 56px * 2 - 16px);
        }
        .button::after {
            top: 0;
            right: 54px;
            width: 8px;
        }
        .button__text::before {
            bottom: 0;
            right: 54px;
            width: calc(100% - 56px * 2 - 16px);
        }
        .button__text::after {
            bottom: 0;
            left: 54px;
            width: 8px;
        }
        .button__line {
            position: absolute;
            top: 0;
            width: 56px;
            height: 100%;
            overflow: hidden;
        }
        .button__line::before {
            content: '';
            position: absolute;
            top: 0;
            width: 150%;
            height: 100%;
            box-sizing: border-box;
            border-radius: 300px;
            border: solid 3px black;
        } 
        .button__line:nth-child(1),

        .button__line:nth-child(1)::before {

            left: 0;

        }

 

        .button__line:nth-child(2),

        .button__line:nth-child(2)::before {

            right: 0;

        }

 

        .button:hover {

            letter-spacing: 6px;

        }

 

        .button:hover::before,

        .button:hover .button__text::before {

            width: 8px;

        }

 

        .button:hover::after,

        .button:hover .button__text::after {

            width: calc(100% - 56px * 2 - 16px);

        }

 

        .button__drow1,

        .button__drow2 {

            position: absolute;

            z-index: -1;

            border-radius: 16px;

            transform-origin: 16px 16px;

        }

 

        .button__drow1 {

            top: -16px;

            left: 40px;

            width: 32px;

            height: 0;

            transform: rotate(30deg);

        }

 

        .button__drow2 {

            top: 44px;

            left: 77px;

            width: 32px;

            height: 0;

            transform: rotate(-127deg);

        }

 

        .button__drow1::before,

        .button__drow1::after,

        .button__drow2::before,

 

        .button__drow2::after {

            content: '';

            position: absolute;

        }

 

        .button__drow1::before {

            bottom: 0;

            left: 0;

            width: 0;

            height: 32px;

            border-radius: 16px;

            transform-origin: 16px 16px;

            transform: rotate(-60deg);

        }

 

        .button__drow1::after {

            top: -10px;

            left: 45px;

            width: 0;

            height: 32px;

            border-radius: 16px;

            transform-origin: 16px 16px;

            transform: rotate(69deg);

        }

 

        .button__drow2::before {

            bottom: 0;

            left: 0;

            width: 0;

            height: 32px;

            border-radius: 16px;

            transform-origin: 16px 16px;

            transform: rotate(-146deg);

        }

 

        .button__drow2::after {

            bottom: 26px;

            left: -40px;

            width: 0;

            height: 32px;

            border-radius: 16px;

            transform-origin: 16px 16px;

            transform: rotate(-262deg);

        }

 

        .button__drow1,

        .button__drow1::before,

        .button__drow1::after,

        .button__drow2,

        .button__drow2::before,

        .button__drow2::after {

            background: var(--back_color);

        }

 

        .button:hover .button__drow1 {

            animation: drow1 ease-in .06s;

            animation-fill-mode: forwards;

        }

 

        .button:hover .button__drow1::before {

            animation: drow2 linear .08s .06s;

            animation-fill-mode: forwards;

        }

 

        .button:hover .button__drow1::after {

            animation: drow3 linear .03s .14s;

            animation-fill-mode: forwards;

        }

 

        .button:hover .button__drow2 {

            animation: drow4 linear .06s .2s;

            animation-fill-mode: forwards;

        }

 

        .button:hover .button__drow2::before {

            animation: drow3 linear .03s .26s;

            animation-fill-mode: forwards;

        }

 

        .button:hover .button__drow2::after {

            animation: drow5 linear .06s .32s;

            animation-fill-mode: forwards;

        }

 

        @keyframes drow1 {

            0% {

                height: 0;

            }

 

            100% {

                height: 100px;

            }

        }

 

        @keyframes drow2 {

            0% {

                width: 0;

                opacity: 0;

            }

 

            10% {

                opacity: 0;

            }

 

            11% {

                opacity: 1;

            }

 

            100% {

                width: 120px;

            }

        }

 

        @keyframes drow3 {

            0% {

                width: 0;

            }

 

            100% {

                width: 80px;

            }

        }

 

        @keyframes drow4 {

            0% {

                height: 0;

            }

 

            100% {

                height: 120px;

            }

        }

 

        @keyframes drow5 {

            0% {

                width: 0;

            }

 

            100% {

                width: 124px;

            }

        }

 

        .container {

            width: 100%;

            height: 300px;

            display: flex;

            flex-direction: column;

            justify-content: center;

            align-items: center;

        }

    </style>

</head>

 

<body>

    <h1>Admin_Interface</h1>    

    <div class="button-container">

        <a class="button" href="AddCourse.html">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">Add Course</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="AddProfessor.html">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">Add Professor</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="AddStudent.html">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">Add Student</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="RemoveCourse.jsp">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">Remove Courses</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="RemoveProfessor.jsp">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">Remove Professor</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="RemoveStudent.jsp">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">Remove Student</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="ViewCourse.jsp">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">View All Course</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="ViewProfessor.jsp">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">View All Professor</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="ViewStudent.jsp">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">View all Student</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="ViewUsers.jsp">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">View All Users</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

        <a class="button" href="Logout">

            <div class="button__line"></div>

            <div class="button__line"></div>

            <span class="button__text">Logout</span>

            <div class="button__drow1"></div>

            <div class="button__drow2"></div>

        </a>

    </div>

</body>

 

</html>