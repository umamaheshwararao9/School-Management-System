<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Data Display</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 15px 0;
            text-align: center;
            position: relative;
        }
        footer {
            background-color: #333;
            color: #fff;
            padding: 15px 0;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .container {
            padding: 20px;
            text-align: center;
        }
        .input-box {
            margin-bottom: 20px;
        }
        input[type="text"] {
            padding: 15px;
            font-size: 20px;
            width: 400px;
            border: 2px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 15px 30px;
            font-size: 16px;
            margin: 0 5px;
            cursor: pointer;
            border-radius: 5px;
        }
        .add-button {
            background-color: #4CAF50;
            color: white;
            border: none;
        }
        .back-button {
            background-color: #f44336;
            color: white;
            border: none;
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
        }
        .data-display {
            margin-top: 20px;
            text-align: left;
            padding: 20px;
            border-top: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <header>
        <h1>My Web Page</h1>
        <!-- Back button -->
        <form method="get" action="DomainHome.jsp">
            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
            <button class="back-button" type="submit">Back</button>
        </form>
    </header>

    <div class="container">
        <!-- Form for input and adding data -->
        <form method="post">
            <div class="input-box">
                <input type="text" name="inputField" placeholder="Enter text" required>
            </div>
            <button class="add-button" type="submit">Add</button>
        </form>

        <!-- Data Display -->
        <div class="data-display">
            <h2>Data from the Database:</h2>
            <%
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3306/school_database";
                String username = "root";
                String password = "UmaMahesh@9";
                
                // Initialize connection and statement
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;
                PreparedStatement pstmt = null;
                String inputText = request.getParameter("inputField");

                // Create an ArrayList to store data from the database
                ArrayList<String> wordList = new ArrayList<>();
              
                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    
                    // Establish the connection
                    conn = DriverManager.getConnection(url, username, password);

                    // Handle form submission to add data
                    if (inputText != null && !inputText.trim().isEmpty()) {
                        // Check if the word already exists in the database
                        String checkQuery = "SELECT COUNT(*) FROM arr WHERE word = ?";
                        pstmt = conn.prepareStatement(checkQuery);
                        pstmt.setString(1, inputText);
                        rs = pstmt.executeQuery();
                        
                        if (rs.next() && rs.getInt(1) == 0) {
                            // Insert the word if it doesn't already exist
                            String insertQuery = "INSERT INTO arr (word) VALUES (?)";
                            pstmt = conn.prepareStatement(insertQuery);
                            pstmt.setString(1, inputText);
                            pstmt.executeUpdate();
                        } else {
                            out.println("<div style='color:red;'>Duplicate entry detected. The word already exists in the database.</div>");
                        }
                        pstmt.close();
                    }

                    // SQL query to fetch data
                    String fetchQuery = "SELECT word FROM arr";
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery(fetchQuery);

                    // Store results in the ArrayList
                    while (rs.next()) {
                        wordList.add(rs.getString("word"));
                    }

                    // Print out the ArrayList elements
                    if (wordList.isEmpty()) {
                        out.println("<div>No data found.</div>");
                    } else {
                        out.println("<div><strong>Words in the Database:</strong></div>");
                        for (String word : wordList) {
                            out.println("<div>" + word + "</div>");
                        }
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Error: " + e.getMessage());
                } finally {
                    // Close resources
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </div>
    </div>

    <footer>
        <p>&copy; 2024 My Web Page. All rights reserved.</p>
    </footer>
</body>
</html>
