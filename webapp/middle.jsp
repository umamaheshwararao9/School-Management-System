<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responses</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            color: #333;
        }
        header {
            background-color: #4CAF50; /* Green background */
            color: #fff;
            padding: 15px;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: 2em;
        }
        nav {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }
        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        nav ul li {
            display: inline;
            margin: 0 15px;
        }
        nav ul li a {
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
        .container {
            padding: 20px;
            max-width: 900px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .question {
    background-color: #ffffff; /* White background */
    color: #000000; /* Black text */
}

        .answer {
            background-color: #d4edda; /* Light green */
        }
        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 15px;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Responses</h1>
        <nav>
            <ul>
                <li><a href="#" onclick="goBack()">Home</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h2>Response List</h2>
        <table>
            <thead>
                <tr>
                    <th>Question</th>
                    <th>Answer</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Database connection details
                    String url = "jdbc:mysql://localhost:3306/school_database";
                    String user = "root";
                    String password = "UmaMahesh@9";

                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                    	
                        // Load the JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Connect to the database
                        conn = DriverManager.getConnection(url, user, password);

                        // Create and execute the SQL query
                        stmt = conn.createStatement();
                        String query = "SELECT * FROM responce"; 
                        // No ORDER BY clause
   

                        rs = stmt.executeQuery(query);

                        // Display the data in the table
                        while (rs.next()) {
                        
                            String question = rs.getString("question");
                            String answer = rs.getString("answer");
                %>
                <tr>
                    <td class="question"><%= question %></td>
                    <td class="answer"><%= answer %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <footer>
        <p>&copy; 2024 Your Website. All rights reserved.</p>
    </footer>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
