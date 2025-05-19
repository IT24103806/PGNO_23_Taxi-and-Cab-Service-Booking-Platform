<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession(false);
    String role = (String) session.getAttribute("userRole");
    String email = (String) session.getAttribute("userEmail");
    String name = (String) session.getAttribute("userName");

    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("background.jpg") no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #ffffff;
        }

        .dashboard-content {
            text-align: center;
            margin-top: 150px;
        }

        .dashboard-content a {
            background-color: #005AA7;
            color: white;
            border: none;
            padding: 12px 20px;
            margin: 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            display: inline-block;
            cursor: pointer;
        }

        .dashboard-content a:hover {
            background-color: #0074D9;
        }

        .admin-name {
            color: white;
            text-align: center;
            font-size: 18px;
            margin-top: 30px;
        }
    </style>
</head>
<body>

<!-- ✅ Include header -->
<jsp:include page="header.jsp" />

<div class="admin-name">
    <p>Welcome, Admin: <strong><%= name %></strong></p>
</div>

<div class="dashboard-content">
    <h1>Admin Dashboard</h1>
    <a href="viewUsers.jsp">View All Users</a>
    <a href="viewBookings.jsp">View All Bookings</a>
    <a href="sortDrivers.jsp">Sort Drivers by Rating</a>
    <a href="viewReviews.jsp">View Feedback</a>
    <a href="deleteUser.jsp">Delete a User</a>

</div>

<!-- ✅ Include footer -->
<jsp:include page="footer.jsp" />

</body>
</html>
