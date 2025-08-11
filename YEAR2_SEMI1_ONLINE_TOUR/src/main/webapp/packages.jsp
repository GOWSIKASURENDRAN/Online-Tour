<%@ page import="java.util.*" %>
<%@ page import="model.Package" %>
<%@ page import="sevices.packageService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    if (session.getAttribute("userName") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    packageService ps = new packageService();
    ArrayList<Package> packageList = ps.getAllPackage();
    request.setAttribute("packages", packageList);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Tour Packages | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
 
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="packages.jsp" class="active">Packages</a></li>
        <li><a href="booking.jsp">Booking</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="logout.jsp">Logout</a></li>
      </ul>
    </nav>
    <div style="color: white; margin-right: 20px;">
      Welcome, <%= session.getAttribute("userName") %>!
    </div>
  </header>

  
  <section class="packages-section">
    <div class="section-header">
      <h2>Explore Our Tour Packages</h2>
      <p>Find the perfect adventure tailored just for you</p>
    </div>
    <div class="packages-grid">
      <c:forEach var="pkg" items="${packages}">
        <div class="package-card">
          <img src="${pkg.package_imageurl}" alt="${pkg.package_name}" />
          <h3>${pkg.package_name}</h3>
          <p>${pkg.package_description}</p>
          <span class="price">LKR ${pkg.package_price}</span>
          <a href="booking.jsp?packageId=${pkg.id}&packageName=${pkg.package_name}" class="btn small-btn">Book Now</a>

        </div>
      </c:forEach>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

 
</body>
</html>
