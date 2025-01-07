<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Base64"%>


<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #e9ecef; /* Light gray background */
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #495057; /* Darker gray for headings */
            margin-bottom: 20px;
        }
        table {
            width: 80%; /* Set table width */
            margin: auto; /* Center table */
            background-color: #ffffff; /* White background for table */
            border-radius: 8px; /* Rounded corners */
            overflow: hidden; /* Prevent overflow on corners */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }
        th, td {
            text-align: center; /* Center text */
            padding: 12px; /* Padding for cells */
        }
        th {
            background-color: #343a40; /* Dark navbar color */
            color: white; /* White text for header */
        }
        tr:nth-child(even) {
            background-color: #f2f2f2; /* Light gray for even rows */
        }
        .btn {
            margin: 5px; /* Margin around buttons */
        }
    </style>
    <script>
        function filterProducts() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("productTable");
            tr = table.getElementsByTagName("tr");
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1]; // Assuming name is in the second column
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].style.display = "";
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <center>
            <h1>Product List</h1>
            <form method="post">
                <input class="form-control mr-sm-2" type="search" id="searchInput" placeholder="Search..." onkeyup="filterProducts()" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </center>

        <center>
            <table id="productTable" border="1">
                <tr>
                    <th>Product Id</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                    <th>Image</th>
                    <th>Action</th>
                </tr>
                <%
                String search = request.getParameter("search");
                String driver = "com.mysql.cj.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/";
                String database = "ism1";
                String userid = "root";
                String password = "tiger";
                
                try {
                    Class.forName(driver);
                    Connection connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                    Statement statement = connection.createStatement();
                    String sql = "SELECT * FROM product";
                    if (search != null && !search.isEmpty()) {
                        sql += " WHERE pname LIKE '%" + search + "%'";
                    }
                    ResultSet rs = statement.executeQuery(sql);
                    
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt(1) %></td>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><img src="data:image/jpeg;base64,<%= encodeImage(rs.getBlob(4)) %>" width="100" height="100" /></td>
                    <td>
                        <a href="editProduct.jsp?id=<%= rs.getInt(1) %>" class="btn btn-primary">Edit</a>
                        <a href="deleteProduct.jsp?id=<%= rs.getInt(1) %>" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
                <%
                    }
                    connection.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </table>
            <h2><a href='addProduct.jsp' class="btn btn-success">Add Product</a></h2>
        </center>
    </div>

    <%!
String encodeImage(Blob blob) {
    try {
        InputStream inputStream = blob.getBinaryStream();
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        byte[] imageBytes = outputStream.toByteArray();
        String base64Image = Base64.getEncoder().encodeToString(imageBytes);
        inputStream.close();
        outputStream.close();
        return base64Image;
    } catch (Exception e) {
        e.printStackTrace();
        return ""; // Return empty string in case of error
    }
}
%>

</body>
</html>
