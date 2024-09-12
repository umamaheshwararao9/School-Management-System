<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Data Display with Delete Option</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        h1 {
            text-align: center;
            color: #333;
            padding: 20px;
            background-color: #e2e2e2;
            border-bottom: 1px solid #ccc;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
            background-color: white;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        td {
            background-color: #f9f9f9;
        }
        button {
            background-color: #ff4c4c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        button:hover {
            background-color: #ff1a1a;
        }
        .back-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
            display: block;
            margin: 20px auto;
            text-align: center;
        }
    </style>
    <script>
        function confirmDelete(word) {
            if (confirm("Are you sure you want to delete this word: " + word + "?")) {
                window.location.href = "delete_word.jsp?word=" + word + "&id=<%= request.getParameter("id") %>";
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h1>Data from the Database</h1>

    <!-- Back Button -->
    <form method="get" action="DomainHome.jsp">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <button class="back-button" type="submit">Back</button>
    </form>

    <%
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/school_database";
        String username = "root";
        String password = "UmaMahesh@9";

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            conn = DriverManager.getConnection(url, username, password);

            // SQL query to fetch data
            String fetchQuery = "SELECT word FROM arr";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(fetchQuery);

            // Display the data in a table
            out.println("<table>");
            out.println("<tr><th>Word</th><th>Action</th></tr>");

            while (rs.next()) {
                String word = rs.getString("word");
                out.println("<tr>");
                out.println("<td>" + word + "</td>");
                out.println("<td><button onclick=\"confirmDelete('" + word + "')\">Delete</button></td>");
                out.println("</tr>");
            }
            out.println("</table>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>

</div>

</body>
</html>
