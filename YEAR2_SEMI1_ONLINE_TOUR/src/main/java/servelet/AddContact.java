package servelet;

import model.Contact;
import sevices.ContactServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddContact")
public class AddContact extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get session data
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("userName");
        String email = (String) session.getAttribute("userEmail");
        int customerId = (int) session.getAttribute("userId"); // You must store userId in session at login

        // Get form data
        String message = request.getParameter("message");

        // Create Contact object
        Contact contact = new Contact(customerId, name, email, message);

        // Insert into DB
        ContactServices contactServices = new ContactServices();
        boolean success = contactServices.addContact(contact);

        if (success) {
            response.sendRedirect("contact.jsp?success=1");
        } else {
            response.sendRedirect("contact.jsp?error=1");
        }
    }
}
