<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CDN -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        body {
            background-color: #ffe4e1; /* Background color */
            height: 100vh; /* Full height */
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: white; /* White background for the form */
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5); /* Subtle shadow */
            padding: 30px; /* Padding inside the form */
            width: 400px; /* Fixed width */
        }

        h1 {
            text-align: center;
            color: black; /* Heading color */
            margin-bottom: 20px; /* Margin below heading */
        }

        .form-control {
            margin-bottom: 15px; /* Spacing between form controls */
        }

        button {
            width: 100%; /* Full-width buttons */
        }

        a {
            color: black; /* Link color */
        }

        a:hover {
            color: #ff69b4; /* Hover effect for links */
        }

        @media (max-width: 500px) {
            .form-container {
                width: 90%; /* Responsive width for smaller screens */
            }
        }
    </style>

    <script type="text/javascript">
        function validateLogin() {
            var email = document.myform.email.value;
            var password = document.myform.password.value;

            if (email == "") {
                window.alert("Please enter your email.");
                return false;
            }
            if (password == "") {
                window.alert("Please enter your password.");
                return false;
            }

            return true; // All checks passed
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h1><u>Login Here</u></h1>
        <form name="myform" action="ring.jsp" onsubmit="return validateLogin()">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" class="form-control" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-success">Login</button><br><br>
            <a href="forgotPassword.jsp" class="btn btn-info">Forgot Password</a>
            <p class="mt-3 text-center">Don't have an account? <a href="reg.jsp">Register here</a></p>
        </form>

        <!-- Back Button to go to homepage -->
        <button class="btn btn-primary mt-3" onclick="window.location.href='home.jsp';">Back to Home</button>
    </div>
</body>
</html>
