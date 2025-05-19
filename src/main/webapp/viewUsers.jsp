<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        :root {
            --primary-color: #1a3c6e;
            --secondary-color: #f7a928;
            --accent-color: #17a2b8;
            --light-color: #f4f4f4;
            --dark-color: #333;
            --transition-speed: 0.3s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            overflow-x: hidden;
            background: url("backgroundImage1.png") no-repeat center center fixed;
            background-size: cover;
            color: #333;
        }

        /* Header and Logo */
        .header {
            background-color: var(--primary-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 5%;
            color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .logo-container {
            display: flex;
            align-items: center;
        }

        .logo-text {
            font-size: 32px;
            font-weight: bold;
            letter-spacing: 1px;
            margin-left: 10px;
        }

        .subheading {
            font-size: 14px;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-top: -5px;
        }


        /* Navigation Bar */
        .navbar {
            background-color: #f0f0f0;
            display: flex;
            overflow: hidden;
        }

        .nav-item {
            padding: 15px 25px;
            color: var(--dark-color);
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s;
            position: relative;
        }

        .nav-item:hover, .nav-item.active {
            background-color: var(--secondary-color);
            color: white;
        }

        .nav-item.active {
            background-color: var(--secondary-color);
        }

        /* Content Section */
        .content-container {
            width: 90%;
            max-width: 1200px;
            margin: 30px auto;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        .page-title {
            font-size: 28px;
            color: var(--primary-color);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid var(--secondary-color);
            text-align: center;
        }

        /* User Table Styles */
        .user-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            border-radius: 8px;
        }

        .user-table thead {
            background-color: #003366;
            color: white;
        }

        .user-table th,
        .user-table td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ccc;
        }

        .user-table th {
            font-weight: 600;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 1px;
            background-color: #003366;
        }

        .user-table tbody tr:hover {
            background-color: rgba(247, 169, 40, 0.1);
        }

        .user-table tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* Action Buttons */
        .action-btn {
            display: inline-block;
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: 600;
            text-align: center;
            transition: all 0.3s;
            margin: 0 5px;
        }

        .edit-btn {
            background-color: #005AA7;
            color: white;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .add-btn {
            background-color: #005AA7;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            margin-bottom: 20px;
            display: inline-block;
        }

        .action-btn:hover {
            background-color: #0074D9;
            transform: translateY(-2px);
        }

        /* Search Section */
        .search-container {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .search-form {
            display: flex;
            flex: 1;
            max-width: 500px;
        }

        .search-input {
            flex: 1;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 5px 0 0 5px;
            font-size: 16px;
        }

        .search-button {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .search-button:hover {
            background-color: #12294e;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 40px 20px;
            margin: 20px 0;
            background-color: var(--light-color);
            border-radius: 8px;
        }

        .empty-state-icon {
            font-size: 48px;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .empty-state-text {
            font-size: 18px;
            color: var(--dark-color);
            margin-bottom: 20px;
        }

        /* Card View for Mobile */
        .user-cards {
            display: none;
        }

        .user-card {
            background-color: white;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .card-header {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 10px;
            color: var(--primary-color);
        }

        .card-info {
            margin-bottom: 5px;
        }

        .card-info span {
            font-weight: 600;
            color: var(--dark-color);
        }

        .card-actions {
            margin-top: 15px;
            display: flex;
            justify-content: flex-end;
        }

        /* Footer */
        .footer {
            background-color: var(--primary-color);
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }

        /* Pagination */
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination-btn {
            background-color: var(--light-color);
            border: 1px solid #ddd;
            padding: 8px 15px;
            margin: 0 5px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .pagination-btn.active {
            background-color: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }

        .pagination-btn:hover:not(.active) {
            background-color: #ddd;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                text-align: center;
            }

            .login-section {
                margin-top: 10px;
                text-align: center;
            }

            .navbar {
                flex-wrap: wrap;
                justify-content: center;
            }

            .content-container {
                width: 95%;
                padding: 15px;
            }

            .user-table {
                display: none;
            }

            .user-cards {
                display: block;
            }

            .search-container {
                flex-direction: column;
                align-items: stretch;
            }

            .search-form {
                max-width: 100%;
                margin-bottom: 10px;
            }

            .add-btn {
                width: 100%;
                text-align: center;
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
<!-- Header Section -->
<div class="header">
    <div class="logo-container">
        <div>
            <div class="logo-text">Swift Rides</div>
            <div class="subheading">Premium Cab Service</div>
        </div>
    </div>
</div>

<!-- Navigation Bar -->
<div class="navbar">
    <a href="index.jsp" class="nav-item">Home</a>
    <a href="#" class="nav-item">Our Services</a>
    <a href="#" class="nav-item">Bookings</a>
    <a href="#" class="nav-item">Destinations</a>
    <a href="#" class="nav-item">About Us</a>
    <a href="#" class="nav-item active">User Management</a>
</div>

<!-- Content Section -->
<div class="content-container">
    <h1 class="page-title"><i class="fas fa-users icon"></i> Registered Users</h1>

    <div class="search-container">
        <form class="search-form" method="get">
            <input type="text" name="search" class="search-input" placeholder="Search users..." value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
            <button type="submit" class="search-button"><i class="fas fa-search"></i></button>
        </form>
        <a href="register.jsp" class="action-btn add-btn"><i class="fas fa-user-plus"></i> Add New User</a>
    </div>

    <%
        File file = new File(System.getProperty("user.dir") + File.separator + "data" + File.separator + "users.txt");
        List<String[]> users = new ArrayList<>();
        String searchQuery = request.getParameter("search");

        if (file.exists()) {
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine().trim();
                if (!line.isEmpty()) {
                    String[] userData = line.split(",");
                    if (userData.length >= 10) {
                        if (searchQuery == null || searchQuery.isEmpty() ||
                                userData[0].toLowerCase().contains(searchQuery.toLowerCase()) ||
                                userData[1].toLowerCase().contains(searchQuery.toLowerCase()) ||
                                userData[2].toLowerCase().contains(searchQuery.toLowerCase())) {
                            users.add(userData);
                        }
                    }
                }
            }
            scanner.close();
        }
    %>


    <% if (users.isEmpty()) { %>
    <div class="empty-state">
        <div class="empty-state-icon"><i class="fas fa-users-slash"></i></div>
        <p class="empty-state-text">No users found. Add a new user to get started.</p>
        <a href="register.jsp" class="action-btn add-btn"><i class="fas fa-user-plus"></i> Add New User</a>
    </div>
    <% } else { %>
    <!-- Table view (desktop) -->
    <table class="user-table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% for (String[] user : users) { %>
        <tr>
            <td><%= user[0] %></td>
            <td><%= user[1] %></td>
            <td><%= user[2] %></td>
            <td><%= user.length > 4 ? user[4] : "User" %></td>
            <td>
                <a href="editUser.jsp?email=<%= user[2] %>" class="action-btn edit-btn"><i class="fas fa-edit"></i></a>
                <a href="deleteUser.jsp?email=<%= user[2] %>" class="action-btn delete-btn"><i class="fas fa-trash-alt"></i></a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

    <!-- Card view (mobile) -->
    <div class="user-cards">
        <% for (String[] user : users) { %>
        <div class="user-card">
            <div class="card-header"><%= user[1] %></div>
            <div class="card-info"><span>ID:</span> <%= user[0] %></div>
            <div class="card-info"><span>Email:</span> <%= user[2] %></div>
            <div class="card-info"><span>Role:</span> <%= user.length > 4 ? user[9] : "User" %></div>
            <div class="card-actions">
                <a href="editUser.jsp?email=<%= user[2] %>" class="action-btn edit-btn"><i class="fas fa-edit"></i></a>
                <a href="deleteUser.jsp?email=<%= user[2] %>" class="action-btn delete-btn"><i class="fas fa-trash-alt"></i></a>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Simple pagination -->
    <div class="pagination">
        <button class="pagination-btn active">1</button>
        <button class="pagination-btn">2</button>
        <button class="pagination-btn">3</button>
        <button class="pagination-btn"><i class="fas fa-chevron-right"></i></button>
    </div>
    <% } %>
</div>

<!-- Footer -->
<div class="footer">
    <p>&copy; 2025 Swift Rides - Premium Cab Service. All rights reserved.</p>
</div>

</body>
</html>