<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
  
  if (session.getAttribute("userName") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Contact Us | Online Tour Guide</title>
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
        <li><a href="contact.jsp" class="active">Contact</a></li>
        <li><a href="logout.jsp">Logout</a></li>
      </ul>
    </nav>
  </header>

  
  <section class="contact-section">
    <div class="contact-container">
      <div class="contact-info">
        <h2>Contact Us</h2>
        <p><strong>Address:</strong> No. 123, Main Street, Jaffna</p>
        <p><strong>Email:</strong> info@onlinetourguide.com</p>
        <p><strong>Phone:</strong> +94 77 123 4567</p>
        <img src="https://via.placeholder.com/400x200?text=Google+Map+Placeholder" alt="Map" class="contact-map">
      </div>
<% if (request.getParameter("success") != null) { %>
  <p style="color: green;">Your message has been sent successfully!</p>
<% } else if (request.getParameter("error") != null) { %>
  <p style="color: red;">There was a problem sending your message. Please try again.</p>
<% } else if (request.getParameter("error") != null && request.getParameter("error").equals("empty")) { %>
  <p style="color: red;">Message cannot be empty.</p>
<% } else if (request.getParameter("error") != null && request.getParameter("error").equals("exception")) { %>
  <p style="color: red;">Something went wrong. Please try again later.</p>
<% } %>

   
      <div class="contact-form">
        <h2>Send a Message</h2>
        <form action="AddContact" method="post" id="contactForm">
          <label for="name">Name</label>
          <input type="text" id="name" name="name" required placeholder="Your name" value="<%= session.getAttribute("userName") %>" readonly>

          <label for="email">Email</label>
          <input type="email" id="email" name="email" required placeholder="Your email" value="<%= session.getAttribute("userEmail") %>" readonly>

          <label for="message">Message</label>
          <textarea id="message" name="message" rows="5" required placeholder="Your message"></textarea>

          <button type="submit" class="btn">Send</button>
        </form>

       
        <form action="sentMessages.jsp" method="get" style="margin-top: 20px;">
          <button type="submit" class="btn">View Sent Messages</button>
        </form>
      </div>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

  
</body>
</html>
