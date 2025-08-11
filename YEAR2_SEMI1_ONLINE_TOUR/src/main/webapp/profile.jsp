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
  <title>Your Profile | Online Tour Guide</title>
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
        <li><a href="profile.jsp" class="active">Profile</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="logout.jsp">Logout</a></li>
      </ul>
    </nav>
  </header>


<section class="profile-section">
  <div class="profile-container">
    <h2>Welcome, <%= session.getAttribute("userName") %> 👋</h2> <!-- Display username -->
    <p><strong>Email:</strong> <%= session.getAttribute("userEmail") %></p> <!-- Display email -->

    <hr style="margin: 20px 0;">

    <p style="font-size: 1.1em; color: #444;">We're thrilled to have you as part of our journey! Explore amazing travel packages and create memories that last a lifetime.</p>
    <p style="font-style: italic; color: #666;">"Travel is the only thing you buy that makes you richer."</p>
	
    
    <form action="profileupdate.jsp" method="get">
      <button type="submit" class="btn">Update Profile Details</button>
    </form>
  </div>
</section>


  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>
</body>
</html>
