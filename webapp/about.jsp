<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About PNM High School</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Background image */
        .background {
            background-image: url('2.jpg');
            height: 100%;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative;
        }

        /* Transparent overlay */
        .transparent-box {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(255, 255, 255, 0.85); /* White with more transparency */
            padding: 50px;
            text-align: center;
            border-radius: 10px;
            width: 75%; /* Increased width */
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
        }

        .transparent-box h1 {
            margin: 0;
            color: #333;
            font-size: 36px;
        }

        .transparent-box p {
            font-size: 18px;
            color: #555;
            line-height: 1.6;
        }

        .transparent-box ul {
            font-size: 18px;
            color: #555;
            text-align: left;
            margin: 20px 0 0 0;
        }

        .transparent-box ul li {
            margin-bottom: 10px;
        }

        /* Button style */
        .back-button {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .back-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="background">
        <!-- Back button -->
        <button class="back-button" onclick="window.history.back();">Back</button>
        <div class="transparent-box">
            <h1>PNM High School</h1>
            <p>Location: Kukatpally, Hyderabad</p>
            <p>PNM High School is a beautiful institution with a rich history of 50 years, providing high-quality education while ensuring affordability for all students.</p>
            <ul>
                <li><strong>Safety and Security:</strong> Our campus is equipped with state-of-the-art security systems, including surveillance cameras and secure entry points, ensuring a safe learning environment for all students.</li>
                <li><strong>Trust-based Education:</strong> PNM High School operates under a trust model, where the fees are kept minimal to ensure education is accessible to everyone, regardless of their financial background.</li>
                <li><strong>Beautiful Campus:</strong> The school has a well-maintained campus with green spaces, modern classrooms, and facilities that promote a vibrant and conducive atmosphere for learning.</li>
                <li><strong>Affordability:</strong> Despite offering a high-quality education, PNM High School is committed to keeping fees low, making it one of the most affordable schools in the region.</li>
            </ul>
        </div>
    </div>
</body>
</html>
