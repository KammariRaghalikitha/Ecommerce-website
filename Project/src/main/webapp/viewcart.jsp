<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Cart Summary</title>
    <!-- Bootstrap CDN for styling -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #343a40;
            font-family: Arial, sans-serif;
            padding-top: 20px;
        }
        h1 {
            color: #007bff;
            text-align: center;
        }
        table {
            width: 100%;
            margin: 20px 0;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .btn {
            margin-top: 20px;
            font-size: 18px;
        }
        .total-summary {
            font-size: 20px;
            margin-top: 20px;
            text-align: center;
        }
        .footer-links {
            text-align: center;
            margin-top: 30px;
        }
        .footer-links a {
            margin: 0 15px;
            color: #007bff;
            text-decoration: none;
        }
        .footer-links a:hover {
            color: #28a745;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Cart Summary</h1>

        <%
            // Database connection details
            String jdbcURL = "jdbc:mysql://localhost:3306/ism1";
            String dbUser = "root";
            String dbPassword = "tiger";

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // Variables to store total quantity and total cost
            int totalQuantity = 0;
            double totalPrice = 0;

            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection to the database
                conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

                // SQL query to retrieve product details from cart
                String sql = "SELECT p.pname, c.quantity, p.pprice, (c.quantity * p.pprice) AS total " +
                             "FROM cart c JOIN product p ON p.pid = c.pid";

                stmt = conn.prepareStatement(sql);
                rs = stmt.executeQuery();

        %>

        <!-- Table displaying cart details -->
        <table>
            <tr>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Product Price</th>
                <th>Total</th>
            </tr>
        <%
            // Loop through the result set and calculate the total quantity and total price
            while (rs.next()) {
                String productName = rs.getString("pname");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("pprice");
                double total = rs.getDouble("total");

                // Accumulate the total quantity and total price
                totalQuantity += quantity;
                totalPrice += total;
        %>
            <tr>
                <td><%= productName %></td>
                <td><%= quantity %></td>
                <td><%= price %></td>
                <td><%= total %></td>
            </tr>
        <%
            }
        %>
        </table>

        <!-- Display the total quantity and total price -->
        <div class="total-summary">
            <h3>Total Quantity: <%= totalQuantity %></h3>
            <h3>Total Price: <%= totalPrice %></h3>
        </div>

        <div class="footer-links">
            <a href="removeCart.jsp" class="btn btn-danger">Remove Product From Cart</a>
            <a href="addtocart.jsp" class="btn btn-warning">Add More Products</a>
        </div>

        <form action="billingAddress.jsp" method="get">
            <div class="footer-links">
                <input type="submit" value="Proceed to Buy" class="btn btn-success btn-lg"/>
            </div>
        </form>

        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>

    </div> <!-- container -->
</body>
</html>
