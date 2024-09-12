<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*, javax.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Student Details</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
        }

        body {
            background: url('2.jpg') no-repeat center center fixed;
            background-size: cover;
            flex: 1;
        }

        .header {
            background-color: #333;
            color: #f0f0f0;
            text-align: center;
            padding: 20px;
            position: relative;
        }

        .header h1 {
            margin: 0;
            font-size: 2em;
        }

        .header .header-buttons {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .header .header-buttons button {
            background-color: #555;
            color: #f0f0f0;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1em;
            cursor: pointer;
            margin-left: 10px;
            transition: background-color 0.3s;
        }

        .header .header-buttons button:hover {
            background-color: #777;
        }

        .footer {
            background-color: #333;
            color: #f0f0f0;
            text-align: center;
            padding: 10px;
            margin-top: auto;
        }

        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.85);
            border-radius: 10px;
            margin: 20px auto;
            width: 80%;
            max-width: 800px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }

        .main-content h2 {
            margin-top: 0;
            color: #333;
        }

        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <% 
        String s_id = request.getParameter("id");
        int p_id = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbUrl = "jdbc:mysql://localhost:3306/school_database";
        String dbUser = "root";
        String dbPassword = "UmaMahesh@9"; // Consider using environment variables or configuration files

        if (s_id != null && !s_id.isEmpty()) {
            try {
                int id = Integer.parseInt(s_id);

                // Determine the value to add based on the range
                if (id >= 1001 && id <= 1200) {
                    p_id = id + 2000;
                } else if (id >= 1201 && id <= 1300) {
                    p_id = id + 1800;
                } else {
                    p_id = id;
                }

                // Load MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                // Query to fetch student details
                String sql = "SELECT * FROM student WHERE id = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, id);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String name = rs.getString("name");
                    String age = rs.getString("age");
                    String grade = rs.getString("grade");
            %>

            <div class="header">
                <h1>Your Student Details</h1>
                <div class="header-buttons">
                    <button class="home-button" onclick="location.href='<%= "ParentHome.jsp?id=" + p_id %>'">Home</button>
                    <button class="back-button" onclick="location.href='<%= "parent.jsp?id=" + p_id %>'">Back</button>
                </div>
            </div>

            <div class="main-content">
                <h2>Student Details</h2>
                <p><strong>ID:</strong> <%= rs.getInt("id") %></p>
                <p><strong>Name:</strong> <%= name %></p>
                <p><strong>Age:</strong> <%= age %></p>
                <p><strong>Grade:</strong> <%= grade %></p>
                <!-- Add more fields here as necessary -->
            </div>

            <% 
                } else {
                    out.println("<p class='error'>No student found with ID " + id + "</p>");
                }
            } catch (NumberFormatException e) {
                out.println("<p class='error'>Invalid student ID format.</p>");
            } catch (Exception e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<p class='error'>Error closing resources: " + e.getMessage() + "</p>");
                }
            }
        } else {
            out.println("<p class='error'>Student ID is missing or empty.</p>");
        }
    %>

    <div class="footer">
        <p>PNM High School &copy; 2024</p>
    </div>
</body>
</html>
