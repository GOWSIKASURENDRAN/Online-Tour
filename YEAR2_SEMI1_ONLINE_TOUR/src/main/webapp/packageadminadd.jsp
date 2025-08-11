<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   
    if (session.getAttribute("adminUsername") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Package Admin | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
 
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="admindashboard.jsp" >Dashboard</a></li>
        <li><a href="packageadmin.jsp" class="active">Manage Packages</a></li>
        <li><a href="bookingadmin.jsp">Manage Bookings</a></li>
        <li><a href="contactadmin.jsp">Manage Contacts</a></li>
        <li><a href="profileadmin.jsp">Manage Users</a></li>
        <li><a href="adminlogout.jsp">Logout</a></li>
      </ul>
    </nav>
  </header>

  
  <section class="admin-section">
    <div class="admin-container">
      <h2>Package Management</h2>
      
      
      <h3>Add New Package</h3>
     <form id="addPackageForm" method="post" action="addPackage">
  <label for="packageName">Package Name</label>
  <input type="text" id="packageName" name="package_name" required placeholder="Package name">

  <label for="packageDescription">Description</label>
  <textarea id="packageDescription" name="package_description" required placeholder="Package description"></textarea>

  <label for="packagePrice">Price</label>
  <input type="number" id="packagePrice" name="package_price" required placeholder="Price in LKR">

  <label for="packageImage">Image URL</label>
  <input type="url" id="packageImage" name="package_imageurl" required placeholder="Image URL">

  <button type="submit" class="btn">Add Package</button>
</form>
<% if (request.getAttribute("error") != null) { %>
  <p style="color:red;"><%= request.getAttribute("error") %></p>
<% } %>


      
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

  
</body>
</html>
