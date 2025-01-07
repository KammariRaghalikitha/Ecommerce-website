<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String pid = request.getParameter("pid");
String pprice = request.getParameter("pprice");

// Validate input parameters
if (pid == null || pprice == null || pid.isEmpty() || pprice.isEmpty()) {
    out.println("Product ID and price must be provided.");
    return;
}

try {
    int productId = Integer.parseInt(pid);
    int productPrice = Integer.parseInt(pprice);

    String driver = "com.mysql.cj.jdbc.Driver";
    String dbURL = "jdbc:mysql://localhost:3306/ism1";
    String dbUser = "root";
    String dbPassword = "tiger";

    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Load the MySQL JDBC driver
        Class.forName(driver);

        // Establish the database connection
        connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Create the SQL update query
        String updateQuery = "UPDATE product SET pprice = ? WHERE pid = ?";

        // Create a PreparedStatement to execute the query
        preparedStatement = connection.prepareStatement(updateQuery);
        
        // Set the parameters for the query
        preparedStatement.setInt(1, productPrice);
        preparedStatement.setInt(2, productId);

        // Execute the update
        int rowsUpdated = preparedStatement.executeUpdate();

        if (rowsUpdated > 0) {
            // Redirect to retrieveProduct.jsp with the updated product ID
            response.sendRedirect("retriveProducts.jsp?pid=" + productId);
        } else {
            out.println("No product found with the provided ID.");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    } finally {
        // Close resources
        if (preparedStatement != null) preparedStatement.close();
        if (connection != null) connection.close();
    }
} catch (NumberFormatException e) {
    out.println("Invalid product ID or price.");
}
%>
