package servelet;

import model.Contact;
import sevices.ContactServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteContact")
public class DeleteContact extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeleteContact() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            ContactServices service = new ContactServices();
            boolean success = service.deleteContactById(id);

            if (success) {
                response.sendRedirect("sentMessages.jsp?success=deleted");
            } else {
                response.sendRedirect("sentMessages.jsp?error=deleteFailed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("sentMessages.jsp?error=deleteFailed");
        }
    }
}
