<%@page import="java.sql.*"%>
<%
    String email =request.getParameter("email");
    String pass = request.getParameter("pass");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM dbrg WHERE email=? AND pass=?");
        
        ps.setString(1, email);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            // Successful login
            session.setAttribute("username", email);
            response.sendRedirect("LN_index.html");
            
        } else {
            // Failed login
            out.println("Invalid username or password.");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<html>
<head>
	<title>log in</title>
</head>
<body>
	<h1>login</h1>
	<p>email: <%= email %></p>
	<p>pass: <%= pass %></p>
</body>
</html>