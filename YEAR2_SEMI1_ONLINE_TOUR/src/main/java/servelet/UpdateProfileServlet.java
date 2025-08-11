package servelet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sevices.customerService;

@WebServlet("/updateCustomer")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateProfileServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // get the updated profile details from the form
        String userId = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // update the user in the database
        customerService service = new customerService();
        boolean success = service.updateCustomerDetails(userId, name, email, password);

        if (success) {
            // update  is successful
            HttpSession session = request.getSession();
            session.setAttribute("userName", name);
            session.setAttribute("userEmail", email);

            // redirect to the profile page
            response.sendRedirect("profile.jsp");
        } else {
          
            request.setAttribute("errorMessage", "Profile update failed.");
            request.getRequestDispatcher("profileupdate.jsp").forward(request, response);
        }
    }
}
