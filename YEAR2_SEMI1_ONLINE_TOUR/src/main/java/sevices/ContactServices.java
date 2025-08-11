package sevices;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Contact;
import utils.DBconnect;

public class ContactServices {
//add contact 
    public boolean addContact(Contact contact) {
        String sql = "INSERT INTO contact (customer_id, name, email, message) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBconnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, contact.getCustomerId());
            stmt.setString(2, contact.getName());
            stmt.setString(3, contact.getEmail());
            stmt.setString(4, contact.getMessage());

            int rows = stmt.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Contact> getContactsByCustomerId(int customerId) {
        List<Contact> list = new ArrayList<>();
        String sql = "SELECT * FROM contact WHERE customer_id = ?";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Contact c = new Contact(
                    rs.getInt("id"),
                    rs.getInt("customer_id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("message")
                );
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    //get one contact
    public Contact getContactById(int id) {
        Contact contact = null;
        String sql = "SELECT * FROM contact WHERE id = ?";
        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                contact = new Contact(
                    rs.getInt("id"),
                    rs.getInt("customer_id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("message")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return contact;
    }
    //update contact
    public boolean updateContact(Contact contact) {
        String sql = "UPDATE contact SET name = ?, email = ?, message = ? WHERE id = ?";
        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getMessage());
            ps.setInt(4, contact.getId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    //delete contact
    public boolean deleteContactById(int id) {
        boolean rowDeleted = false;
        try {
            Connection conn = DBconnect.getConnection(); // Updated to match your class
            String sql = "DELETE FROM contact WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rowDeleted = stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
    
    //get all contact
    public List<Contact> getAllContacts() {
        List<Contact> contactList = new ArrayList<>();
        String sql = "SELECT * FROM contact";

        try (Connection con = DBconnect.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Contact contact = new Contact(
                    rs.getInt("id"),
                    rs.getInt("customer_id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("message")
                );
                contactList.add(contact);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return contactList;
    }








}
