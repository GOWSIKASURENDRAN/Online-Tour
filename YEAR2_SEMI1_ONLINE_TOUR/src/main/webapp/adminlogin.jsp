<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Login | Online Tour Guide</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  
  <header class="navbar">
    <div class="logo">Online Tour Guide</div>
    <nav>
      <ul class="nav-links">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="adminlogin.jsp" class="active">Admin Login</a></li>
      </ul>
    </nav>
  </header>

 
  <section class="form-section">
    <div class="form-container">
      <h2>Admin Login</h2>
      <form method="post" action="adminLogin">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required placeholder="Enter admin username">

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required placeholder="Enter admin password">

        <button type="submit" class="btn">Login</button>
      </form>
    </div>
  </section>

  <footer class="footer">
    <p>&copy; 2025 Online Tour Guide. All rights reserved.</p>
  </footer>

  
</body>
</html>
