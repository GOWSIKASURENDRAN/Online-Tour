package servelet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Package;
import sevices.packageService;

@WebServlet("/addPackage")
public class addPackage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public addPackage() {
        super();
    }

    // do get is not being used to handle form data
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    // handle form submission with POST method
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from the request
        String packageName = request.getParameter("package_name");
        String packageDescription = request.getParameter("package_description");
        String packagePriceStr = request.getParameter("package_price");
        String packageImageUrl = request.getParameter("package_imageurl");

        // validation check 
        if (packageName == null || packageDescription == null || packagePriceStr == null || packageImageUrl == null) {
            // redirect or forward to an error page 
            response.sendRedirect("error.jsp");
            return;
        }

        
        double packagePrice = 0.0;
        try {
            packagePrice = Double.parseDouble(packagePriceStr);
        } catch (NumberFormatException e) {
            // handle error if price is not a valid number
            request.setAttribute("errorMessage", "Invalid price format");
            RequestDispatcher dispatcher = request.getRequestDispatcher("packageadmin.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // create Package object and set values
        Package p = new Package();
        p.setPackage_name(packageName);
        p.setPackage_description(packageDescription);
        p.setPackage_price(packagePrice);
        p.setPackage_imageurl(packageImageUrl);

        // call service method to register the package
        packageService packageService = new packageService();
        packageService.regPackage(p); // ensure the service method works correctly and adds package to DB

        // after adding, forward the request back to the package admin page
        RequestDispatcher dispatcher = request.getRequestDispatcher("packageadmin.jsp");
        dispatcher.forward(request, response);
    }
}
