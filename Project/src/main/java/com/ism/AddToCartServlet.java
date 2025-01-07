package com.ism;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet 
{
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	    {
	    	String productId = request.getParameter("productId");
	    	String pname=request.getParameter("productname");
	    	String price=request.getParameter("productprice");
	    	int pprice=Integer.parseInt(price);
	        String quantityStr = request.getParameter("quantity");
	        int quantity = Integer.parseInt(quantityStr);  // Parse quantity to integer

	        // Database connection details
	        String jdbcURL = "jdbc:mysql://localhost:3306/ism1";  // Replace with your database URL
	        String dbUser = "root";  // Your MySQL username
	        String dbPassword = "tiger";  // Your MySQL password

	        Connection conn = null;
	        PreparedStatement stmt = null;

	        try {
	            // Load the JDBC driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Establish a connection to the database
	            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

	            // SQL query to insert record into cart table
	            String sql = "INSERT INTO cart (pid,pname,pprice,quantity) VALUES (?,?,?,?)";

	            // Prepare the SQL statement
	            stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, Integer.parseInt(productId));  // Set product_id
	            stmt.setString(2, pname); 
	            stmt.setInt(3, pprice);  // Set quantity
	            stmt.setInt(4, quantity);

	            // Execute the update
	            int rowsInserted = stmt.executeUpdate();

	            if (rowsInserted > 0) {
	                System.out.println("Product successfully added to cart.");
	            }

	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (stmt != null) stmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	        // Redirect to the view cart page after insertion
	        response.sendRedirect("viewcart.jsp");
	    }
	
	    }
