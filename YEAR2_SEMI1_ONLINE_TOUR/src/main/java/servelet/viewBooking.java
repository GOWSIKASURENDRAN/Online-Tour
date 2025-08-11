package servelet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Booking;
import sevices.bookingServices;

@WebServlet("/viewBooking")
public class viewBooking extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        bookingServices bookingService = new bookingServices();
        List<Booking> bookings = bookingService.getAllBookings(); 

        // Debugging output to ensure bookings are fetched
        System.out.println("Total bookings found: " + bookings.size());
        
        // Set the bookings list in the request
        if (bookings != null && !bookings.isEmpty()) {
            request.setAttribute("bookings", bookings);
        }
        
        // Forward the request to bookingadmin.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("bookingadmin.jsp");
        dispatcher.forward(request, response);
    }
}
