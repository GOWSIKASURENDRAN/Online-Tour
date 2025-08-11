package servelet;

import model.Package;
import sevices.packageService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/updatePackage")
public class updatePackage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // set encoding for handling special characters
        request.setCharacterEncoding("UTF-8");

        // view updated data from form
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("package_name");
        String description = request.getParameter("package_description");
        double price = Double.parseDouble(request.getParameter("package_price"));
        String imageUrl = request.getParameter("package_imageurl");

        // create package object
        Package p = new Package();
        p.setId(id);
        p.setPackage_name(name);
        p.setPackage_description(description);
        p.setPackage_price(price);
        p.setPackage_imageurl(imageUrl);

        // update using service
        packageService service = new packageService();
        service.updatePackage(p);

        // redirect back to admin page
        response.sendRedirect("packageadmin.jsp");
        
        
    }
}
