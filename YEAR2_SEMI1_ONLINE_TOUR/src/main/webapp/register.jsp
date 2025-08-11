<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Register | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
  <style>
  /* Message Box Styles */
  .message-box {
    padding: 10px 15px;
    margin-bottom: 20px;
    border-radius: 5px;
    font-weight: 500;
    font-size: 14px;
    display: none; /* Hidden by default */
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
    
    document.getElementById("registerForm").addEventListener("submit", function(event) {
      const password = document.getElementById("password").value;
      const confirmPassword = document.getElementById("confirmPassword").value;

      const errorMessages = [];

      
      if (password.length < 8) {
        errorMessages.push("Password must be at least 8 characters long.");
      }

      if (!/[A-Z]/.test(password)) {
        errorMessages.push("Password must contain at least one uppercase letter.");
      }

      if (!/\d/.test(password)) {
        errorMessages.push("Password must contain at least one number.");
      }

      if (password !== confirmPassword) {
        errorMessages.push("Passwords do not match.");
      }

      // show error messages if any
      if (errorMessages.length > 0) {
        event.preventDefault(); 
        showMessage(errorMessages.join("\n"), "error");
      }
    });

    // registration was successful
    const urlParams = new URLSearchParams(window.location.search);
    const status = urlParams.get("status");
    if (status === "success") {
      showMessage("Account created successfully!", "success");
    }
  };

  // function to show message in the message box
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
        <li><a href="login.jsp">Login</a></li>
      </ul>
    </nav>
  </header>

  
  <section class="form-section">
    <div class="form-container">
      <h2>Create Account</h2>

      <%
        // check for form submission and errors
        String errorMessage = request.getParameter("errorMessage");
        if (errorMessage != null) {
      %>
        <p style="color: red;"><%= errorMessage %></p>
      <%
        }
      %>
<div id="messageBox" class="message-box" style="display:none;"></div>


      <form id="registerForm" method="post" action="addCustomer">
        <label for="name">Full Name</label>
        <input type="text" id="name" name="name" required placeholder="Enter your full name">

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required placeholder="Enter your email">

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required placeholder="Create a password">

        <label for="confirmPassword">Confirm Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password">

        <button type="submit" class="btn">Register</button>
        <p class="form-note">Already have an account? <a href="login.jsp">Login here</a></p>
      </form>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>


</body>

</body>
</html>
