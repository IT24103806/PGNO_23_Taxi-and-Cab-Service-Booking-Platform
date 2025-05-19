<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Swift Rides</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("register.jpg") no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .register-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 20px;
        }

        .register-box {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 450px;
        }

        .register-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #003366;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        input[type="radio"] {
            margin-right: 6px;
        }

        .gender-group {
            display: flex;
            gap: 10px;
            margin-top: 5px;
        }

        .address-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 5px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #005AA7;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #0074D9;
        }
    </style>

    <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const dob = document.getElementById("dob").value;
            const dobDate = new Date(dob);
            const today = new Date();

            if (password.length < 4) {
                alert("Password must be at least 4 characters long.");
                return false;
            }

            if (!dob || dobDate >= today) {
                alert("Date of Birth must be a valid past date.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>

<div class="register-container">
    <div class="register-box">
        <h2>Create an Account</h2>
        <form action="RegisterServlet" method="post" autocomplete="off" onsubmit="return validateForm()">
            <label for="name">Full Name:</label>
            <input type="text" name="name" id="name" placeholder="Enter your full name" required>

            <label for="email">Email Address:</label>
            <input type="email" name="email" id="email" placeholder="Enter your email" required>

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" placeholder="Create a password" required>

            <label>Address:</label>
            <div class="address-group">
                <input type="text" name="houseNo" placeholder="House/Apartment No" required>
                <input type="text" name="street" placeholder="Street" required>
                <input type="text" name="city" placeholder="City" required>
            </div>

            <label for="dob">Date of Birth:</label>
            <input type="date" name="dob" id="dob" required>

            <label>Gender:</label>
            <div class="gender-group">
                <label><input type="radio" name="gender" value="Male" required> Male</label>
                <label><input type="radio" name="gender" value="Female"> Female</label>
                <label><input type="radio" name="gender" value="Other"> Other</label>
            </div>

            <label for="role">Register As:</label>
            <select name="role" id="role" required>
                <option value="" disabled selected>Select a role</option>
                <option value="customer">Customer</option>
                <option value="driver">Driver</option>

            </select>

            <input type="submit" value="Register">
        </form>
    </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>
