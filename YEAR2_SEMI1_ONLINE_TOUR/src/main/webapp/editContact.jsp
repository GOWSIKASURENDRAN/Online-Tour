<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.Contact" %>
<%@ page import="sevices.ContactServices" %>

<%
  if (session.getAttribute("userName") == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  String idStr = request.getParameter("id");
  if (idStr == null || idStr.isEmpty()) {
    response.sendRedirect("sentMessages.jsp");
    return;
  }

  int id = 0;
  try {
    id = Integer.parseInt(idStr);
  } catch (NumberFormatException e) {
    response.sendRedirect("sentMessages.jsp");
    return;
  }

  ContactServices service = new ContactServices();
  Contact contact = service.getContactById(id);
  if (contact == null) {
    response.sendRedirect("sentMessages.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Update Message | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <!-- Navigation -->
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="packages.jsp">Packages</a></li>
        <li><a href="booking.jsp">Booking</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="contact.jsp" class="active">Contact</a></li>
        <li><a href="logout.jsp">Logout</a></li>
      </ul>
    </nav>
  </header>

  
  <section class="contact-section">
    <div class="contact-container">
      <div class="contact-info">
        <h2>Update Your Message</h2>
        <p><strong>Address:</strong> Northern uni Kanthdhar madam junction ,Jaffna</p>
        <p><strong>Email:</strong> info@onlinetourguide.com</p>
        <p><strong>Phone:</strong> +94 77 123 4567</p>
        
      </div>

      
      <div class="contact-form">
        <h2>Edit Message</h2>
        <form action="UpdateContact" method="post">
          <input type="hidden" name="id" value="<%= contact.getId() %>"/>

          <label for="name">Name</label>
          <input type="text" id="name" name="name" required readonly value="<%= contact.getName() %>" />

          <label for="email">Email</label>
          <input type="email" id="email" name="email" required readonly value="<%= contact.getEmail() %>" />

          <label for="message">Message</label>
          <textarea id="message" name="message" rows="5" required><%= contact.getMessage() %></textarea>

          <button type="submit" class="btn">Update</button>
        </form>

        <form action="sentMessages.jsp" method="get" style="margin-top: 20px;">
          <button type="submit" class="btn">Cancel</button>
        </form>
      </div>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

  
</body>
</html>
