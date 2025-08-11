<%
    // Invalidate the session (logout)
    request.getSession().invalidate();
    
    // Redirect the user to the login page after logout
    response.sendRedirect("login.jsp");
%>
