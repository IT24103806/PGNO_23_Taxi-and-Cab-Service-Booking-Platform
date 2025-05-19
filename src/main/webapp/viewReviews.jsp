<%@ page import="java.io.*" %>
<html>
<head>
    <title>All Reviews</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url("AdminDashboard.jpg") no-repeat center center fixed;
            background-size: cover;
            padding: 40px;
        }

        .container {
            max-width: 70%;
            margin: auto;
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

        .card-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }

        .review-card {
            background: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 10px;
            padding: 20px 25px;
            box-shadow: 0 3px 6px rgba(0,0,0,0.05);
            box-sizing: border-box;
            flex: 0 0 48%;
        }

        .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .review-meta {
            font-size: 14px;
            color: #777;
        }

        .review-rating {
            font-size: 18px;
            font-weight: bold;
        }

        .review-rating span {
            font-size: 20px;
            margin-right: 2px;
        }

        .review-comments {
            font-size: 18px;
            color: #333;
            margin-top: 10px;
            line-height: 1.6;
        }

        .link-group {
            text-align: center;
            margin-top: 30px;
        }

        a.btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #6c757d;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            margin: 5px 10px;
        }

        a.btn:hover {
            background-color: #5a6268;
        }

        @media (max-width: 768px) {
            .review-card {
                flex: 0 0 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>All Submitted Reviews</h2>

    <%
        String path = "D:/reviews/reviews.txt";
        File file = new File(path);

        if (file.exists()) {
            BufferedReader br = new BufferedReader(new FileReader(file));
            String line;
            String userID = "", driverID = "", rating = "", comments = "", date = "";
    %>
    <div class="card-grid">
        <%
            while ((line = br.readLine()) != null) {
                if (line.startsWith("UserID: ")) {
                    userID = line.substring(8);
                } else if (line.startsWith("DriverID: ")) {
                    driverID = line.substring(10);
                } else if (line.startsWith("Rating: ")) {
                    rating = line.substring(8);
                } else if (line.startsWith("Comments: ")) {
                    comments = line.substring(10);
                } else if (line.startsWith("Date: ")) {
                    date = line.substring(6);
                } else if (line.equals("-----")) {
        %>
        <div class="review-card">
            <div class="review-header">
                <div class="review-meta">
                    <strong>User:</strong> <%= userID %><br>
                    <strong>Driver:</strong> <%= driverID %>
                </div>
                <div class="review-rating">
                    <%
                        int stars = Integer.parseInt(rating);
                        for (int i = 1; i <= 5; i++) {
                            if (i <= stars) {
                    %>
                    <span style="color: #ffc107;">&#9733;</span>
                    <%
                    } else {
                    %>
                    <span style="color: #e0e0e0;">&#9733;</span>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <div class="review-comments">
                "<%= comments %>"
            </div>
            <div class="review-meta" style="margin-top: 10px;">
                <em><%= date %></em>
            </div>
        </div>
        <%
                    userID = driverID = rating = comments = date = "";
                }
            }
            br.close();
        %>
    </div>
    <%
    } else {
    %>
    <p>No reviews found.</p>
    <%
        }
    %>

    <div class="link-group">
        <a href="submitReview.jsp" class="btn">Add a Review</a>
        <a href="adminDashboard.jsp" class="btn">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
