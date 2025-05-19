package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (name != null && email != null && password != null && role != null) {
            String id = "U" + System.currentTimeMillis();
            String userData = id + "," + name + "," + email + "," + password + "," + role + "\n";

            FileWriter writer = new FileWriter("users.txt", true);
            writer.write(userData);
            writer.close();

            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);
            session.setAttribute("userRole", role);

            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}