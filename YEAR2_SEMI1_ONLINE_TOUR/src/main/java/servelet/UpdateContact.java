package servelet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import sevices.ContactServices;
import model.Contact;

@WebServlet("/UpdateContact")
public class UpdateContact extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Contact updated = new Contact(id, 0, name, email, message); // customer_id not needed here
        ContactServices service = new ContactServices();
        boolean success = service.updateContact(updated);

        response.sendRedirect("sentMessages.jsp");
    }
}
