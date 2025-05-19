<html>
 <head>
    <title>All Reviews</title>
    <style>
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
  
