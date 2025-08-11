package servelet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Package;
import sevices.packageService;


@WebServlet("/viewPackage")
public class viewPackage extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public viewPackage() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		packageService sc = new packageService();
		ArrayList<Package> Package = sc.getAllPackage(); 
		request.setAttribute("Package",Package);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("packageadmin.jsp");
		dispatcher.forward(request, response);
	}

}
