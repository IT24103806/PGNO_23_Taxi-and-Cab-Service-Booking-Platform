<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: url("new_background3.jpg") no-repeat center center fixed;
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

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ccc;
    }
    .back-btn {
        background-color: #333;
        color: white;
        font-size: 16px;
        padding: 10px 20px;
        border-radius: 30px;
        text-decoration: none;
        display: inline-block;
        cursor: pointer;
        position: fixed;
        bottom: 20px;
        left: 20px;
        transition: all 0.3s ease-in-out;
    }

    .back-btn:hover {
        background-color: #555;
        transform: scale(1.1);
    }


    th {
        background-color: #003366;
        color: white;
    }

    a, button, input[type="submit"] {
        background-color: #005AA7;
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
        background-color: #0074D9;
    }
    .delete-btn {
        background-color: #FF6666; /* Light red */
        color: white;
        font-size: 16px;
        font-weight: bold;
        padding: 12px 20px;
        border: none;
        border-radius: 30px; /* Rounded edges */
        text-align: center;
        cursor: pointer;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease-in-out;
        display: block;
        margin: 20px auto;
    }

    .delete-btn:hover {
        background-color: #FF3333;
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
    .message {
        text-align: center;
        font-size: 30px;
        font-weight: bold;
        color: white;
        margin-top: 50px;
        background-color: rgba(0, 0, 0, 0.4);
        padding: 30px;
        border-radius: 15px;
        width: 70%;
        margin-left: auto;
        margin-right: auto;
        box-shadow: 0px 0px 15px rgba(255,255,255,0.3);
    }
</style>

<%@ page import="java.io.*, java.util.*" %>
<html>
<head><title>Delete User</title></head>
<body>
<h2>Delete User by Email</h2>
<form method="post">
    Email: <input type="text" name="email">
    <input type="submit" value="Delete" class="delete-btn">

</form>
<%
    String emailToDelete = request.getParameter("email");
    if (emailToDelete != null && !emailToDelete.trim().isEmpty()) {
        File file = new File("users.txt");
        File tempFile = new File("temp_users.txt");

        BufferedReader reader = new BufferedReader(new FileReader(file));
        BufferedWriter writer = new BufferedWriter(new FileWriter(tempFile));

        String line;
        boolean found = false;

        while ((line = reader.readLine()) != null) {
            String[] data = line.split(",");
            if (data.length >= 3 && data[2].equalsIgnoreCase(emailToDelete)) {
                found = true;
                continue;
            }
            writer.write(line);
            writer.newLine();
        }

        writer.close();
        reader.close();

        if (file.delete() && tempFile.renameTo(file)) {
            if (found) {
%>
<div class="message">User with email <%= emailToDelete %> deleted successfully.</div>

<%
            } else {
%>
<div class="message" style="color: red;">User not found.</div>
<%
            }
        } else {
%>
<div class="message" style="color: red;">Error deleting user. Try again.</div>
<%
        }
    }
%>
<a href="adminDashboard.jsp" class="back-btn">Back</a>

</body>
</html>