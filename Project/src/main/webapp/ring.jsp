<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset = "UTF-8">  
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">  
    <title>Bootstrap Border Spinner Example</title>  
    <!-- Bootstrap CDN -->  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <link rel = "stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  
  <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>  
  <script src = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>  
  <script src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<style>

{
margin-right:70px;
margin-top:100px;
color:purple;
}

a1
{
color:green;
}
a2
{
color:red;
}
body
{
background-color:pink;
}
h2
{
font-style:impact;
color:crimson;
}
h1
{
padding-top:40px;
margin-right:60px;
padding-top:20px;
}
</style>
</head>
<body>
<%
try
{
	String sname=request.getParameter("email");
	String sroll=request.getParameter("password");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ism1","root","tiger");
PreparedStatement pstmt=con.prepareStatement("select * from registration where uemail=? and password=?");
pstmt.setString(1,sname);
pstmt.setString(2,sroll);
ResultSet rs=pstmt.executeQuery();
int x=0;
	while(rs.next())
	{
		if ((rs.getString("uemail").equals(sname)) && rs.getString("password").equals(sroll)) {
            String stp = rs.getString("role");
            if (stp.equals("admin")) 
            {
                x = 1;
                break;
            } else {
                x = 2;
                break;
            }
        }
    }
    if (x == 2)
    {
    	out.println("<form action='image.jsp'/>");
		out.println("<h2>One Step to go to Your Page</h2><br><br>");
		out.println("<label/><h3/>Please Enter your Email Again:<input type='email'  name='email'/><br>");
		out.println("<label/><h3/>Please Enter your Password Again:<input type='password'  name='password'/>");
		out.println("<a1/><input type='submit' value='submit'/>");
		out.println("<a2/><input type='reset' value='reset'/>");
    } 
    else if (x == 1) 
    {
        response.sendRedirect("allInfo.jsp");
    } 
    else
    {
    	out.println("<script type='text/javascript'>");
    	out.println("alert('Either you entered Invalid UserName or Password! Please Try Again');");
    	out.println("window.location.href = 'login.jsp';");
    	out.println("</script>");

	}

}
catch(Exception e)
{
	out.println(e);
}
%>
</body>
</html>