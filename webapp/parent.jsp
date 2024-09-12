<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

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
}

/* Background image */
body {
    background: url('2.jpg') no-repeat center center fixed;
    background-size: cover;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

/* Header styles */
.header {
    background-color: #333; /* Dark gray */
    color: #f0f0f0; /* Light gray text */
    text-align: center;
    padding: 20px;
    position: relative;
}

.header h1 {
    margin: 0;
    font-size: 2em;
}

.header .home-button {
    position: absolute;
    top: 20px;
    right: 20px;
    background-color: #555; /* Medium gray */
    color: #f0f0f0; /* Light gray text */
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s;
}

.header .home-button:hover {
    background-color: #777; /* Lighter gray on hover */
}

/* Footer styles */
.footer {
    background-color: #333; /* Dark gray */
    color: #f0f0f0; /* Light gray text */
    text-align: center;
    padding: 10px;
    margin-top: auto;
}

/* Main content box */
.main-content {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 20px;
    background-color: rgba(255, 255, 255, 0.85);
    border-radius: 10px;
    margin: 50px auto;
    width: 80%;
    max-width: 800px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.main-content h2 {
    margin-top: 0;
    color: #333;
}

.main-content table {
    width: 100%;
    border-collapse: collapse;
}

.main-content table, th, td {
    border: 1px solid #ddd;
}

.main-content th, td {
    padding: 12px;
    text-align: left;
}

.main-content th {
    background-color: #4a4a4a; /* Darker gray */
    color: white;
}

.main-content td {
    background-color: #f2f2f2; /* Light gray for table cells */
}

.main-content table tr {
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.main-content table tr:hover {
    background-color: #ddd; /* Light gray when hovering over the row */
}

    </style>

    <script>
        // Function to redirect when a row is clicked
        function redirectToStudentPage(studentId) {
            window.location.href = 'student.jsp?id=' + studentId;
        }
    </script>
</head>
<body>
    <div class="header">
        <h1>Your Student Details</h1>
        <button class="home-button" onclick="location.href='ParentHome.jsp?id=<%= request.getParameter("id") %>'">Home</button>
    </div>

    <div class="main-content">
        <h2>Parent Details</h2>
        <%
            // Retrieve the ID from the URL
            String id = request.getParameter("id");

            if (id != null && !id.isEmpty()) {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    // Database credentials
                    String url = "jdbc:mysql://localhost:3306/school_database";
                    String username = "root";
                    String password = "UmaMahesh@9";

                    // Establishing connection to MySQL
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(url, username, password);

                    // SQL Query to fetch parent details
                    String query = "SELECT p_name, p_id, phone_number, address FROM parent WHERE p_id = ?";
                    
                    ps = conn.prepareStatement(query);
                    ps.setString(1, id);
                    rs = ps.executeQuery();

                    // Check if a result exists
                    if (rs.next()) {
                        String parentName = rs.getString("p_name");
                        String parentId = rs.getString("p_id");
                        String phoneNumber = rs.getString("phone_number");
                        String address = rs.getString("address");

                        // Display parent details in table format
                        out.println("<table>");
                        out.println("<tr><th>Parent Name</th><td>" + parentName + "</td></tr>");
                        out.println("<tr><th>Parent ID</th><td>" + parentId + "</td></tr>");
                        out.println("<tr><th>Phone Number</th><td>" + phoneNumber + "</td></tr>");
                        out.println("<tr><th>Address</th><td>" + address + "</td></tr>");
                        out.println("</table>");
                    } else {
                        out.println("<p>No parent found with ID: " + id + "</p>");
                    }

                    // SQL Query to fetch student IDs associated with the parent
                    String psQuery = "SELECT s_id FROM p_s WHERE p_id = ?";
                    ps = conn.prepareStatement(psQuery);
                    ps.setString(1, id);
                    rs = ps.executeQuery();

                    // Display student details
                    out.println("<h2>Your Children/Child</h2>");
                    out.println("<table>");
                    out.println("<tr><th>Child ID</th><th>Child Name</th><th>Grade</th><th>Section</th><th>Age</th></tr>");

                    boolean hasChildren = false;
                    while (rs.next()) {
                        String studentId = rs.getString("s_id");

                        // Fetch details for each student ID
                        String studentQuery = "SELECT name, id, grade, section, age FROM student WHERE id = ?";
                        ps = conn.prepareStatement(studentQuery);
                        ps.setString(1, studentId);
                        ResultSet studentRs = ps.executeQuery();
                        
                        if (studentRs.next()) {
                            hasChildren = true;
                            String studentName = studentRs.getString("name");
                            String grade = studentRs.getString("grade");
                            String section = studentRs.getString("section");
                            String age = studentRs.getString("age");

                            // Output clickable table rows for each student
                            out.println("<tr onclick=\"redirectToStudentPage('" + studentId + "')\">");
                            out.println("<td>" + studentId + "</td>");
                            out.println("<td>" + studentName + "</td>");
                            out.println("<td>" + grade + "</td>");
                            out.println("<td>" + section + "</td>");
                            out.println("<td>" + age + "</td>");
                            out.println("</tr>");
                        }

                        studentRs.close();
                    }

                    if (!hasChildren) {
                        out.println("<tr><td colspan='5'>No children found for this parent.</td></tr>");
                    }

                    out.println("</table>");
                    
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error fetching details. Please try again later.</p>");
                } finally {
                    // Close all resources
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            } else {
                out.println("<p>No ID provided in the URL.</p>");
            }
        %>
    </div>

    <div class="footer">
        <p>PNM High School &copy; 2024</p>
    </div>
</body>
</html>
