<%@ page import="java.sql.*" %>
<html>
<head>
    <title>View Cart</title>
</head>
<body>
    <h1>Your Cart</h1>

    <%
        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/ism1";
        String dbUser = "root";
        String dbPassword = "tiger";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver and establish a connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // SQL query to get items in the cart
            String sql = "delete from cart";
            
            stmt = conn.prepareStatement(sql);
            int count = stmt.executeUpdate();

          
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>

    <br>
    <a href="addtocart.jsp">Add More Products</a>
</body>
</html>
