<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: url("taxicab_2.jpg") no-repeat center center fixed;
        background-size: cover;
        color: #333;
        margin: 0;
        padding: 20px;
        position: relative;
    }


    body::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: -1;
    }

    h2, h1 {
        text-align: center;
        color: #ffffff;
        text-shadow: 0 0 8px white;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        background: linear-gradient(to bottom, #FFD700, #FFA500);
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        border-radius: 8px;
        overflow: hidden;
    }

    th, td {
        padding: 12px;
        text-align: center;
        border: 1px solid #ccc;
    }

    th {
        background: linear-gradient(to bottom, #FFC107, #FFD700);
        color: white;
        font-size: 16px;
        font-weight: bold;
    }

    td {
        background-color: #FF8C00;
    }

    a, button, input[type="submit"] {
        background-color: #FF8C00;
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
        background-color: #FFA500;
    }

    form {
        width: 300px;
        margin: 20px auto;
        background: rgba(255, 165, 0, 0.9);
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    input[type="text"], input[type="password"], select {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
</style>


<%@ page import="java.io.*, java.util.*" %>
<html>
<head><title>Sort Drivers by Rating</title></head>
<body>
<h2>Sorted Drivers by Rating (High to Low)</h2>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Email</th><th>Rating</th></tr>
<%
    class Driver {
        String id, name, email;
        double rating;

        Driver(String id, String name, String email, double rating) {
            this.id = id;
            this.name = name;
            this.email = email;
            this.rating = rating;
        }
    }

    List<Driver> drivers = new ArrayList<>();
    File file = new File("users.txt");
    if (file.exists()) {
        Scanner scanner = new Scanner(file);
        while (scanner.hasNextLine()) {
            String[] data = scanner.nextLine().split(",");
            if (data.length >= 6 && "driver".equalsIgnoreCase(data[4])) {
                drivers.add(new Driver(data[0], data[1], data[2], Double.parseDouble(data[5])));
            }
        }
        scanner.close();
    }

    // Bubble sort
    for (int i = 0; i < drivers.size() - 1; i++) {
        for (int j = 0; j < drivers.size() - i - 1; j++) {
            if (drivers.get(j).rating < drivers.get(j + 1).rating) {
                Driver temp = drivers.get(j);
                drivers.set(j, drivers.get(j + 1));
                drivers.set(j + 1, temp);
            }
        }
    }

    for (Driver d : drivers) {
%>
<tr>
    <td><%= d.id %></td>
    <td><%= d.name %></td>
    <td><%= d.email %></td>
    <td><%= d.rating %></td>
</tr>
<% } %>
</table>
</body>
</html>