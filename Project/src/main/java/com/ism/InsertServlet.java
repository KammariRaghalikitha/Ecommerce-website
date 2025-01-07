package com.ism;

import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/insert")
@MultipartConfig(maxFileSize = 16177215) 
public class InsertServlet extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String fn = request.getParameter("firstname");
        String ln = request.getParameter("lastname");
        String un = request.getParameter("uemail");
        String pa = request.getParameter("password");
        String cpa = request.getParameter("conpassword");
        String mn = request.getParameter("mobileno");
        String ad = request.getParameter("address");
        String role = request.getParameter("role");

        // Retrieve the uploaded file part
        Part filePart = request.getPart("photo");
        InputStream fis = null;

        if (filePart != null) {
            // Obtain input stream of the uploaded file
            fis = filePart.getInputStream();
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ism1", "root", "tiger");

            PreparedStatement pstmt = conn.prepareStatement(
                "INSERT INTO registration(firstname,lastname,uemail,password,conpassword,mobileno,address,photo,role) VALUES(?,?,?,?,?,?,?,?,?)"
            );
            pstmt.setString(1, fn);
            pstmt.setString(2, ln);
            pstmt.setString(3, un);
            pstmt.setString(4, pa);
            pstmt.setString(5, cpa);
            pstmt.setString(6, mn);
            pstmt.setString(7, ad);

            if (fis != null) {
                pstmt.setBinaryStream(8, fis, (int) filePart.getSize());
            } else {
                pstmt.setNull(8, java.sql.Types.BLOB);
            }

            pstmt.setString(9, role);

            int count = pstmt.executeUpdate();

            if (count > 0) {
                out.println("<html><h1>Your Registration Successful</h1>");
                out.println("<a href='login.jsp'>Go to Login page</a>");
            }

        } catch (Exception e) {
            out.println(e);
        }
    }

    public void destroy() {
    }
}

		
