<%@ page import="java.sql.*, javax.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background: url('2.jpg') no-repeat center center fixed; /* Background image */
            background-size: cover;
        }
        .header, .footer {
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black */
            color: #ffffff;
            padding: 15px;
            text-align: center;
            border: 2px solid #ffcc00; /* Yellow border */
        }
        .footer {
            margin-top: auto;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }
        .details {
            background-color: rgba(0, 0, 0, 0.6); /* Transparent dark block */
            border-radius: 12px;
            color: #ffffff;
            padding: 20px;
            width: 80%;
            max-width: 600px;
            text-align: center;
        }
        .details h2 {
            margin-top: 0;
        }
        .details p {
            font-size: 1.2em;
            margin: 10px 0;
        }
        .back-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #ffcc00; /* Yellow button */
            color: black;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
        }
        .back-button:hover {
            background-color: #ffaa00; /* Darker yellow on hover */
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Teacher Details</h1>
    </div>
    
    <div class="container">
        <div class="details">
            <%
                // Database connection details
                String jdbcURL = "jdbc:mysql://localhost:3306/school_database";
                String dbUser = "root";
                String dbPassword = "UmaMahesh@9";
                
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                
                try {
                    // Get ID from URL
                    String id = request.getParameter("id");
                    
                    // Establish database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                    
                    // SQL query to fetch teacher details
                    String sql = "SELECT t_name, phone_number, address FROM teacher WHERE t_id = ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, id);
                    
                    rs = stmt.executeQuery();
                    
                    // Check if results are found
                    if (rs.next()) {
                        String name = rs.getString("t_name");
                        String phoneNumber = rs.getString("phone_number");
                        String address = rs.getString("address");
            %>
                        <h2>Teacher Details</h2>
                        <p><strong>Name:</strong> <%= name %></p>
                        <p><strong>Phone Number:</strong> <%= phoneNumber %></p>
                        <p><strong>Address:</strong> <%= address %></p>
            <%
                    } else {
                        out.println("<p>No teacher found with ID " + id + "</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error retrieving data</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
            <button class="back-button" onclick="window.history.back()">Back</button>
        </div>
    </div>
    
    <div class="footer">
        <p>PNM High School © 2024</p>
    </div>
</body>
</html>
