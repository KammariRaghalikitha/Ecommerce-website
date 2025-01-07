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
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<center>
<h1>Visitors List</h1>
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
String sql ="select * from registration";
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
</center>
</body>
</html>
