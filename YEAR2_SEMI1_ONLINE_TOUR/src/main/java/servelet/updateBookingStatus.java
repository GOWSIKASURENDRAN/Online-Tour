package servelet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sevices.bookingServices;

@WebServlet("/updateBookingStatus")
public class updateBookingStatus extends HttpServlet {

    // Booking service instance
    private bookingServices bookingService = new bookingServices();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve bookingId and status from the form submission
            String bookingIdStr = request.getParameter("bookingId");
            String status = request.getParameter("status");

            if (bookingIdStr != null && !bookingIdStr.isEmpty() && status != null) {
                // Parse bookingId to integer
                int bookingId = Integer.parseInt(bookingIdStr);

                // Call the service method to update booking status
                bookingService.updateBookingStatus(bookingId, status);

                // Redirect back to the booking admin page or show success message
                response.sendRedirect("bookingadmin.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing bookingId or status.");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid bookingId format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating booking status.");
        }
    }
}
