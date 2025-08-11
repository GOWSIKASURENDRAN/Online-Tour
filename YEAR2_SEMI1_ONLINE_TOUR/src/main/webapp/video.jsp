<%@ page import="java.util.*" %>
<%@ page import="model.Package" %>
<%@ page import="sevices.packageService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    packageService ps = new packageService();
    ArrayList<Package> allPackages = ps.getAllPackage();

    // Sort and get top 3 highest-priced packages
    allPackages.sort((a, b) -> Double.compare(b.getPackage_price(), a.getPackage_price()));
    List<Package> topPackages = allPackages.size() > 3 ? allPackages.subList(0, 3) : allPackages;
    request.setAttribute("topPackages", topPackages);
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
<div class="video-bg">
  <video autoplay muted loop playsinline>
    <source src="videos/srilanka-new.mp4" type="video/mp4" />
    Your browser does not support the video tag.
  </video>
</div>


  <!-- Navigation -->
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="home.jsp" class="active">Home</a></li>
        <li><a href="packages.jsp">Packages</a></li>
        <li><a href="booking.jsp">Booking</a></li>
        <li><a href="profile.jsp">Profile</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <c:choose>
          <c:when test="${sessionScope.userName != null}">
            <li><a href="logout.jsp">Logout</a></li>
          </c:when>
          <c:otherwise>
            <li><a href="login.jsp">Login</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </nav>
    <c:if test="${sessionScope.userName != null}">
      <div style="color: white; margin-right: 20px;">
        Welcome, ${sessionScope.userName}!
      </div>
    </c:if>
  </header>

  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-content">
      <h1>Explore the World with Us</h1>
      <p>Your journey begins here</p>
      <a href="packages.jsp" class="btn">View Packages</a>
    </div>
  </section>

  <!-- About Section -->
  <section class="about">
    <h2>Why Choose Us?</h2>
    <p>We offer the best tour experiences with professional guides and top-rated services. Discover new places and make unforgettable memories.</p>
  </section>

  <!-- Featured Packages -->
  <section class="packages-preview">
    <h2>Popular Packages</h2>
    <div class="packages-container">
      <c:forEach var="pkg" items="${topPackages}">
        <div class="package-card">
          <img src="${pkg.package_imageurl}" alt="${pkg.package_name}">
          <h3>${pkg.package_name}</h3>
          <p>${pkg.package_description}</p>
        </div>
      </c:forEach>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

  <script src="script.js"></script>
</body>
</html>
