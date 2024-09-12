<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('2.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .login-container {
            width: 350px;
            padding: 40px;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
        }

        .login-container h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .textbox {
            margin-bottom: 20px;
        }

        .textbox input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #4cae4c;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>School Management System</h1>
        <form method="post">
            <div class="textbox">
                <input type="text" placeholder="ID" name="username" required>
            </div>
            <div class="textbox">
                <input type="password" placeholder="Password" name="password" required>
            </div>
            <button class="btn" type="submit">Login</button>
        </form>
        <% 
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String errorMessage = "";

            if (username != null && password != null) {
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    // Load JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    // Establish connection
                    String jdbcUrl = "jdbc:mysql://localhost:3306/school_database";
                    String dbUser = "root";
                    String dbPassword = "UmaMahesh@9";
                    conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                    
                    // Prepare and execute SQL query
                    String sql = "SELECT * FROM authentication WHERE id = ? AND password = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    rs = stmt.executeQuery();
                    
                    // Check if credentials are valid
                    if (rs.next()) {
                        // Determine the appropriate redirection based on ID range
                        int id = Integer.parseInt(username);
                        if (id >= 1001 && id <= 1300) {
                            response.sendRedirect("StudentHome.jsp?id=" + username);
                        } else if (id >= 2001 && id <= 2030) {
                            response.sendRedirect("TeacherHome.jsp?id=" + username);
                        } else if (id >= 3001 && id <= 3200) {
                            response.sendRedirect("ParentHome.jsp?id=" + username);
                        } else if (id == 5001) {
                            response.sendRedirect("DomainHome.jsp?id=" + username);
                        } else {
                            errorMessage = "Invalid ID.";
                        }
                    } else {
                        errorMessage = "Invalid ID or Password.";
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    errorMessage = "An error occurred.";
                } finally {
                    // Close resources
                    try { if (rs != null) rs.close(); } catch (Exception e) { }
                    try { if (stmt != null) stmt.close(); } catch (Exception e) { }
                    try { if (conn != null) conn.close(); } catch (Exception e) { }
                }
            }
        %>
        <% if (!errorMessage.isEmpty()) { %>
            <div class="error"><%= errorMessage %></div>
        <% } %>
    </div>
</body>
</html>
