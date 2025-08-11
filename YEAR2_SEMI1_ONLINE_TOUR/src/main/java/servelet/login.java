package servelet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customer;
import sevices.customerService;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Customer c = new Customer();
        c.setEmail(request.getParameter("email"));
        c.setPassword(request.getParameter("password"));

        customerService s = new customerService();
        Customer loggedInCustomer = s.validate(c); 

        if (loggedInCustomer != null) {
            // set session attributes for logged-in user
            HttpSession session = request.getSession(true); // ensure new session is created if necessary
            session.setAttribute("userId", loggedInCustomer.getId());
            session.setAttribute("userName", loggedInCustomer.getName());
            session.setAttribute("userEmail", loggedInCustomer.getEmail());

            // go to profile.jsp
            response.sendRedirect("profile.jsp"); // Redirect to profile instead of using forward
        } else {
            // set error message if login fails
        	response.sendRedirect("login.jsp?error=1");

        }
    }
}
