<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f0f0f0; /* Light gray background */
        }
        .header {
            background-color: #333; /* Dark gray */
            color: #fff;
            padding: 15px;
            text-align: center;
            font-size: 1.5em;
            border-bottom: 2px solid #666; /* Medium gray border */
        }
        .footer {
            background-color: #333; /* Dark gray */
            color: #fff;
            padding: 15px;
            text-align: center;
            font-size: 1em;
            border-top: 2px solid #666; /* Medium gray border */
            margin-top: 20px;
        }
        .main-content {
            padding: 20px;
            overflow-x: auto; /* Allow horizontal scrolling for wide tables */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff; /* White background for the table */
        }
        table, th, td {
            border: 1px solid #ccc; /* Gray border for table */
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2; /* Light gray for headers */
        }
        .block {
            background-color: #e0e0e0; /* Light gray block background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Slight shadow */
            margin-bottom: 20px;
        }
        .student-link {
            text-decoration: none;
            color: #0066cc; /* Blue color for links */
        }
        .student-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Student Records</h1>
    </div>
    <div class="main-content">
        <div class="block">
            <%
                // Database connection parameters
                String dbURL = "jdbc:mysql://localhost:3306/school_database";
                String dbUser = "root";
                String dbPassword = "UmaMahesh@9";

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    // Get ID from URL
                    String idParam = request.getParameter("id");
                    int id = 0;
                    if (idParam != null && !idParam.isEmpty()) {
                        try {
                            id = Integer.parseInt(idParam);
                        } catch (NumberFormatException e) {
                            out.println("Invalid ID format.");
                            return;
                        }
                    } else {
                        out.println("ID parameter is missing.");
                        return;
                    }

                    // Calculate remainder, min, and max
                    int remainder = id % 2000;
                    if (remainder < 1 || remainder > 30) {
                        out.println("Remainder is out of expected range.");
                        return;
                    }

                    int min = 1000 + 10 * (remainder - 1) + 1;
                    int max = 1000 + 10 * remainder;

                    // Connect to the database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

                    // Query to get students with IDs between min and max
                    String sql = "SELECT * FROM student WHERE id BETWEEN ? AND ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setInt(1, min);
                    pstmt.setInt(2, max);
                    rs = pstmt.executeQuery();

                    // Display the results in a table
                    out.println("<table>");
                    out.println("<thead>");
                    out.println("<tr><th>ID</th><th>Name</th><th>Age</th><th>Grade</th><th>Section</th></tr>");
                    out.println("</thead>");
                    out.println("<tbody>");

                    while (rs.next()) {
                        int studentId = rs.getInt("id");
                        out.println("<tr>");
                        out.println("<td><a href='student1.jsp?id=" + studentId + "' class='student-link'>" + studentId + "</a></td>");
                        out.println("<td>" + rs.getString("name") + "</td>");
                        out.println("<td>" + rs.getInt("age") + "</td>");
                        out.println("<td>" + rs.getString("grade") + "</td>");
                        out.println("<td>" + rs.getString("section") + "</td>");
                        out.println("</tr>");
                    }

                    out.println("</tbody>");
                    out.println("</table>");

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("An error occurred: " + e.getMessage());
                } finally {
                    // Close resources
                    try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 Your Company</p>
    </div>
</body>
</html>
