package servelet;

import model.Customer;
import sevices.customerService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewCustomer")
public class viewCustomer extends HttpServlet {

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        customerService service = new customerService();
        
       
        List<Customer> users = null;
		try {
			users = service.getAllCustomers();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
        
        // check if customers were fetched
        System.out.println("Fetched " + users.size() + " customers.");
        
        
        request.setAttribute("users", users);
        
        // forward the request to the JSP page 
        RequestDispatcher dispatcher = request.getRequestDispatcher("profileadmin.jsp");
        dispatcher.forward(request, response); 
    }
}
