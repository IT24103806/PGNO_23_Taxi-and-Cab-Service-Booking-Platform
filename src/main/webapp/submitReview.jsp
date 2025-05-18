<%@ page language="java" %>
<html>
<head>
    <title>Submit Review</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url("AdminDashboard.jpg") no-repeat center center fixed;
            background-size: cover;
            padding: 40px;
        }

        .container {
            background: white;
            max-width: 500px;
            margin: auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-top: 15px;
            color: #444;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px;
            margin-top: 20px;
            border: none;
            border-radius: 4px;
            width: 100%;
            cursor: pointer;
        }

        input[type="reset"] {
            background-color: #FF0000;
            color: white;
            padding: 10px;
            margin-top: 20px;
            border: none;
            border-radius: 4px;
            width: 100%;
            cursor: pointer;
        }
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
