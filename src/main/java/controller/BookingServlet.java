package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerId = request.getParameter("customerId");
        String pickup = request.getParameter("pickup");
        String drop = request.getParameter("drop");
        String cabType = request.getParameter("cabType");
        String time = request.getParameter("time");

        if (customerId != null && pickup != null && drop != null && cabType != null && time != null) {
            String bookingId = "B" + System.currentTimeMillis();
            String bookingData = bookingId + "," + customerId + ",-," + pickup + "," + drop + "," + cabType + "," + time;

            String path = getServletContext().getRealPath("/data/bookings.txt");
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(path, true))) {
                writer.write(bookingData);
                writer.newLine();
            } catch (IOException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
                return;
            }

            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}