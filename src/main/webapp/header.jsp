<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession currentSession = request.getSession(false);
    String currentUserEmail = null;
    String currentUserName = null;

    if (currentSession != null) {
        currentUserEmail = (String) currentSession.getAttribute("userEmail");
        currentUserName = (String) currentSession.getAttribute("userName");
    }
%>

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

    <div class="auth-buttons">
        <%
            if (currentUserEmail != null) {
        %>

        <a href="userProfile.jsp" class="btn profile">Profile</a>
        <a href="logout.jsp" class="btn logout">Logout</a>
        <%
        } else {
        %>
        <a href="login.jsp" class="btn login">Login</a>
        <a href="register.jsp" class="btn register">Register</a>
        <%
            }
        %>
    </div>
</div>

<style>
    .site-header {
        background-color: #004080;
        color: white;
        padding: 10px 30px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
    }

    .logo h2 {
        margin: 0;
        font-size: 24px;
        color: #ddd;
    }

    .logo span {
        font-size: 12px;
        color: #ddd;
    }

    .nav-links {
        display: flex;
        gap: 15px;
        flex-wrap: wrap;
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

    .auth-buttons {
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .btn {
        padding: 6px 14px;
        border-radius: 4px;
        font-weight: bold;
        text-decoration: none;
        transition: background-color 0.3s;
    }

    .btn.login {
        background-color: #f0ad4e;
        color: black;
    }

    .btn.register {
        background-color: #ff5c33;
        color: white;
    }

    .btn.logout {
        background-color: #d9534f;
        color: white;
    }

    .btn.profile {
        background-color: #007bff;
        color: white;
    }

    .btn:hover {
        opacity: 0.8;
    }
</style>
