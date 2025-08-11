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
      
      
    

<form id="addPackageForm" method="post" action="packageadminadd.jsp">
<button type="submit" class="btn">Add Package</button>
</form>

<form id="addPackageForm" method="post" action="viewPackage">
<button type="submit" class="btn">Show </button>

</form>
     
      <h3>Existing Packages</h3>
      <table class="admin-table">
        <thead>
          <tr>
            <th>Package Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Image</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${Package}" >
          <!--  1 -->
          <tr>
            <td>${p.package_name }</td>
            <td>${p.package_description }</td>
            <td>${p.package_price }</td>
            <td>${p.package_imageurl }</td>
            <td>
            
	
<form method="post" action="packageadminupdate.jsp" style="display:inline;">
  <input type="hidden" name="id" value="${p.id}" />
  <input type="hidden" name="package_name" value="${p.package_name}" />
  <input type="hidden" name="package_description" value="${p.package_description}" />
  <input type="hidden" name="package_price" value="${p.package_price}" />
  <input type="hidden" name="package_imageurl" value="${p.package_imageurl}" />
  <button type="submit" class="btn small-btn">Edit</button>
</form>


              <form method="post" action="deletePackage" style="display:inline;">
                <input type="hidden" name="id" value="${p.id}" />
                <button type="submit" class="btn small-btn delete-btn" onclick="return confirm('Are you sure you want to delete this package?');">Delete</button>
              </form>

            </td>
          </tr>
          
          
          </c:forEach>
        </tbody>
      </table>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

  
</body>
</html>
