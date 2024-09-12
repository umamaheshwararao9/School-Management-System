<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            height: 100vh;
            display: flex;
            flex-direction: column;
            background: #eaeaea; /* Light Gray Background */
        }
        .header {
            background-color: #4a90e2; /* Vibrant Blue */
            color: white;
            padding: 15px;
            text-align: center;
            border-bottom: 5px solid #357abd; /* Darker Blue */
        }
        .footer {
            background-color: #4a90e2; /* Vibrant Blue */
            color: white;
            padding: 15px;
            text-align: center;
            border-top: 5px solid #357abd; /* Darker Blue */
            margin-top: auto; /* Pushes the footer to the bottom */
        }
        .main-content {
            display: flex;
            flex: 1;
            padding: 20px;
            gap: 20px; /* Space between blocks */
            background: #ffffff; /* White background for blocks area */
        }
        .block {
            flex: 1;
            padding: 40px; /* Increased padding for more space */
            border: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            color: #fff; /* White text for better contrast */
            text-align: center;
            font-size: 1.5em; /* Larger font size */
            display: flex;
            align-items: center; /* Center text vertically */
            justify-content: center; /* Center text horizontally */
            transition: transform 0.3s, box-shadow 0.3s;
            cursor: pointer;
        }
        .block:hover {
            transform: scale(1.05); /* Slight zoom effect on hover */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }
        .block.middle {
            background: #f5a623; /* Orange */
        }
        .block {
            background: #ff6f61; /* Coral */
        }
        .top-right-menu {
            position: absolute;
            top: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            cursor: pointer;
            z-index: 1000; /* Ensures the menu is on top */
        }
        .top-right-menu div {
            width: 30px;
            height: 3px;
            background-color: #333;
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
            background: #ffffff; /* White background for suggestions */
            border: 1px solid #ccc;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            z-index: 1000; /* Ensures the suggestions box is on top */
        }
        .suggestions h2 {
            margin-top: 0;
            color: #4a90e2; /* Match header and footer */
        }
        .suggestions div {
            margin-top: 10px;
        }
        .suggestions h3 {
            margin: 10px 0;
            color: #333;
            cursor: pointer;
            transition: color 0.3s;
        }
        .suggestions h3:hover {
            color: #4a90e2; /* Highlight color on hover */
        }
        .sign-out {
            color: #fff;
            background-color: #e74c3c; /* Red background for sign out */
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
        }
        .sign-out:hover {
            background-color: #c0392b; /* Darker red for hover effect */
        }
    </style>
    <script>
        function redirectToPage(page, id) {
            window.location.href = page + "?id=" + id; // Append ID to URL
        }
        
        function getDynamicId() {
            // Get the query string from the URL
            const queryString = window.location.search;

            // Create a URLSearchParams object
            const urlParams = new URLSearchParams(queryString);
            // Get the value of a specific parameter
            const paramValue = urlParams.get('id');

            // Return the ID
            return paramValue; 
        }

        function signOut() {
            window.location.href = 'loginPage.jsp'; // Redirect to login page
        }

        function redirectToMiddle() {
            const id = getDynamicId();
            redirectToPage('middle.jsp', id); // Ensure ID is included in URL
        }

        function redirectToAboutSchool() {
            const id = getDynamicId();
            redirectToPage('about.jsp', id); // Redirect to about.jsp with ID
        }
    </script>
</head>
<body>
    <div class="header">
        <h1>Home Page.</h1>
    </div>
    <div class="main-content">
        <div class="block middle" onclick="redirectToMiddle()">Important Questions Asked by Students, Teachers, Parents</div>
        <div class="block" onclick="redirectToAboutSchool()">About School</div>
    </div>
    <div class="footer">
        <p>Footer Content</p>
    </div>
    <div class="top-right-menu">
        <div></div>
        <div></div>
        <div></div>
    </div>
    <div id="suggestions" class="suggestions">
        <h2>Suggestions</h2>
        <div>
            <h3 onclick="redirectToPage('questions.jsp', getDynamicId())">Ask a Question.</h3>
        </div>
        <div>
            <h3 onclick="redirectToPage('your_marks.jsp', getDynamicId())">Your Details.</h3>
        </div>
        <div>
            <h3 class="sign-out" onclick="signOut()">Sign Out</h3>
        </div>
    </div>
</body>
</html>
