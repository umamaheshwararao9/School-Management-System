<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Marks</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            text-align: center; /* Center-align text in body */
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        header h1 {
            margin: 0;
        }
        nav {
            display: flex;
            align-items: center;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin: 0 10px;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
        }
        .container {
            padding: 20px;
        }
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto; /* Center the table */
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .vertical-table {
            width: 100%;
            max-width: 600px; /* Set a maximum width for the table */
            margin: 0 auto; /* Center the table */
        }
        .vertical-table td {
            padding: 10px;
        }
        .vertical-table .label {
            font-weight: bold;
            text-align: right;
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <header>
        <h1>Your Details::</h1>
        <nav>
            <ul>
                <li><a href="StudentHome.jsp?id=${param.id}">Home</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>Student Marks Details</h2>
        <table class="vertical-table">
            <tbody>
                <%
                    // Retrieve the student ID from the URL
                    String studentId = request.getParameter("id");
                    
                    if (studentId != null && !studentId.isEmpty()) {
                        // Database connection details
                        String url = "jdbc:mysql://localhost:3306/school_database";
                        String user = "root";
                        String password = "UmaMahesh@9";

                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        try {
                            // Load the JDBC driver
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            // Connect to the database
                            conn = DriverManager.getConnection(url, user, password);

                            // Prepare the SQL query to get student marks
                            String marksQuery = "SELECT * FROM student_marks WHERE s_id = ?";
                            pstmt = conn.prepareStatement(marksQuery);
                            pstmt.setInt(1, Integer.parseInt(studentId));
                            
                            // Execute the query for marks
                            rs = pstmt.executeQuery();
                            
                            // Check if there is a result
                            if (rs.next()) {
                                int s_id = rs.getInt("s_id");
                                int t_id = rs.getInt("t_id");
                                int marks = rs.getInt("marks");
                                String className = rs.getString("class");
                                
                                // Prepare the SQL query to get student details
                                String studentQuery = "SELECT name, section FROM student WHERE id = ?";
                                pstmt = conn.prepareStatement(studentQuery);
                                pstmt.setInt(1, Integer.parseInt(studentId));
                                
                                // Execute the query for student details
                                ResultSet studentRs = pstmt.executeQuery();
                                
                                if (studentRs.next()) {
                                    String name = studentRs.getString("name");
                                    String section = studentRs.getString("section");
                                    
                                    // Prepare the SQL query to get teacher details
                                    String teacherQuery = "SELECT t_name, phone_number FROM teacher WHERE t_id = ?";
                                    pstmt = conn.prepareStatement(teacherQuery);
                                    pstmt.setInt(1, t_id);
                                    
                                    // Execute the query for teacher details
                                    ResultSet teacherRs = pstmt.executeQuery();
                                    
                                    if (teacherRs.next()) {
                                        String teacherName = teacherRs.getString("t_name");
                                        String phoneNumber = teacherRs.getString("phone_number");
                                        
                                        // Prepare the SQL query to get parent details
                                        String parentQuery = "SELECT p_id FROM p_s WHERE s_id = ?";
                                        pstmt = conn.prepareStatement(parentQuery);
                                        pstmt.setInt(1, Integer.parseInt(studentId));
                                        
                                        // Execute the query for parent ID
                                        ResultSet parentRs = pstmt.executeQuery();
                                        
                                        if (parentRs.next()) {
                                            int p_id = parentRs.getInt("p_id");
                                            
                                            // Prepare the SQL query to get parent details
                                            String parentDetailQuery = "SELECT p_name, phone_number FROM parent WHERE p_id = ?";
                                            pstmt = conn.prepareStatement(parentDetailQuery);
                                            pstmt.setInt(1, p_id);
                                            
                                            // Execute the query for parent details
                                            ResultSet parentDetailRs = pstmt.executeQuery();
                                            
                                            if (parentDetailRs.next()) {
                                                String parentName = parentDetailRs.getString("p_name");
                                                String parentPhoneNumber = parentDetailRs.getString("phone_number");
                %>
                <tr>
                    <td class="label">Student ID:</td>
                    <td><%= s_id %></td>
                </tr>
                <tr>
                    <td class="label">Name:</td>
                    <td><%= name %></td>
                </tr>
                <tr>
                    <td class="label">Class:</td>
                    <td><%= className %></td>
                </tr>
                <tr>
                    <td class="label">Section:</td>
                    <td><%= section %></td>
                </tr>
                <tr>
                    <td class="label">Marks:</td>
                    <td><%= marks %></td>
                </tr>
                <tr>
                    <td class="label">Teacher ID:</td>
                    <td><%= t_id %></td>
                </tr>
                <tr>
                    <td class="label">Teacher Name:</td>
                    <td><%= teacherName %></td>
                </tr>
                <tr>
                    <td class="label">Teacher's Phone Number:</td>
                    <td><%= phoneNumber %></td>
                </tr>
                <tr>
                    <td class="label">Parent Name:</td>
                    <td><%= parentName %></td>
                </tr>
                <tr>
                    <td class="label">Parent's Phone Number:</td>
                    <td><%= parentPhoneNumber %></td>
                </tr>
                <%
                                            } else {
                                                out.println("<tr><td colspan='2'>No parent details found for the given ID.</td></tr>");
                                            }
                                            parentDetailRs.close();
                                        } else {
                                            out.println("<tr><td colspan='2'>No parent ID found for the given student ID.</td></tr>");
                                        }
                                        parentRs.close();
                                    } else {
                                        out.println("<tr><td colspan='2'>No teacher details found for the given ID.</td></tr>");
                                    }
                                    teacherRs.close();
                                } else {
                                    out.println("<tr><td colspan='2'>No student details found for the given ID.</td></tr>");
                                }
                                studentRs.close();
                            } else {
                                out.println("<tr><td colspan='2'>No marks data found for the given ID.</td></tr>");
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close resources
                            try {
                                if (rs != null) rs.close();
                                if (pstmt != null) pstmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    } else {
                        out.println("<tr><td colspan='2'>No ID provided.</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>

    <footer>
        <p>&copy; 2024 Your Marks. All rights reserved.</p>
    </footer>
</body>
</html>
