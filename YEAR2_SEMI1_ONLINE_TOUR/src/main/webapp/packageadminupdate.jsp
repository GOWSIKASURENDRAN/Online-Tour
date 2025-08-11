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
        <li><a href="admindashboard.jsp" class="active">Dashboard</a></li>
        <li><a href="packageadmin.jsp">Manage Packages</a></li>
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
      <h3>Update Package</h3>

      <form id="updatePackageForm" method="post" action="updatePackage">
        <input type="hidden" name="id" value="${param.id}" />

        <label for="packageName">Package Name</label>
        <input type="text" id="packageName" name="package_name" required value="${param.package_name}" placeholder="Package name">

        <label for="packageDescription">Description</label>
        <textarea id="packageDescription" name="package_description" required placeholder="Package description">${param.package_description}</textarea>

        <label for="packagePrice">Price</label>
        <input type="number" id="packagePrice" name="package_price" required value="${param.package_price}" placeholder="Price in LKR">

        <label for="packageImage">Image URL</label>
        <input type="url" id="packageImage" name="package_imageurl" required value="${param.package_imageurl}" placeholder="Image URL">

        <button type="submit" class="btn">Update Package</button>
      </form>

    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

</body>
</html>
