package servelet;


import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sevices.bookingServices;

@WebServlet("/deleteBooking")
public class DeleteBooking extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteBooking() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            bookingServices service = new bookingServices();
            boolean success = service.deleteBookingById(id);

            if (success) {
                response.sendRedirect("bookingadmin.jsp?success=deleted");
            } else {
                response.sendRedirect("bookingadmin.jsp?error=deleteFailed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("bookingadmin.jsp?error=deleteFailed");
        }
    }
}