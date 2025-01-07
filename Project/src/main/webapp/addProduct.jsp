<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
</head>
<body bgcolor="lightblue">
    <form action="addProduct" method="post" enctype="multipart/form-data">
        <center>
            <h1>Add Product Details</h1>
            <table border="1">
                <tr>
                    <td>Product ID:</td>
                    <td><input type="text" name="pid" required /></td>
                </tr>
                <tr>
                    <td>Product Name:</td>
                    <td><input type="text" name="pname" required /></td>
                </tr>
                <tr>
                    <td>Product Price:</td>
                    <td><input type="text" name="pprice" required /></td>
                </tr>
                <tr>
                    <td>Product Image:</td>
                    <td><input type="file" name="pphoto" required /></td>
                </tr>
            </table>
            <br />
            <input type="submit" value="Add Product" />
        </center>
    </form>
</body>
</html>
