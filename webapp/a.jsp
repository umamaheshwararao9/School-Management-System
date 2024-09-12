<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.URLDecoder, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Question Details</title>
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
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .content h2 {
            margin: 0 0 20px;
            color: #333;
        }
        .content p {
            font-size: 16px;
            color: #555;
            max-width: 800px;
            text-align: center;
            margin-bottom: 20px;
        }
        .content form {
            max-width: 800px;
            width: 100%;
            text-align: center;
        }
        .content textarea {
            width: 100%;
            height: 100px;
            margin-bottom: 10px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .content button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .content button:hover {
            background-color: #45a049;
        }
        .footer {
            background-color: #333;
            color: white;
            padding: 10px 0;
        }
    </style>
    <script>
        function confirmSubmit(event) {
            event.preventDefault(); // Prevent the form from submitting immediately

            const userConfirmed = confirm("Do you want to answer this?");
            if (userConfirmed) {
                // Get the form element and submit it
                const form = document.getElementById("answerForm");
                form.submit(); // Submit the form
            }
        }
    </script>
</head>
<body>
    <div class="header">
        <h1>Question Details</h1>
        <a class="back-button" href="q.jsp?id=<%= request.getParameter("id") %>">Back to List</a>
    </div>

    <div class="content">
        <%
            String question = request.getParameter("question");
            if (question == null) {
                question = "No question provided.";
            }
        %>
        <h2>Question:</h2>
        <p><%= URLDecoder.decode(question, "UTF-8") %></p>

        <form id="answerForm" action="<%= request.getRequestURI() %>" method="post" onsubmit="confirmSubmit(event)">
            <h2>Your Answer:</h2>
            <textarea name="answer" required></textarea>
            <input type="hidden" name="question" value="<%= question %>">
            <input type="hidden" name="deleteQuestion" value="true"> <!-- Hidden field to signal deletion -->
            <button type="submit">Submit</button>
        </form>

        <%
            String answer = request.getParameter("answer");
            String deleteQuestion = request.getParameter("deleteQuestion");
            out.print(deleteQuestion);
            if (deleteQuestion != null && deleteQuestion.equals("true")) {
                String dbUrl = "jdbc:mysql://localhost:3306/school_database";
                String dbUser = "root";
                String dbPassword = "UmaMahesh@9";
                Connection connection = null;
                PreparedStatement statement = null;

                try {
                    // Load database driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                    // Insert the question and answer into the response table
                    String insertSql = "INSERT INTO responce (question, answer) VALUES (?, ?)";
                    statement = connection.prepareStatement(insertSql);
                    statement.setString(1, question);
                    statement.setString(2, answer);
                    statement.executeUpdate();

                    // Delete the question from the questions table
                    String deleteSql = "DELETE FROM questions WHERE question = ?";
                    statement = connection.prepareStatement(deleteSql);
                    statement.setString(1, question);
                    statement.executeUpdate();

                    // Redirect back to the list page with a short delay
                    response.setHeader("Refresh", "0.01; URL=q.jsp?id=" + request.getParameter("id"));
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error occurred while processing your request.</p>");
                } finally {
                    try { if (statement != null) statement.close(); } catch (Exception e) { e.printStackTrace(); }
                    try { if (connection != null) connection.close(); } catch (Exception e) { e.printStackTrace(); }
                }
            } else if (answer != null) {
                // Handle the submitted answer here
                out.println("<p>Thank you for your answer!</p>");
            }
        %>
    </div>

    <div class="footer">
        <p>&copy; 2024 My Website</p>
    </div>
</body>
</html>
