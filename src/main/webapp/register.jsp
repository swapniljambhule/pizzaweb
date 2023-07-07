<%@ page import="java.sql.*" %>
<%
   String fname = request.getParameter("fname");
   String email = request.getParameter("email");
   String pass = request.getParameter("pass");
   String lname = request.getParameter("lname");
   String contact = request.getParameter("contact");
   String address = request.getParameter("address");
   String note = request.getParameter("note");

   Connection conn = null;
   Statement stmt = null;

   try {
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost/registration","root","");
      stmt = conn.createStatement();
      String sql = "INSERT INTO dbrg (fname,lname,email,pass,contact,address,note) VALUES ('"+fname+"','"+lname+"','"+email+"','"+pass+"','"+contact+"','"+address+"','"+note+"')";
      
      stmt.executeUpdate(sql);
      
      
   } catch (SQLException se) {
      se.printStackTrace();
   } catch (Exception e) {
      e.printStackTrace();
   } finally {
      try {
         if (stmt != null)
            conn.close();
      } catch (SQLException se) {
         se.printStackTrace();
      }
      try {
         if (conn != null)
            conn.close();
      } catch (SQLException se) {
         se.printStackTrace();
      }
   }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registration Successful</title>
	<style>				
		
		
		.container {
		    width: 300px;
			height: 200px;
			margin: auto;
			background-color: white;
			text-align: center;
		}
		.container p {
			text-align: left;
			margin-top: 20px;
			font-size: 18px;
			color: black;
		}
		.container body {
			background-color: white;
			color: black;
			font-family: Arial, sans-serif;
			text-align: center;
		}
		.container span {
			color: red;
			font-size: 36px;
			margin-top: 50px;
		}
		.container h1 {
			color: black;
			font-size: 36px;
			margin-top: 50px;
		}
		.container btn{
              display: inline-block;
              padding:.8rem 3rem;
              border:.2rem solid var(--red);
              color:var(--red);
              cursor: pointer;
              font-size: 1.7rem;
              border-radius: .5rem;
              position: relative;
              overflow: hidden;
              z-index: 0;
              margin-top: 1rem;
         }
		
	</style>
</head>
<div class="container">	
<body>
	<h1>Registration <span>successful</span></h1>
</body>	

	<p>Name: <%= fname %> <%= lname %><br>
	   ESmail: <%= email %><br>
	   Contact: <%= contact %><br>
	   Address: <%= address %><br>
	   Note: <%= note %><br>
	   
	    </p>
	   <a href="log_in.html" class="btn"><span>log in</span></a> 
	    
</div>
	

</html>
