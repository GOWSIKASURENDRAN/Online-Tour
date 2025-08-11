<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Package Admin | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <!-- Navigation -->
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="admindashboard.jsp" >Dashboard</a></li>
        <li><a href="packageadmin.jsp">Manage Packages</a></li>
        <li><a href="bookingadmin.jsp">Manage Bookings</a></li>
        <li><a href="contactadmin.jsp">Manage Contacts</a></li>
        <li><a href="profileadmin.jsp" class="active">Manage Users</a></li>
        <li><a href="adminlogout.jsp">Logout</a></li>
      </ul>
    </nav>
  </header>

  <!-- Admin Section for Managing Users -->
  <section class="admin-section">
    <div class="admin-container">
      <h2>Manage Users</h2>

      <!-- Show Users Button -->
      <form action="viewCustomer" method="get">
        <button type="submit" class="btn">Show Users</button>
      </form>
  
      <!-- if user here -->
      <c:if test="${not empty users}">
        <table class="admin-table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Email</th>
              <th>Password</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            
            <c:forEach var="user" items="${users}">
              <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.password}</td>
               <td>
 	<form method="post" action="deleteCustomer" style="display:inline;">
    <input type="hidden" name="id" value="${user.id}" />
    <button type="submit" class="btn small-btn delete-btn" onclick="return confirm('Are you sure you want to delete this user?');">Delete</button>
	</form>

				</td>

              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>
</body>
</html>
