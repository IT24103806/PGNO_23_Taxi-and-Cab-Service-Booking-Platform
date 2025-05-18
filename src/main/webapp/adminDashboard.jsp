<!--Ravindu Nethmina IT24104176 -->
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: url("new_background1.jpg") no-repeat center center fixed;
        background-size: cover;
        background-blend-mode: overlay;
        color: #333;
        margin: 0;
        padding: 20px;
    }
    body::before {
        content: "";
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.4);
        z-index: -1;
    }

    h2, h1 {
        font-size: 32px;
        font-weight: bold;
        color: white;
        text-align: center;
        text-transform: uppercase;
        letter-spacing: 2px;
        animation: glowEffect 3s infinite alternate;
    }

    @keyframes glowEffect {
        0% { text-shadow: 0 0 10px white; }
        50% { text-shadow: 0 0 20px white; }
        100% { text-shadow: 0 0 10px white; }
        }


        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            padding: 8px;
            font-size: 18px;
            font-weight: bold;
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
            background-color: #ff9800;
            color: white;
            border: none;
            padding: 12px 20px;
            margin: 10px;
            border-radius: 30px;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
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
            color: white;
            border: none;
            padding: 10px 15px;
            margin: 10px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            position: fixed;
            bottom: 20px;
            right: 20px;
        }

        .logout-btn:hover {
            transform: translateX(-10px);
            background-color: #FF3333;
            color: black;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.6);
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


<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    session = request.getSession(false);
    String role = (String) session.getAttribute("userRole");
    String email = (String) session.getAttribute("userEmail");

    if (role == null || !role.equals("admin")) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
<h2>Welcome Admin: <%= email %></h2>

<ul>

    <li><a href="viewUsers.jsp">View All Users</a></li>
    <li><a href="viewBookings.jsp">View All Bookings</a></li>
    <li><a href="sortDrivers.jsp">Sort Drivers by Rating</a></li>
    <li><a href="viewReviews.jsp">View Feedback</a></li>
    <li><a href="deleteUser.jsp">Delete a User</a></li>
    <li><a href="logout.jsp" class="logout-btn">Logout</a></li>

</ul>
</body>
</html>
