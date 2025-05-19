<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession(false);
    String username = (session != null) ? (String) session.getAttribute("userName") : null;
    if (username == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("new_background2.jpg") no-repeat center center fixed;
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

        h1 {
            font-size: 32px;
            font-weight: bold;
            color: white;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
            animation: glowEffect 3s infinite alternate;
            margin-top: 20px;
        }

        @keyframes glowEffect {
            0% { text-shadow: 0 0 10px white; }
            50% { text-shadow: 0 0 20px white; }
            100% { text-shadow: 0 0 10px white; }
        }

        .book-now-btn {
            background-color: yellow;
            color: black;
            font-size: 18px;
            font-weight: bold;
            padding: 15px 30px;
            border: none;
            border-radius: 30px;
            text-decoration: none;
            display: block;
            text-align: center;
            width: fit-content;
            margin: 40px auto;
            cursor: pointer;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            animation: zoomEffect 3s infinite ease-in-out;
        }

        .book-now-btn:hover {
            background-color: darkgoldenrod;
            transform: scale(1.3);
        }

        @keyframes zoomEffect {
            0% { transform: scale(1); }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }

        .back-btn {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            border-radius: 30px;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            position: fixed;
            bottom: 20px;
            left: 20px;
        }

        .back-btn:hover {
            background-color: #555;
            transform: scale(1.1);
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
<h1>Welcome, <%= username %>!</h1>

<!-- Book Now & Back Buttons -->
<a href="booking.jsp" class="book-now-btn">Book Now</a>
<a href="javascript:history.back()" class="back-btn">Back</a>

<!-- Footer -->
<div class="site-footer">
    <div class="footer-bottom">
        &copy; 2025 Swift Rides | All Rights Reserved
    </div>
</div>

</body>
</html>
