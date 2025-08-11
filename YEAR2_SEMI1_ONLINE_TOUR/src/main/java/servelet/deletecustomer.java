package servelet;

import model.Customer;
import sevices.customerService; 

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deleteCustomer")
public class deletecustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        System.out.println("Deleting customer with ID: " + id);  

        customerService service = new customerService();
        try {
			service.deleteCustomerById(id);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        response.sendRedirect("profileadmin.jsp"); // Redirect after delete
    }
}
