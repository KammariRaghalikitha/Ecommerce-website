<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Add to Cart</title>
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
        .product-card {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-card h3 {
            color: #007bff;
        }
        .product-card p {
            font-size: 16px;
        }
        .product-card label {
            font-size: 14px;
        }
        .product-card .form-group {
            margin-top: 10px;
        }
        .form-submit {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
        }
        .form-submit:hover {
            background-color: #218838;
        }
        .view-cart-link {
            text-align: center;
            margin-top: 30px;
        }
        .view-cart-link a {
            font-size: 18px;
            color: #007bff;
        }
        .view-cart-link a:hover {
            color: #28a745;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Products List</h1>

    <div class="row">
        <%
            // Database connection
            String url = "jdbc:mysql://localhost:3306/ism1";
            String user = "root";
            String password = "tiger"; // Replace with your MySQL password
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM product");

                while (rs.next()) {
                    int id = rs.getInt("pid");
                    String name = rs.getString("pname");
                    int price = rs.getInt("pprice");
        %>

        <!-- Display each product in a card layout -->
        <div class="col-md-4">
            <div class="product-card">
                <h3><%= name %></h3>
                <p>Price: <%= price %></p>
                <form action="AddToCartServlet" method="post">
                    <input type="hidden" name="productId" value="<%= id %>">
                    <input type="hidden" name="productname" value="<%= name %>">
                    <input type="hidden" name="productprice" value="<%= price %>">
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="number" name="quantity" value="1" min="1" class="form-control" id="quantity">
                    </div>
                    <button type="submit" class="form-submit">Add to Cart</button>
                </form>
            </div>
        </div>

        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>

    <!-- Link to view the cart -->
    <div class="view-cart-link">
        <a href="viewcart.jsp">View Cart</a>
    </div>
</div>

</body>
</html>
