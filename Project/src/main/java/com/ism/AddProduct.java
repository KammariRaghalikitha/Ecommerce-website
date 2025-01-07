package com.ism;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/addProduct")
@MultipartConfig
public class AddProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Retrieve form data
            String pid = request.getParameter("pid");
            String pname = request.getParameter("pname");
            String price = request.getParameter("pprice");
            Part photoPart = request.getPart("pphoto");

            // Validate input
            if (pid == null || pname == null || price == null || photoPart == null) {
                out.println("<h3>All fields are required!</h3>");
                return;
            }

            int ppid = Integer.parseInt(pid);
            int pe = Integer.parseInt(price);
            InputStream photoStream = photoPart.getInputStream();

            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ism1", "root", "tiger");

            // Insert query
            String query = "INSERT INTO product (pid, pname, pprice, pphoto) VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, ppid);
            pstmt.setString(2, pname);
            pstmt.setInt(3, pe);
            pstmt.setBinaryStream(4, photoStream, (int) photoPart.getSize());

            int count = pstmt.executeUpdate();

            if (count > 0) {
                out.println("<h1>Product added successfully!</h1>");
                response.sendRedirect("retriveProducts.jsp");
            } else {
                out.println("<h1>Failed to add product.</h1>");
            }

        } catch (NumberFormatException e) {
            out.println("<h3>Error: Invalid number format for ID or Price.</h3>");
        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
