<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<style>
body
{
background-color:lightgreen;
}
</style>
</head>
<body>

<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "ism1";
String userid = "root";
String password = "tiger";
String name=request.getParameter("name");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h1>Searched Data</h1>
<table border="1">
<tr>
<td>First Name</td>
<td>User Email Id</td>
</tr>

<%

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
int count=0;
String sql ="select * from registration where firstname='"+name+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("uemail") %></td>
</tr>
<%
}
} catch (Exception e) 
{
e.printStackTrace();
}
%>
</table>
</body>
 
</html>
