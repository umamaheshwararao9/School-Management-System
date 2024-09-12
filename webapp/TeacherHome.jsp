<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            height: 100vh;
            display: flex;
            flex-direction: column;
            background: url('3.jpg') no-repeat center center fixed; /* Background image */
            background-size: cover;
        }
        .header {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black */
            color: #ffffff;
            padding: 10px; /* Reduced padding */
            text-align: center;
            font-size: 1.5em; /* Reduced font size */
            border-bottom: 4px solid #ffcc00; /* Yellow border */
        }
        .footer {
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 10px; /* Reduced padding */
            text-align: center;
            border-top: 4px solid #ffcc00; /* Yellow border */
            margin-top: auto;
        }
        .main-content {
            display: flex;
            flex: 1;
            padding: 20px;
            gap: 20px;
        }
        .block {
            flex: 1;
            padding: 40px;
            border: none;
            background-color: rgba(0, 0, 0, 0.6); /* Transparent dark block */
            border-radius: 12px;
            color: #ffffff; /* White text */
            text-align: center;
            font-size: 1.5em;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* Elevated shadow */
        }
        .block:hover {
            transform: scale(1.05); /* Zoom effect on hover */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.5); /* Deeper shadow on hover */
        }
        .block.middle {
            background-color: rgba(255, 204, 0, 0.8); /* Yellow block */
            color: black;
        }
        .block {
            background-color: rgba(255, 87, 34, 0.8); /* Orange block */
        }
        .top-right-menu {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            cursor: pointer;
            z-index: 1000;
        }
        .top-right-menu div {
            width: 30px;
            height: 3px;
            background-color: #ffffff; /* White for better contrast */
            margin: 5px 0;
        }
        .suggestions {
            display: none;
        }
        .top-right-menu:hover + .suggestions,
        .suggestions:hover {
            display: block;
            position: absolute;
            top: 60px;
            right: 20px;
            background: rgba(255, 255, 255, 0.9); /* White with transparency */
            border: 1px solid #ffcc00; /* Yellow border */
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4); /* Shadow for suggestions */
            border-radius: 12px;
        }
        .suggestions h2 {
            margin-top: 0;
            color: #ffcc00; /* Match yellow accent */
        }
        .suggestions h3 {
            margin: 10px 0;
            color: #333;
            cursor: pointer;
            transition: color 0.3s;
        }
        .suggestions h3:hover {
            color: #ff6f61; /* Highlight color on hover */
        }
        .sign-out {
            color: #fff;
            background-color: #e74c3c;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
        }
        .sign-out:hover {
            background-color: #c0392b;
        }
    </style>
    <script>
        function redirectToPage(page, id) {
            window.location.href = page + "?id=" + id;
        }

        function getDynamicId() {
            const queryString = window.location.search;
            const urlParams = new URLSearchParams(queryString);
            const paramValue = urlParams.get('id');
            return paramValue; 
        }

        function signOut() {
            window.location.href = 'loginPage.jsp';
        }

        function redirectToMiddle() {
            const id = getDynamicId();
            redirectToPage('middle.jsp', id);
        }

        function redirectToAboutSchool() {
            const id = getDynamicId();
            redirectToPage('about.jsp', id);
        }

        function redirectToTeacher() {
            const id = getDynamicId();
            redirectToPage('teacher.jsp', id);
        }

        function redirectToYourStudents() {
            const id = getDynamicId();
            redirectToPage('students.jsp', id);
        }
    </script>
</head>
<body>
    <div class="header">
        <h1>Parent Home Page</h1>
    </div>
    <div class="main-content">
        <div class="block middle" onclick="redirectToMiddle()">Important Questions</div>
        <div class="block" onclick="redirectToAboutSchool()">About School</div>
    </div>
    <div class="footer">
        <p>PNM High School © 2024</p>
    </div>
    <div class="top-right-menu">
        <div></div>
        <div></div>
        <div></div>
    </div>
    <div id="suggestions" class="suggestions">
        <h2>Suggestions</h2>
        <div>
            <h3 onclick="redirectToPage('questions.jsp', getDynamicId())">Ask a Question</h3>
        </div>
        <div>
            <h3 onclick="redirectToTeacher()">Your Details</h3> <!-- Updated redirection -->
        </div>
        <div>
            <h3 onclick="redirectToYourStudents()">Your Students</h3> <!-- New suggestion -->
        </div>
        <div>
            <h3 class="sign-out" onclick="signOut()">Sign Out</h3>
        </div>
    </div>
</body>
</html>
