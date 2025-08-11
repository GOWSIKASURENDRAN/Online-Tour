package sevices;


import java.sql.*;
import java.util.*;
import model.Booking;
import utils.DBconnect;

public class bookingServices {

    // Method to fetch all bookings from the database
	public List<Booking> getAllBookings() {
	    List<Booking> bookings = new ArrayList<>();

	    try {
	        Connection conn = DBconnect.getConnection();
	        String query = "SELECT b.*, c.name as user_name, c.email as user_email " +
	                      "FROM booking b JOIN customer c ON b.customer_id = c.id";
	        PreparedStatement stmt = conn.prepareStatement(query);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            Booking booking = new Booking();
	            booking.setId(rs.getInt("id"));
	            booking.setUserName(rs.getString("user_name"));
	            booking.setUserEmail(rs.getString("user_email"));
	            booking.setPackageId(rs.getInt("package_id"));
	            booking.setTravelDate(rs.getString("travel_date"));
	            booking.setPersons(rs.getInt("persons"));
	            booking.setStatus(rs.getString("status"));
	            bookings.add(booking);
	        }


	        conn.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return bookings;
	}
    
	// Method to update booking status
	public void updateBookingStatus(int id, String status) throws ClassNotFoundException {
	    try (Connection conn = DBconnect.getConnection()) {
	        String query = "UPDATE booking SET status = ? WHERE id = ?";
	        PreparedStatement stmt = conn.prepareStatement(query);
	        stmt.setString(1, status);
	        stmt.setInt(2, id);
	        
	        int rowsAffected = stmt.executeUpdate();
	        if (rowsAffected > 0) {
	            System.out.println("Booking status updated successfully");
	        } else {
	            System.out.println("No booking found with ID: " + id);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}


    // Method to delete booking
	public boolean deleteBookingById(int id) {
	    boolean rowDeleted = false;
	    try {
	        Connection conn = DBconnect.getConnection(); // use your DBconnect class
	        String sql = "DELETE FROM booking WHERE id = ?";
	        PreparedStatement stmt = conn.prepareStatement(sql);
	        stmt.setInt(1, id);
	        rowDeleted = stmt.executeUpdate() > 0;
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return rowDeleted;
	}



    // Method to add a booking to the database
    public static boolean addBooking(int userId, Booking booking) throws ClassNotFoundException {
        String sql = "INSERT INTO booking (customer_id, package_id, travel_date, persons, status, created_at) "
                   + "VALUES (?, ?, ?, ?, ?, NOW())";
        
        try (Connection conn = DBconnect.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, booking.getPackageId());
            stmt.setString(3, booking.getTravelDate());
            stmt.setInt(4, booking.getPersons());
            stmt.setString(5, booking.getStatus());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Booking> getBookingsByUser(String userName) throws ClassNotFoundException {
        List<Booking> bookings = new ArrayList<>();

        try {
            Connection conn = DBconnect.getConnection();
            
            // Query to fetch bookings based on the user's name
            String query = "SELECT b.*, c.name as user_name, c.email as user_email " +
                           "FROM booking b JOIN customer c ON b.customer_id = c.id " +
                           "WHERE c.name = ?"; // Filter by the user's name

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, userName); // Set the user name in the query
            ResultSet rs = stmt.executeQuery();

            // Process the results
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setId(rs.getInt("id"));
                booking.setUserName(rs.getString("user_name"));
                booking.setUserEmail(rs.getString("user_email"));
                booking.setPackageId(rs.getInt("package_id"));
                booking.setTravelDate(rs.getString("travel_date"));
                booking.setPersons(rs.getInt("persons"));
                booking.setStatus(rs.getString("status"));
                bookings.add(booking);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bookings;
    }

}


