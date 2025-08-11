package servelet;

import sevices.packageService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/deletePackage")
public class deletePackage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                packageService service = new packageService();
                service.deletePackage(id);
            } catch (NumberFormatException e) {
                e.printStackTrace(); // Invalid 
            }
        }

        response.sendRedirect("packageadmin.jsp");
    }
}
