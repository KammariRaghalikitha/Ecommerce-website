<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="image.jsp" %> 
<%@ page trimDirectiveWhitespaces="true"%>
<%
try
{
	String name=request.getParameter("username");
	String password=request.getParameter("pass");
	
	System.out.println(name);
	System.out.println(password);
	
	System.out.println("hi");
	byte[] img=null;
	ServletOutputStream sos=null;
	String query=("select photo from registration where uemail=? and password=?");
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ism1","root","tiger");
    PreparedStatement pstmt=conn.prepareStatement(query);
    pstmt.setString(1,name);
    pstmt.setString(2,password);
    
    ResultSet rs=pstmt.executeQuery();
    while(rs.next())
    {
    	
    	img=rs.getBytes("photo"); 	
    }
    sos=response.getOutputStream();
    sos.write(img);
    response.getOutputStream().flush();
    response.getOutputStream().close();
    return;
}
catch(Exception e)
{
	out.println(e);
}
%>