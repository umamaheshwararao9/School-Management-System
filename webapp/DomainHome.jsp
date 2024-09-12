<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('2.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        header {
            background: #007bff;
            color: #fff;
            padding: 10px 20px;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header-content h1 {
            margin: 0;
        }
        .menu-icon {
            cursor: pointer;
            display: flex;
            flex-direction: column;
            gap: 5px;
        }
        .menu-icon div {
            width: 30px;
            height: 3px;
            background: #fff;
            border-radius: 2px;
        }
        .dropdown {
            display: none;
            position: absolute;
            top: 50px;
            right: 20px;
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            border: 1px solid #007bff;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            opacity: 0;
            transition: opacity 0.3s ease;
            margin-right: 1in; /* Moves the dropdown 1 inch to the left */
        }
        .dropdown.show {
            display: block;
            opacity: 1;
        }
        .dropdown button {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            border: none;
            color: #007bff;
            padding: 10px 15px;
            text-align: left;
            width: 100%;
            border-bottom: 1px solid #f4f4f4;
            cursor: pointer;
        }
        .dropdown button:last-child {
            border-bottom: none;
        }
        .dropdown button:hover {
            background: #007bff;
            color: #fff;
        }
        .container {
            flex: 1;
            width: 80%;
            max-width: 600px;
            background: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin: 80px auto 20px auto; /* Adjusted margin to account for fixed header */
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .profile {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }
        .profile img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 5px solid #007bff;
        }
        .profile h2 {
            margin: 10px 0;
            color: #333;
        }
        .profile p {
            color: #666;
            margin: 0;
        }
        .footer {
            background: #007bff;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <h1>Profile Page</h1>
            <div class="menu-icon" id="menuIcon">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <div class="dropdown" id="dropdownMenu">
            <button onclick="redirectTo('answer.jsp')">Answer Questions</button>
            <button onclick="redirectTo('insert_words.jsp')">Insert Words</button>
            <button onclick="redirectTo('delete.jsp')">Delete Word</button> <!-- New delete word button -->
            <button onclick="window.location.href='loginPage.jsp'">Sign Out</button>
        </div>
    </header>
    <div class="container">
        <div class="profile">
            <img src="pass_photo.png" alt="Profile Picture">
            <h2>Uma Maheshwara Rao Merugumilli</h2>
            <p>Domain user</p>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Your Company. All Rights Reserved.</p>
    </div>

    <script>
        const menuIcon = document.getElementById('menuIcon');
        const dropdownMenu = document.getElementById('dropdownMenu');
        let timeout;
        const params = new URLSearchParams(window.location.search);
        const id = params.get('id'); // Get id from URL

        menuIcon.addEventListener('mouseover', () => {
            clearTimeout(timeout);
            dropdownMenu.classList.add('show');
        });

        menuIcon.addEventListener('mouseleave', () => {
            timeout = setTimeout(() => {
                dropdownMenu.classList.remove('show');
            }, 500); // 0.5-second delay
        });

        dropdownMenu.addEventListener('mouseover', () => {
            clearTimeout(timeout);
            dropdownMenu.classList.add('show');
        });

        dropdownMenu.addEventListener('mouseleave', () => {
            timeout = setTimeout(() => {
                dropdownMenu.classList.remove('show');
            }, 500); // 0.5-second delay
        });

        function redirectTo(page) {
            if (id) {
                window.location.href = page + "?id=" + id;
            } else {
                window.location.href = page;
            }
        }
    </script>
</body>
</html>
