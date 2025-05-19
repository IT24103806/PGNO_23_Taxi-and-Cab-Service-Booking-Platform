<%@ page import="java.io.*, java.util.*" %>
<%
    String userID = request.getParameter("userID");
    String driverID = request.getParameter("driverID");
    String rating = request.getParameter("rating");
    String comments = request.getParameter("comments");

    String path = "D:/reviews/reviews.txt";
    File file = new File(path);
    file.getParentFile().mkdirs();

    FileWriter fw = new FileWriter(file, true);
    PrintWriter pw = new PrintWriter(fw);

    pw.println("UserID: " + userID);
    pw.println("DriverID: " + driverID);
    pw.println("Rating: " + rating);
    pw.println("Comments: " + comments);
    pw.println("Date: " + new Date().toString());
    pw.println("-----");

    pw.close();
%>
<html>
<head>
    <title>Review Submitted</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url("AdminDashboard.jpg") no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            padding: 100px;
        }

        h2 {
            background-color: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 20px;
            margin: 0 auto 30px auto;
            text-align: center;
            width: 60%;
            border-radius: 50px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h2>Review Submitted Successfully!</h2>
<a href="submitReview.jsp" class="btn">Submit Another Review</a>
<a href="viewReviews.jsp" class="btn">Vew All Reviews</a>
<a href="adminDashboard.jsp" class="btn">Back to Dashboard</a>
</body>
</html>
