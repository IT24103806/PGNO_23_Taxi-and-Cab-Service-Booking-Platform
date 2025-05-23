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
        String houseNo = request.getParameter("houseNo");
        String street = request.getParameter("street");
        String city = request.getParameter("city");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String role = request.getParameter("role");

        HttpSession session = request.getSession();

        if (name != null && email != null && password != null &&
                houseNo != null && street != null && city != null &&
                dob != null && gender != null && role != null) {

            String id = "U" + System.currentTimeMillis();
            String userData = id + "," + name + "," + email + "," + password + "," +
                    houseNo + "," + street + "," + city + "," + dob + "," + gender + "," + role;

            String path = getServletContext().getRealPath("/data/users.txt");
            try (BufferedWriter fw = new BufferedWriter(new FileWriter(path, true))) {
                fw.write(userData);
                fw.newLine();
            } catch (IOException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
                return;
            }

            session.setAttribute("userId", id);
            session.setAttribute("userName", name);
            session.setAttribute("userEmail", email);
            session.setAttribute("userRole", role);
            session.setAttribute("userHouseNo", houseNo);
            session.setAttribute("userStreet", street);
            session.setAttribute("userCity", city);
            session.setAttribute("userDOB", dob);
            session.setAttribute("userGender", gender);

            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
