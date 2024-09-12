<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.net.URLEncoder, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Questions List</title>
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
        .content a {
            display: block;
            font-size: 16px;
            color: #4CAF50;
            text-decoration: none;
            margin: 10px 0;
        }
        .content a:hover {
            text-decoration: underline;
        }
        .footer {
            background-color: #333;
            color: white;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Questions List</h1>
        <a class="back-button" href="answer.jsp?id=<%= request.getParameter("id") %>">Back</a>
    </div>

    <div class="content">
        <%
            String url = "jdbc:mysql://localhost:3306/school_database";
            String user = "root";
            String password = "UmaMahesh@9";
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            ResultSet rsArr = null;

            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                conn = DriverManager.getConnection(url, user, password);

                // Create a statement
                stmt = conn.createStatement();

                // Execute SQL query to get words from the 'arr' table
                String sqlArr = "SELECT word FROM arr";
                rsArr = stmt.executeQuery(sqlArr);

                // Collect words into a set
                Set<String> wordsSet = new HashSet<>();
                while (rsArr.next()) {
                    wordsSet.add(rsArr.getString("word").toLowerCase());
                }
                
                // Close the ResultSet for 'arr' as we are done with it
                rsArr.close();
                
                // Execute SQL query to get questions
                String sqlQuestions = "SELECT * FROM questions";
                rs = stmt.executeQuery(sqlQuestions);

                boolean questionsFound = false;

                // Display questions
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String question = rs.getString("question");
                    // Check if the question contains any word from the 'arr' table
                    String[] questionWords = question.toLowerCase().split("\\s+");
                    boolean containsWord = false;
                    for (String word : questionWords) {
                        if (wordsSet.contains(word)) {
                            containsWord = true;
                            break;
                        }
                    }
                    if (containsWord) {
                        questionsFound = true;
                        String encodedQuestion = URLEncoder.encode(question, "UTF-8");
                        String encodedId = URLEncoder.encode(String.valueOf(id), "UTF-8");
                        out.println("<a href='a.jsp?id=" + encodedId + "&question=" + encodedQuestion + "'>" + question + "</a><br>");
                    }
                }
                if (!questionsFound) {
                    out.println("<p>No questions to answer.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error retrieving questions: " + e.getMessage() + "</p>");
            } finally {
                // Clean up resources
                try {
                    if (rs != null && !rs.isClosed()) rs.close();
                    if (rsArr != null && !rsArr.isClosed()) rsArr.close();
                    if (stmt != null && !stmt.isClosed()) stmt.close();
                    if (conn != null && !conn.isClosed()) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>

    <div class="footer">
        <p>&copy; 2024 My Website</p>
    </div>
</body>
</html>
