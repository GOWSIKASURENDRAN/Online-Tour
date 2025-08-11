package servelet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Booking;
import sevices.bookingServices;

@WebServlet("/viewProfileone")
public class viewProfileone extends HttpServlet {

    private bookingServices bookingService = new bookingServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the user data from session
        String userName = (String) request.getSession().getAttribute("userName");

        // Check if user is logged in
        if (userName == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Debugging: Check if the userName is correctly retrieved
        System.out.println("Session userName: " + userName);

        // Get the bookings for the logged-in user using the bookingServices class
        List<Booking> bookings;
        try {
            bookings = bookingService.getBookingsByUser(userName);

            // Debugging: Check if bookings are fetched correctly
            if (bookings.isEmpty()) {
                System.out.println("No bookings found for user: " + userName);
            } else {
                System.out.println("Bookings for user: " + userName);
                for (Booking booking : bookings) {
                    System.out.println("Booking ID: " + booking.getId() + ", Package ID: " + booking.getPackageId());
                }
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return; // Return if error occurs
        }

        // Set the user's name and bookings in the request attributes
        request.setAttribute("userName", userName); 
        request.setAttribute("bookings", bookings);  

        // Forward the request to profile.jsp to display the user data
        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
        dispatcher.forward(request, response);
    }

}
