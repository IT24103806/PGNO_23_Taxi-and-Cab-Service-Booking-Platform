<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession(false);
    String email = (session != null) ? (String) session.getAttribute("userEmail") : null;
    String name = (session != null) ? (String) session.getAttribute("userName") : null;

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url("background.jpg") no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        h2, h1 {
            text-align: center;
            color: #ffffff;
        }

        .profile-icon {
            position: absolute;
            top: 80px; /* adjusted below header */
            right: 30px;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #005AA7;
            display: flex;
            justify-content: center;
            align-items: center;
            text-decoration: none;
            color: white;
            font-weight: bold;
            font-size: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.3);
            transition: background-color 0.3s ease;
            z-index: 10;
        }

        .profile-icon:hover {
            background-color: #0074D9;
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
    </style>
</head>
<body>

<!-- ✅ Include header -->
<jsp:include page="header.jsp" />


<div class="dashboard-content">
    <h1>Welcome to Your Dashboard</h1>
    <a href="booking.jsp">Book a Cab</a>
</div>

<!-- ✅ Include footer -->
<jsp:include page="footer.jsp" />

</body>
</html>
