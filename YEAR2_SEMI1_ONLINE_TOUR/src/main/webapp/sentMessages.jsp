<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Contact" %>
<%@ page import="sevices.ContactServices" %>

<%
  // Redirect to login if session attributes are missing
  if (session.getAttribute("userId") == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  int userId = (int) session.getAttribute("userId");

  // Retrieve user's contact messages
  ContactServices service = new ContactServices();
  List<Contact> contacts = service.getContactsByCustomerId(userId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Your Messages | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="packages.jsp">Packages</a></li>
        <li><a href="booking.jsp">Booking</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="logout.jsp">Logout</a></li>
      </ul>
    </nav>
  </header>

  <section class="contact-section">
    <div class="contact-container">
      <h2>Your Sent Messages</h2>

      <%
        if (contacts == null || contacts.isEmpty()) {
      %>
        <p>No messages found.</p>
      <%
        } else {
      %>
   <table  class="admin-table">
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Message</th>
    <th>Actions</th> <!-- New column -->
  </tr>
  <%
    for (Contact c : contacts) {
  %>
    <tr>
      <td><%= c.getId() %></td>
      <td><%= c.getName() %></td>
      <td><%= c.getEmail() %></td>
      <td><%= c.getMessage() %></td>
      <td>
        <!-- Edit Button -->
        <form action="editContact.jsp" method="get" style="display:inline;">
          <input type="hidden" name="id" value="<%= c.getId() %>"/>
          <button type="submit" class="btn">Edit</button>
        </form>

        <!-- Delete Button -->
        <form action="DeleteContact" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this message?');">
          <input type="hidden" name="id" value="<%= c.getId() %>"/>
          <button type="submit" class="btn">Delete</button>
        </form>
      </td>
    </tr>
  <%
    }
  %>
</table>

      <%
        }
      %>

      <br />
      <a href="contact.jsp" class="btn">Back to Contact</a>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>
</body>
</html>
