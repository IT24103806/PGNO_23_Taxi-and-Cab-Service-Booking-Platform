<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
            url('backgroundImage2.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 400px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #003366;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
        }

        input[type="email"],
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #2E86C1;
            color: #fff;
            border: none;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1F618D;
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #666;
        }

        .footer-text a {
            color: #2E86C1;
            text-decoration: none;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }
    </style>

    <script type="text/javascript">
        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
        <% if (errorMessage != null) { %>
        window.onload = function () {
            alert("<%= errorMessage %>");
        };
        <% } %>
    </script>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="login-container">
    <h2>Welcome Back</h2>
    <form action="LoginServlet" method="post" autocomplete="off">
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" required placeholder="Enter your email" autocomplete="username">
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required placeholder="Enter your password" autocomplete="current-password">
        </div>

        <input type="submit" value="Log In">
    </form>
    <div class="footer-text">
        Don't have an account? <a href="register.jsp">Register here</a>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
