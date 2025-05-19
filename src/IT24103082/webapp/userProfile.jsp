<%@ page import="javax.servlet.http.HttpSession" %>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("userEmail") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String name = (String) session.getAttribute("userName");
    String email = (String) session.getAttribute("userEmail");
    String houseNo=(String)session.getAttribute("userHouseNo");
    String street=(String)session.getAttribute("userStreet");
    String city=(String)session.getAttribute("userCity");
    String dob = (String) session.getAttribute("userDOB");
    String gender = (String) session.getAttribute("userGender");
    String role = (String) session.getAttribute("userRole");
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0eafc, #cfdef3);
            margin: 0;
            padding: 0;
        }

        .profile-wrapper {
            max-width: 800px;
            margin: 60px auto;
            display: flex;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .profile-left {
            background: #005AA7;
            color: white;
            width: 35%;
            padding: 40px 20px;
            text-align: center;
        }

        .profile-left .avatar {
            background-color: white;
            color: #005AA7;
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
            font-size: 40px;
            font-weight: bold;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .profile-left h2 {
            margin: 10px 0 5px;
            font-size: 22px;
        }

        .profile-left p {
            font-size: 14px;
            color: #ddd;
        }

        .profile-right {
            padding: 40px 30px;
            flex: 1;
        }

        .profile-right h3 {
            margin-top: 0;
            color: #003366;
            margin-bottom: 25px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }

        .info-item {
            display: flex;
            margin: 12px 0;
            font-size: 16px;
        }

        .info-item .label {
            width: 150px;
            font-weight: bold;
            color: #555;
        }

        .info-item .value {
            color: #333;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 30px;
            text-decoration: none;
            background-color: #005AA7;
            color: white;
            padding: 10px 25px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            width: fit-content;
            margin-left: auto;
            margin-right: auto;
        }

        .back-link:hover {
            background-color: #0074D9;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="profile-wrapper">
    <div class="profile-left">
        <div class="avatar"><%= name != null && name.length() > 0 ? name.substring(0, 1).toUpperCase() : "U" %></div>
        <h2><%= name %></h2>
        <p><%= role %></p>
    </div>
    <div class="profile-right">
        <h3>Profile Details</h3>
        <div class="info-item">
            <div class="label">Full Name:</div>
            <div class="value"><%= name %></div>
        </div>
        <div class="info-item">
            <div class="label">Email:</div>
            <div class="value"><%= email %></div>
        </div>
        <div class="info-item">
            <div class="label">Address:</div>
            <div class="value">
                <%= houseNo != null ? houseNo : "" %>
                <%= (houseNo != null && !houseNo.isEmpty() && street != null && !street.isEmpty()) ? ", " : "" %>
                <%= street != null ? street : "" %>
                <%= (street != null && !street.isEmpty() && city != null && !city.isEmpty()) ? ", " : "" %>
                <%= city != null ? city : "" %>
            </div>
        </div>

        <div class="info-item">
            <div class="label">Date of Birth:</div>
            <div class="value"><%= dob %></div>
        </div>
        <div class="info-item">
            <div class="label">Gender:</div>
            <div class="value"><%= gender %></div>
        </div>
        <div class="info-item">
            <div class="label">Role:</div>
            <div class="value"><%= role %></div>
        </div>
<a class="back-link" href="<%= "admin".equalsIgnoreCase(role) ? "adminDashboard.jsp" : "dashboard.jsp" %>"> Back to Dashboard</a>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
