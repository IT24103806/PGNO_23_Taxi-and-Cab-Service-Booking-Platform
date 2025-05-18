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

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background: white;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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

    .book-now-btn:hover {
        background-color: #ffffff;
        transform: scale(1.3);
    }

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ccc;
    }

    th {
        background-color: #ffffff;
        color: white;
    }

    a, button, input[type="submit"] {
        background-color: #ffffff;
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
        background-color: #ffffff;
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

<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession(false);
    String username = (session != null) ? (String) session.getAttribute("userName") : null;
    if (username == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head><title>Dashboard</title></head>
<body>
<h1>Welcome, <%= username %>!</h1>
<a href="booking.jsp" class="book-now-btn"> Book Now</a>
<a href="javascript:history.back()" class="back-btn">Back</a>
</body>
</html>

