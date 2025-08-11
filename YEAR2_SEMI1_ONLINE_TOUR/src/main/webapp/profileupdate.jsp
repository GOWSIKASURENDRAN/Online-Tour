<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // session validate
  if (session.getAttribute("userId") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Update Profile | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
  <style>
    
    .message-box {
      padding: 10px 15px;
      margin-bottom: 20px;
      border-radius: 5px;
      font-weight: 500;
      font-size: 14px;
      display: none; 
    }

    .message-box.success {
      background-color: #d4edda;
      color: #155724;
      border: 1px solid #c3e6cb;
    }

    .message-box.error {
      background-color: #f8d7da;
      color: #721c24;
      border: 1px solid #f5c6cb;
    }
  </style>
  <script>
    window.onload = function () {
      document.getElementById("updateForm").addEventListener("submit", function (event) {
        const password = document.getElementById("password").value;
        const email = document.getElementById("email").value;
        const errorMessages = [];

        // Email validation
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailPattern.test(email)) {
          errorMessages.push("Please enter a valid email address.");
        }

        // Password validation
        if (password.length < 8) {
          errorMessages.push("Password must be at least 8 characters long.");
        }

        if (!/[A-Z]/.test(password)) {
          errorMessages.push("Password must contain at least one uppercase letter.");
        }

        if (!/\d/.test(password)) {
          errorMessages.push("Password must contain at least one number.");
        }

        // Show error messages if any
        if (errorMessages.length > 0) {
          event.preventDefault(); // Prevent form submission
          showMessage(errorMessages.join("\n"), "error");
        }
      });
    };

    function showMessage(message, type) {
      const messageBox = document.getElementById("messageBox");
      messageBox.textContent = message;
      messageBox.className = "message-box " + type;
      messageBox.style.display = "block";
    }
  </script>
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

  <!-- Update Profile Section -->
  <section class="form-section">
    <div class="form-container">
      <h2>Update Your Details</h2>

      <div id="messageBox" class="message-box"></div>

      <form id="updateForm" method="post" action="updateCustomer">
        <input type="hidden" name="id" value="${sessionScope.userId}" />

        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required value="${sessionScope.userName}" />

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required value="${sessionScope.userEmail}" />

        <label for="password">New Password</label>
        <input type="password" id="password" name="password" required placeholder="Enter new password" />

        <button type="submit" class="btn">Update</button>
      </form>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>
</body>
</html>
