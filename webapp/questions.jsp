<%@ page import="java.io.IOException, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <title>Questions Page</title>
    <style>
        /* Existing CSS */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            position: relative; /* Ensure the button is positioned relative to body */
        }
        .container {
            text-align: center;
            max-width: 800px;
            width: 100%;
            padding: 20px;
            box-sizing: border-box;
        }
        .instructions {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .instruction-box {
            width: 45%; /* Adjust width as needed */
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .instruction-box h3 {
            margin-top: 0;
        }
        .dos {
            border-left: 5px solid #FFD700; /* Gold color */
        }
        .donts {
            border-left: 5px solid #FFD700; /* Gold color */
        }
        .input-box {
            width: 50vw; /* Half the screen width */
            height: 200px; /* Adjust height as needed */
            margin-bottom: 20px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            background-color: #e0f7fa; /* Light blue color */
        }
        .ask-button {
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .ask-button:hover {
            background-color: #0056b3;
        }
        /* Modal Styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.4); /* Black background with opacity */
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            box-shadow: 0 0 10px rgba(0,0,0,0.5);
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .modal-buttons {
            text-align: right;
            margin-top: 20px;
        }
        /* Home Button Styles */
        .home-button {
            position: absolute;
            top: 20px; /* Adjust spacing from the top */
            right: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #28a745; /* Green color */
            border: none;
            border-radius: 4px;
            cursor: pointer;
            z-index: 1000; /* Ensure it is on top */
        }
        .home-button:hover {
            background-color: #218838; /* Darker green on hover */
        }
    </style>
    <script>
        function showModal(modalId) {
            document.getElementById(modalId).style.display = 'block';
        }

        function hideModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        function submitQuestion() {
            const question = document.querySelector('.input-box').value;
            const id = new URLSearchParams(window.location.search).get('id');

            if (question.trim() === "") {
                alert("Please enter a question.");
                return;
            }

            showModal('confirmationModal');
        }

        function confirmSubmission() {
            document.getElementById('questionForm').submit();
        }

        function redirectToHome() {
            const id = new URLSearchParams(window.location.search).get('id');
            window.location.href = "StudentHome.jsp?id=" + id;
        }

        function showSuccessModal() {
            hideModal('confirmationModal');
            showModal('successModal');
        }
    </script>
</head>
<body>
    <button class="home-button" onclick="redirectToHome()">Home</button>
    <div class="container">
        <div class="instructions">
            <div class="instruction-box dos">
                <h3>Do's</h3>
                <ul>
                    <li>Be clear and concise in your question.</li>
                    <li>Provide any necessary context or background information.</li>
                    <li>Be respectful and considerate in your language.</li>
                </ul>
            </div>
            <div class="instruction-box donts">
                <h3>Don'ts</h3>
                <ul>
                    <li>Use offensive or inappropriate language.</li>
                    <li>Ask multiple unrelated questions at once.</li>
                    <li>Assume the reader has prior knowledge of specific terms or jargon.</li>
                </ul>
            </div>
        </div>
        <form id="questionForm" method="post" action="">
            <textarea class="input-box" name="question" placeholder="Enter your question here..."></textarea>
            <br>
            <button type="button" class="ask-button" onclick="submitQuestion()">ASK</button>
        </form>

        <!-- Confirmation Modal -->
        <div id="confirmationModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="hideModal('confirmationModal')">&times;</span>
                <p>Are you sure you want to ask this question?</p>
                <div class="modal-buttons">
                    <button onclick="confirmSubmission()">Yes</button>
                    <button onclick="hideModal('confirmationModal')">No</button>
                </div>
            </div>
        </div>

        <!-- Success Modal -->
        <div id="successModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="hideModal('successModal')">&times;</span>
                <p>Your question has been sent to the school management system.</p>
                <div class="modal-buttons">
                    <button onclick="redirectToHome()">OK</button>
                </div>
            </div>
        </div>

        <%
            String id = request.getParameter("id");
            String question = request.getParameter("question");
            if (id != null && question != null && !question.trim().isEmpty()) {
                String dbUrl = "jdbc:mysql://localhost:3306/school_database";
                String dbUser = "root";
                String dbPass = "UmaMahesh@9";

                try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
                    String sql = "INSERT INTO questions (id, question) VALUES (?, ?)";
                    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                        pstmt.setString(1, id);
                        pstmt.setString(2, question);
                        int rowsAffected = pstmt.executeUpdate();
                        if (rowsAffected > 0) {
                            out.println("<script>showSuccessModal();</script>");
                        } else {
                            out.println("<script>alert('There was an error submitting your question.');</script>");
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<script>alert('There was an error with the database connection.');</script>");
                }
            }
        %>
    </div>
</body>
</html>
