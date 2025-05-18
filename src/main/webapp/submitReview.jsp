<%@ page language="java" %>
<html>
<head>
    <title>Submit Review</title>
    <style>   
    </style>
</head>
<body>
<div class="container">
    <h2>Submit Your Review</h2>
    <form action="saveReview.jsp" method="post">
        <label for="userID">User ID:</label>
        <input type="text" name="userID" id="userID" required>

        <label for="driverID">Driver ID:</label>
        <input type="text" name="driverID" id="driverID" required>

        <label for="rating">Rating:</label>
        <select name="rating" id="rating" required>
            <option value="">--Select Rating--</option>
            <option value="1">Very Bad</option>
            <option value="2">Bad</option>
            <option value="3">Average</option>
            <option value="4">Good</option>
            <option value="5">Excellent</option>
        </select>

        <label for="comments">Comments:</label>
        <textarea name="comments" id="comments" rows="4" required></textarea>

        <input type="submit" value="Submit Review">
    </form>
</div>
</body>
</html>
