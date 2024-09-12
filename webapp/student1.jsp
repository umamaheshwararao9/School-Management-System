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

        .button-container {
            margin-top: 20px;
        }

        .button-container button {
            background-color: #555;
            color: #f0f0f0;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1em;
            cursor: pointer;
            margin: 0 10px;
            transition: background-color 0.3s;
        }

        .button-container button:hover {
            background-color: #777;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #f0f0f0;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Your Student Details</h1>
    </div>

    <div class="main-content">
        <h2>Student Details</h2>
        <%
            // Retrieve ID from URL
            String idStr = request.getParameter("id");
            int id = 0;
            int calculatedNumber = 0;

            // Database connection parameters
            String dbUrl = "jdbc:mysql://localhost:3306/school_database";
            String dbUser = "root";
            String dbPassword = "UmaMahesh@9";
            
            try {
                if (idStr != null && !idStr.isEmpty()) {
                    id = Integer.parseInt(idStr);

                    // Perform the calculation for calculatedNumber
                    int r = id % 10;
                    int num = id / 10;
                    int remainder = num % 100;
                    int result = remainder + 1;
                    calculatedNumber = 2000 + result;

                    // Adjust for remainder being 0
                    if (r == 0) {
                        calculatedNumber -= 1;
                    }

                    // Connect to the database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                    Statement stmt = conn.createStatement();
                    String query = "SELECT name, id, age, grade, section FROM student WHERE id = " + id;
                    ResultSet rs = stmt.executeQuery(query);

                    // Check if student record is found
                    if (rs.next()) {
                        String name = rs.getString("name");
                        int age = rs.getInt("age");
                        String grade = rs.getString("grade");
                        String section = rs.getString("section");
        %>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Grade</th>
                <th>Section</th>
            </tr>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= age %></td>
                <td><%= grade %></td>
                <td><%= section %></td>
            </tr>
        </table>

        <%
                    } else {
                        out.println("<p class='error'>No student found with the provided ID.</p>");
                    }

                    // Close resources
                    rs.close();
                    stmt.close();
                    conn.close();
                }
            } catch (Exception e) {
                out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
            }
        %>

        <div class="button-container">
            <button onclick="window.history.back()">Back</button>
            <button onclick="location.href='TeacherHome.jsp?id=<%= calculatedNumber %>'">Teacher Home</button>
        </div>
    </div>

    <div class="footer">
        <p>PNM High School &copy; 2024</p>
    </div>
</body>
</html>
