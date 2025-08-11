package sevices;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;  // Use ArrayList from java.util
import java.util.List;  // Use List from java.util

import com.mysql.jdbc.Statement;

import model.Customer;
import utils.DBconnect;
//add customer
public class customerService {
    public void regCustomer(Customer c) {
        try {
            String query = "insert into customer(name,email,password) values('"+c.getName()+"','"+c.getEmail()+"','"+c.getPassword()+"')";
            Statement statement = (Statement) DBconnect.getConnection().createStatement();
            statement.executeUpdate(query);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
//check for login
    public Customer validate(Customer c) {
        try {
            String query = "select * from customer where email = '"+c.getEmail()+"' and password ='"+c.getPassword()+"'";
            Statement statement = (Statement) DBconnect.getConnection().createStatement();
            ResultSet ResultSet = statement.executeQuery(query);

            if(ResultSet.next()) {
                Customer customer = new Customer();
                customer.setId(ResultSet.getInt("id"));
                customer.setName(ResultSet.getString("name"));
                customer.setEmail(ResultSet.getString("email"));
                customer.setPassword(ResultSet.getString("password"));
                return customer;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
//update customer
    public boolean updateCustomerDetails(String userId, String name, String email, String password) {
        try {
            String query = "UPDATE customer SET name = ?, email = ?, password = ? WHERE id = ?";
            PreparedStatement statement = DBconnect.getConnection().prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.setString(4, userId);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0; // Return true if at least one row was updated
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
//delete customer
    public void deleteCustomerById(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM customer WHERE id = ?";
        
        try (Connection con = DBconnect.getConnection(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id); // Set the customer id to be deleted
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("Customer deleted successfully");
            } else {
                System.out.println("Customer not found for deletion");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }




// get all customer details
    public List<Customer> getAllCustomers() throws ClassNotFoundException {
        List<Customer> customers = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBconnect.getConnection();
            String query = "SELECT * FROM customer";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setEmail(rs.getString("email"));
                customer.setPassword(rs.getString("password"));
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customers;
    }
}

