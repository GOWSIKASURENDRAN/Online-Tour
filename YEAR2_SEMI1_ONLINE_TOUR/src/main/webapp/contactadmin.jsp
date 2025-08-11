<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Contact" %>
<%@ page import="sevices.ContactServices" %>

<%
  // Check admin login
  if (session.getAttribute("adminUsername") == null) {
    response.sendRedirect("adminlogin.jsp");
    return;
  }

  // Call the admin method to get all messages
  ContactServices service = new ContactServices();
  List<Contact> contacts = service.getAllContacts();  
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Admin - Contact Messages | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="admindashboard.jsp">Dashboard</a></li>
        <li><a href="packageadmin.jsp">Manage Packages</a></li>
        <li><a href="bookingadmin.jsp">Manage Bookings</a></li>
        <li><a href="contactadmin.jsp" class="active">Manage Contacts</a></li>
        <li><a href="profileadmin.jsp">Manage Users</a></li>
        <li><a href="adminlogout.jsp">Logout</a></li>
      </ul>
    </nav>
  </header>

  <section class="admin-section">
    <div class="admin-container">
      <h2>All Contact Messages</h2>

      <%
        if (contacts == null || contacts.isEmpty()) {
      %>
        <p>No messages found.</p>
      <%
        } else {
      %>
      <table class="admin-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Customer ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Message</th>
          </tr>
        </thead>
        <tbody>
          <%
            for (Contact c : contacts) {
          %>
          <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getCustomerId() %></td>
            <td><%= c.getName() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getMessage() %></td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
      <%
        }
      %>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>
</body>
</html>
