<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Beautiful JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        .header, .footer {
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: relative;
        }
        .header .back-button {
            position: absolute;
            right: 10px;
            top: 10px;
            padding: 5px 10px;
            background-color: #fff;
            color: #4CAF50;
            border: 1px solid #4CAF50;
            border-radius: 3px;
            text-decoration: none;
        }
        .content {
            display: flex;
            flex-direction: column;
            flex: 1;
        }
        .block {
            display: flex;
            flex-direction: column;
            align-items: center; /* Center horizontally */
            justify-content: center; /* Center vertically */
            flex: 1;
            height: 50vh; /* Fixed height for each block to cover half of the viewport height */
            background-color: #f1f1f1;
            border: 1px solid #ddd;
            margin: 10px;
            padding: 20px;
            border-radius: 5px;
            box-sizing: border-box;
            overflow-y: auto; /* Enables vertical scrolling */
            text-decoration: none;
            color: inherit;
            transition: background-color 0.3s, box-shadow 0.3s; /* Smooth transition for hover effect */
        }
        .block:nth-child(1) {
            background-color: #e3f2fd;
        }
        .block:nth-child(2) {
            background-color: #ffe0b2;
        }
        .block:hover {
            background-color: #d0e9ff; /* Change background color on hover */
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Add a shadow effect */
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Questions from Student, Parents, and Teachers</h1>
        <a href="DomainHome.jsp?id=<%= request.getParameter("id") %>" class="back-button">Back</a>
    </div>

    <div class="content">
        <a href="impq.jsp?id=<%= request.getParameter("id") %>" class="block">
            <h2>Import Question</h2>
            <!-- Content for Import Question -->
            <p>Here you can answer content related to import questions.</p>
        </a>
        
        <a href="q.jsp?id=<%= request.getParameter("id") %>" class="block">
            <h2>All Questions</h2>
            <!-- Content for All Equations -->
            <p>Here you can answer content related to all questions.</p>
        </a>
    </div>

    <div class="footer">
        <p>&copy; 2024 My Website</p>
    </div>
</body>
</html>
