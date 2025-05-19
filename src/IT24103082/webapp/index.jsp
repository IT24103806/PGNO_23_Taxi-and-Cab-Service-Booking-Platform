<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cab Reservation System</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .custom-buttons {
            margin-top: 150px; /* Push buttons below header */
            display: flex;
            justify-content: center;
            gap: 40px;
        }

        .btn {
            display: inline-block;
            padding: 18px 36px;
            background-color: #0066cc;
            color: white;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
            border-radius: 30px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.3);
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn:hover {
            background-color: #004c99;
            transform: scale(1.05);
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>


<%@ include file="footer.jsp" %>
</body>
</html>

