<%@ page import="java.sql.*" %>
<%
    HttpSession hs2 = request.getSession();
    String name = (String) hs2.getAttribute("email");

    // Debugging the session attribute
    out.println("Session name: " + name); 

    try {
        Connection conn = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ism1", "root", "tiger");
        Statement st = conn.createStatement();
        String query = "SELECT * FROM registration WHERE firstname = '" + name + "'";
        
        // Debugging the query
        out.println("Query: " + query);

        ResultSet rs = st.executeQuery(query);
        
        if (!rs.next()) {
            out.println("No records found for: " + name);
        } else {
            out.println("<h1>Billing Address</h1>");
            do {
                String nm = rs.getString("firstname");
                String mobileno = rs.getString("mobileno");
                String arr = rs.getString("address");

                out.println("<h3>");
                out.println(nm);
                out.println("<br>");
                out.println(mobileno);
                out.println("<br>");
                out.println(arr);
                out.println("</h3>");
            } while (rs.next());
        }
    } catch (Exception e) {
        e.printStackTrace(); // Log the full error
        out.println("Error: " + e.getMessage());
    }
%>
<form action="dispatchProduct.jsp" method="get">
    <input type="submit" value="submit"/>
</form>
