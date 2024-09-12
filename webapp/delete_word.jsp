<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String wordToDelete = request.getParameter("word");
    String id = request.getParameter("id"); // Get the ID parameter

    if (wordToDelete != null && !wordToDelete.trim().isEmpty()) {
        String url = "jdbc:mysql://localhost:3306/school_database";
        String username = "root";
        String password = "UmaMahesh@9";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            conn = DriverManager.getConnection(url, username, password);

            // SQL query to delete the word
            String deleteQuery = "DELETE FROM arr WHERE word = ?";
            pstmt = conn.prepareStatement(deleteQuery);
            pstmt.setString(1, wordToDelete);
            pstmt.executeUpdate();

            // Redirect back to the main page after deletion with the same ID
            response.sendRedirect("delete.jsp?id=" + id);

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    } else {
        out.println("No word to delete.");
    }
%>
