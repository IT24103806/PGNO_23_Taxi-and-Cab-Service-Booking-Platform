<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("background.jpg") no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            height: 100vh;
        }

        .register-box {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            margin-right: 100px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
            width: 320px;
        }

        .register-box h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #003366;
        }

        .register-box label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }

        .register-box input[type="text"],
        .register-box input[type="password"],
        .register-box select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .register-box input[type="submit"] {
            width: 100%;
            background-color: #005AA7;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .register-box input[type="submit"]:hover {
            background-color: #0074D9;
        }
    </style>
</head>
<body>
<div class="register-box">
    <h2>Register</h2>
    <form action="RegisterServlet" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="email">Email:</label>
        <input type="text" name="email" id="email" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <label for="role">Role:</label>
        <select name="role" id="role">
            <option value="customer">Customer</option>
            <option value="driver">Driver</option>
            <option value="admin">Admin</option>
        </select>

        <input type="submit" value="Register">
    </form>
</div>
</body>
</html>
