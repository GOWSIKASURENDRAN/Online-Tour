<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>Booking Admin | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
  <style>
    .btn-delete {
      background-color: #e74c3c;
      color: white;
      margin-left: 5px;
      padding: 5px 10px;
      border: none;
      cursor: pointer;
      border-radius: 5px;
    }
    .btn-delete:hover {
      background-color: #c0392b;
    }
  </style>
</head>
<body>
  
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="admindashboard.jsp">Dashboard</a></li>
        <li><a href="packageadmin.jsp">Manage Packages</a></li>
        <li><a href="bookingadmin.jsp" class="active">Manage Bookings</a></li>
        <li><a href="contactadmin.jsp">Manage Contacts</a></li>
        <li><a href="profileadmin.jsp">Manage Users</a></li>
        <li><a href="adminlogout.jsp">Logout</a></li>
      </ul>
    </nav>
  </header>

  
  <section class="admin-section">
    <div class="admin-container">
      <h2>Booking Management</h2>

     
      <form id="showBookingForm" method="get" action="viewBooking">
        <button type="submit" class="btn">Show Bookings</button>
      </form>

     
      <p>Total bookings: ${fn:length(bookings)}</p>

     
      <h3>Existing Bookings</h3>
      <table class="admin-table">
        <thead>
          <tr>
            <th>User Name</th>
            <th>Email</th>
            <th>Package ID</th>
            <th>Travel Date</th>
            <th>Persons</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="b" items="${bookings}">
            <tr>
              <td>${b.userName}</td>
              <td>${b.userEmail}</td>
              <td>${b.packageId}</td>
              <td>${b.travelDate}</td>
              <td>${b.persons}</td>
              <td>${b.status}</td>
              <td>
                <c:if test="${b.status == 'Pending'}">
                  <form action="updateBookingStatus" method="post" style="display:inline;">
                    <input type="hidden" name="bookingId" value="${b.id}">
                    <button type="submit" name="status" value="approved" class="btn">Approve</button>
                    <button type="submit" name="status" value="rejected" class="btn">Reject</button>
                  </form>
                </c:if>
                <c:if test="${b.status != 'Pending'}">
                  <p>Status: ${b.status}</p>
                </c:if>
               
               <form action="deleteBooking" method="post" style="display:inline;">
  					<input type="hidden" name="id" value="${b.id}">
  					<button type="submit" class="btn small-btn delete-btn">Delete</button>
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
