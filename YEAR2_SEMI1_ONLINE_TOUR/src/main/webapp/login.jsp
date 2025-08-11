<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />

  <!-- error message -->
  <style>
    .message-box {
      padding: 10px 15px;
      margin-bottom: 20px;
      border-radius: 5px;
      font-weight: 500;
      font-size: 14px;
      display: none; 
    }

    .message-box.error {
      background-color: #f8d7da;
      color: #721c24;
      border: 1px solid #f5c6cb;
    }
  </style>
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
        <li><a href="login.jsp" class="active">Login</a></li>
      </ul>
    </nav>
  </header>

 
  <section class="form-section">
    <div class="form-container">
      <h2>Login</h2>

      
      <div id="errorMessage" class="message-box error">
        Invalid email or password. Please try again.
      </div>

      <form id="loginForm" method="post" action="login">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required placeholder="Enter your email">

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required placeholder="Enter your password">

        <button type="submit" class="btn">Login</button>
        <p class="form-note">Don't have an account? <a href="register.jsp">Register here</a></p>
      </form>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

  <!-- js for error mess -->
  <script>
    window.onload = function () {
      const urlParams = new URLSearchParams(window.location.search);
      if (urlParams.get("error") === "1") {
        const errorDiv = document.getElementById("errorMessage");
        if (errorDiv) {
          errorDiv.style.display = "block";
        }
      }
    };
  </script>
</body>
</html>
