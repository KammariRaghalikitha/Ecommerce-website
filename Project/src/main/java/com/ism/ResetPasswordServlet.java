package com.ism;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newpassword");
        String confirmPassword = request.getParameter("confirmpassword");

        if (newPassword.equals(confirmPassword)) {
            Connection con = null;
            PreparedStatement pst = null;

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ism1", "root", "tiger");

                String query = "UPDATE registration SET password=? WHERE uemail=?";
                pst = con.prepareStatement(query);
                pst.setString(1, newPassword);  // Remember to hash the password in a real application
                pst.setString(2, email);

                int result = pst.executeUpdate();

                if (result > 0) {
                    request.setAttribute("message", "Password successfully updated.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Failed to update password. Please try again.");
                    request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            request.setAttribute("errorMessage", "Passwords do not match. Please try again.");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        }
    }
}
