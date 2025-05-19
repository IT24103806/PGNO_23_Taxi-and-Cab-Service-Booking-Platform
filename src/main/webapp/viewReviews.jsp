<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: url("background.jpg") no-repeat center center fixed;
        background-size: cover;
        color: #333;
        margin: 0;
        padding: 20px;
    }

    h2, h1 {
        text-align: center;
        color: #003366;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ccc;
    }

    th {
        background-color: #003366;
        color: white;
    }

    a, button, input[type="submit"] {
        background-color: #005AA7;
        color: white;
        border: none;
        padding: 10px 15px;
        margin: 10px;
        border-radius: 5px;
        text-decoration: none;
        display: inline-block;
        cursor: pointer;
    }

    a:hover, button:hover, input[type="submit"]:hover {
        background-color: #0074D9;
    }

    form {
        width: 300px;
        margin: 0 auto;
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    input[type="text"], input[type="password"], select {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
</style>

<%@ page import="java.io.*, java.util.*" %>
<html>
<head><title>Customer Feedback</title></head>
<body>
<h2>Customer Reviews</h2>
<table border="1">
<tr><th>Review ID</th><th>User ID</th><th>Driver ID</th><th>Rating</th><th>Comment</th></tr>
<%
    File file = new File("reviews.txt");
    if (file.exists()) {
        Scanner scanner = new Scanner(file);
        while (scanner.hasNextLine()) {
            String[] data = scanner.nextLine().split(",");
            if (data.length >= 5) {
%>
<tr>
    <td><%= data[0] %></td>
    <td><%= data[1] %></td>
    <td><%= data[2] %></td>
    <td><%= data[4] %></td>
    <td><%= data[3] %></td>
</tr>
<%
            }
        }
        scanner.close();
    } else {
%>
<tr><td colspan="5">No reviews found.</td></tr>
<% } %>
</table>
</body>
</html>