package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.Scanner;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        File file = new File("users.txt");
        boolean success = false;
        String role = "";
        String name = "";

        if (file.exists()) {
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] data = line.split(",");
                if (data.length >= 5 && data[2].equals(email) && data[3].equals(password)) {
                    success = true;
                    name = data[1];
                    role = data[4];

                    HttpSession session = request.getSession();
                    session.setAttribute("userName", name);
                    session.setAttribute("userEmail", email);
                    session.setAttribute("userRole", role);

                    break;
                }
            }
            scanner.close();
        }

        if (success) {
            if ("admin".equals(role)) {
                response.sendRedirect("adminDashboard.jsp");
            } else {
                response.sendRedirect("dashboard.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
