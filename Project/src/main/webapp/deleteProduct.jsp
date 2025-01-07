<%@page import="java.sql.*"%>
<%
String ide=request.getParameter("id");
int num=Integer.parseInt(ide);

try{
Connection conn = null;
Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ism1","root", "tiger");
Statement st=null;
st=conn.createStatement();
st.executeUpdate("delete from product where pid='"+num+"'");
response.sendRedirect("./retriveProducts.jsp");
}
catch(Exception e){
System.out.println(e);
}
%>