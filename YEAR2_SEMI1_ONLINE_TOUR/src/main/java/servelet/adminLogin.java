package servelet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import utils.DBconnect;

@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Connection conn = DBconnect.getConnection();

            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // valid admin-> create session
                HttpSession session = request.getSession();
                session.setAttribute("adminUsername", username);

                response.sendRedirect("admindashboard.jsp");
            } else {
                // invalid login
                response.sendRedirect("adminlogin.jsp?error=Invalid+username+or+password");
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminlogin.jsp?error=Server+error");
        }
    }
}
