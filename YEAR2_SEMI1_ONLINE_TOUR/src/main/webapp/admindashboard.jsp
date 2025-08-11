<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Redirect if not logged in as admin
    if (session.getAttribute("adminUsername") == null) {
        response.sendRedirect("adminlogin.jsp"); 
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin Dashboard | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  
  <header class="navbar">
    <div class="logo">Admin Dashboard</div>
    <nav>
      <ul class="nav-links">
        <li><a href="admindashboard.jsp" class="active">Dashboard</a></li>
        <li><a href="packageadmin.jsp">Manage Packages</a></li>
        <li><a href="bookingadmin.jsp">Manage Bookings</a></li>
        <li><a href="contactadmin.jsp">Manage Contacts</a></li>
        <li><a href="profileadmin.jsp">Manage Users</a></li>
        <li><a href="adminlogout.jsp">Logout</a></li>
      </ul>
    </nav>
  </header>


  <section class="form-section">
    <div class="form-container">
      <h2>Welcome, Admin!</h2>
      <p>Use the navigation bar to manage the system.</p>
    </div>
  </section>

  
  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>
</body>
</html>
