<%@page language="java"%>
<%@page import="java.sql.*"%>
<form method="post" action="updateProduct.jsp">
<table border="1">
<tr><th>Name</th><th>Address</th></tr>
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
String driver = "com.mysql.cj.jdbc.Driver";
try
{
Class.forName(driver);
}
catch (ClassNotFoundException e)
{
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet rs = null;
%>
<%
try 
{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ism1", "root", "tiger");
String query = "select * from product where pid='"+no+"'";
statement = connection.createStatement();
rs = statement.executeQuery(query);
while(rs.next()){
%>
<tr>
<td><input type="text" name="pid" value="<%=rs.getInt("pid")%>"></td>
<td><input type="text" name="pprice" value="<%=rs.getInt("pprice")%>"></td>
</tr>
<tr>
<td><input type="submit" name="Submit" value="Update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
</tr>
<%
}
}
catch(Exception e){}
%>
</table>
</form>