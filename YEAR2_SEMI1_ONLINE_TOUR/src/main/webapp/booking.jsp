<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Package" %>
<%@ page import="sevices.packageService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
   
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // get package id from url 
    String selectedPackageId = request.getParameter("packageId");

    //  packageService to get package details
    packageService ps = new packageService();
    ArrayList<Package> packageList = ps.getAllPackage();
    request.setAttribute("packages", packageList);
    request.setAttribute("selectedPackageId", selectedPackageId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Booking | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="packages.jsp">Packages</a></li>
        <li><a href="booking.jsp" class="active">Booking</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="logout.jsp">Logout</a></li>
      </ul>
    </nav>
    <div style="color: white; margin-right: 20px;">
      Welcome, ${sessionScope.userName}!
    </div>
  </header>

  
  <section class="form-section">
    <div class="form-container">
      <h2>Book Your Tour</h2>
      <form method="post" action="addBooking">
        <label for="fullName">Full Name</label>
        <input type="text" id="fullName" name="fullName" required placeholder="Your full name" value="${sessionScope.userName}">

        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" required placeholder="Your email address" value="${sessionScope.userEmail}">

        <label for="package">Select Package</label>
        <select id="package" name="package" required>
          <option value="">-- Choose a Tour Package --</option>
          <c:forEach var="pkg" items="${packages}">
            <option value="${pkg.id}" <c:if test="${pkg.id == selectedPackageId}">selected</c:if>>
              ${pkg.package_name} - LKR ${pkg.package_price}
            </option>
          </c:forEach>
        </select>

        <label for="travelDate">Travel Date</label>
        <input type="date" id="travelDate" name="travelDate" required>

        <label for="persons">No. of Persons</label>
        <input type="number" id="persons" name="persons" min="1" required placeholder="How many people?">

        <button type="submit" class="btn">Confirm Booking</button>
      </form>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

  <script>
    // future only
    const travelDateInput = document.getElementById("travelDate");
    const today = new Date().toISOString().split("T")[0];
    travelDateInput.setAttribute("min", today);
  </script>

 
</body>
</html>
