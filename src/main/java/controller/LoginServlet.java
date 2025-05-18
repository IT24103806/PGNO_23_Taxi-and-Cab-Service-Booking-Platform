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
        String houseNo="";
        String street="";
        String city="";
        String dob = "";
        String gender = "";

        if (file.exists()) {
            Scanner scanner = new Scanner(file);
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                String[] data = line.split(",");
                if (data.length >= 6 && data[2].equals(email) && data[3].equals(password)) {
                    success = true;
                    role = data[9];
                    name = data[1]; // assuming name is at index 0
                    houseNo=data[4];// assuming address is at index 5
                    street = data[5];
                    city = data[6];
                    dob = data[7]; // assuming dob is at index 6
                    gender = data[8]; // assuming gender is at index 7

                    // Set all user details in the session
                    HttpSession session = request.getSession();
                    session.setAttribute("userEmail", email);
                    session.setAttribute("userRole", role);
                    session.setAttribute("userName", name);
                    session.setAttribute("userHouseNo", houseNo);
                    session.setAttribute("userStreet", street);
                    session.setAttribute("userCity", city);
                    session.setAttribute("userDOB", dob);
                    session.setAttribute("userGender", gender);
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
            // Pass the error message to the JSP
            request.setAttribute("errorMessage", "Invalid email or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
