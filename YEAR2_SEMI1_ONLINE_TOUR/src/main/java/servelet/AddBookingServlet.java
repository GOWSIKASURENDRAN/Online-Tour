package servelet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Booking;
import sevices.bookingServices;

import java.sql.*;
import utils.DBconnect;

@WebServlet("/addBooking")
public class AddBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user session details
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            // If the user is not logged in, redirect to the login page
            response.sendRedirect("login.jsp");
            return;
        }

        // Get booking details from the form
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        int packageId = Integer.parseInt(request.getParameter("package"));
        String travelDate = request.getParameter("travelDate");
        int persons = Integer.parseInt(request.getParameter("persons"));

        // Create a Booking object and insert it into the database
        Booking booking = new Booking();
        booking.setUserName(fullName);
        booking.setUserEmail(email);
        booking.setPackageId(packageId);
        booking.setTravelDate(travelDate);
        booking.setPersons(persons);
        booking.setStatus("Pending"); // Default status

        bookingServices bookingService = new bookingServices();
        boolean success = false;
		try {
			success = bookingServices.addBooking(userId, booking);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        if (success) {
            // After booking is successful, redirect to the profile page
            response.sendRedirect("profile.jsp");
        } else {
            // If booking failed, show an error message
            request.setAttribute("errorMessage", "Booking failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("booking.jsp");
            dispatcher.forward(request, response);
        }
    }
}
