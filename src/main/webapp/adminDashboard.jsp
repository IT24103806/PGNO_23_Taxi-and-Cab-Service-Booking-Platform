<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="controller.UserManager" %>
<%@ page import="java.io.IOException" %>
<%
    HttpSession currentSession = request.getSession(false);
    String currentUserEmail = null;
    String currentUserName = null;
    String role = null;

    if (currentSession != null) {
        currentUserEmail = (String) currentSession.getAttribute("userEmail");
        currentUserName = (String) currentSession.getAttribute("userName");
        role = (String) currentSession.getAttribute("userRole");
    }

    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("new_background1.jpg") no-repeat center center fixed;
            background-size: cover;
            color: #333;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        /* Header */
        .site-header {
            background-color: #f0ad4e;
            color: white;
            padding: 10px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo h2 {
            margin: 0;
            font-size: 24px;
            color: #fff;
        }

        .nav-links {
            display: flex;
            gap: 15px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 8px 10px;
            transition: background 0.3s;
        }

        .nav-links a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 4px;
        }

        /* Welcome Message */
        .welcome-msg {
            font-size: 32px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #000000;
            padding: 15px;
            border-radius: 10px;
            display: inline-block;
            margin-top: 20px;
        }

        /* Dashboard Buttons */
        a, button, input[type="submit"] {
            background-color: #ff9800;
            color: white;
            border: none;
            padding: 12px 20px;
            margin: 10px;
            border-radius: 30px;
            text-decoration: none;
            display: inline-block;
            font-weight: bold;
            font-size: 16px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
        }

        a:hover, button:hover, input[type="submit"]:hover {
            background-color: #ff6f00;
            color: #000;
            transform: scale(1.1);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
        }

        .logout-btn {
            background-color: #FF6666;
            position: fixed;
            bottom: 20px;
            right: 20px;
            padding: 10px 15px;
            border-radius: 5px;
        }

        .logout-btn:hover {
            transform: translateX(-10px);
            background-color: #FF3333;
            color: black;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.6);
        }

        /* Spacer for scrolling */
        .spacer {
            height: 800px;
        }

        /* Manage Users */
        .user-form {
            width: 350px;
            margin: 20px auto;
            background: #ff6f00;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Footer */
        .site-footer {
            background-color: rgba(0, 34, 68, 0.8);
            color: white;
            padding: 30px 20px 10px;
            margin-top: 50px;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 10px;
            border-top: 1px solid #444;
        }
    </style>
</head>
<body>

<!-- Header -->
<div class="site-header">
    <div class="logo">
        <h2>Swift Rides</h2>
        <span>Premium Cab Service</span>
    </div>

    <nav class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="#">Our Service</a>
        <a href="#">Bookings</a>
        <a href="#">Destinations</a>
        <a href="#">About Us</a>
        <a href="#">Support</a>
    </nav>
</div>

<!-- Welcome Message -->
<h2 class="welcome-msg">Welcome Admin: <%= currentUserEmail %></h2>

<!-- Dashboard Buttons -->
<ul>
    <li><a href="viewUsers.jsp">View All Users</a></li>
    <li><a href="viewBookings.jsp">View All Bookings</a></li>
    <li><a href="sortDrivers.jsp">Sort Drivers by Rating</a></li>
    <li><a href="viewReviews.jsp">View Feedback</a></li>
    <li><a href="deleteUser.jsp">Delete a User</a></li>
    <li><a href="logout.jsp" class="logout-btn">Logout</a></li>
</ul>

<!-- Spacer -->
<div class="spacer"></div>

<h1>Manage Users</h1>

<!-- Form to Add User -->
<form method="post" class="user-form">
    <input type="text" name="id" placeholder="User ID" required>
    <input type="text" name="name" placeholder="Name" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <select name="role">
        <option value="customer">Customer</option>
        <option value="admin">Admin</option>
    </select>
    <button type="submit" name="addUser">Add User</button>
</form>

<!-- Form to Remove User -->
<form method="post" class="user-form">
    <input type="text" name="userId" placeholder="User ID to remove" required>
    <button type="submit" name="removeUser">Remove User</button>
</form>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String userRoleInput = request.getParameter("role");
    String userIdToRemove = request.getParameter("userId");

    if (request.getParameter("addUser") != null) {
        try {
            UserManager.addUser(id, name, email, password, role);
            response.getWriter().println("<p>User added successfully!</p>");
        } catch (IOException e) {
            response.getWriter().println("<p>Error adding user.</p>");
        }
    } else if (request.getParameter("removeUser") != null) {
        try {
            UserManager.removeUser(userIdToRemove);
            response.getWriter().println("<p>User removed successfully!</p>");
        } catch (IOException e) {
            response.getWriter().println("<p>Error removing user.</p>");
        }
    }
%>

<!-- Footer -->
<div class="site-footer">
    <div class="footer-bottom">
        &copy; 2025 Swift Rides | All Rights Reserved
    </div>
</div>

</body>
</html>

