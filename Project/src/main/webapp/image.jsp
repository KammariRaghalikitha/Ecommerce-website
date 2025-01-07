<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Example</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa; /* Light background color */
            color: #343a40; /* Dark text color for readability */
        }
        .dark-mode {
            background-color: #212529; /* Dark background for dark mode */
            color: #f8f9fa; /* Light text color for dark mode */
        }
        b {
            color: #ff1493; /* Dark pink */
            border: 2px solid #9370db; /* Violet */
            border-radius: 4px;
            padding: 2px 5px; /* Padding for better spacing */
        }
        b:hover {
            color: white;
            background-color: #343a40; /* Dark background on hover */
            font-style: italic;
        }
        a {
            color: #007bff; /* Bootstrap primary link color */
        }
        a:hover {
            color: #28a745; /* Green color on hover */
        }
        h1 {
            color: #007bff; /* Bootstrap primary color */
            text-align: center; /* Center alignment */
        }
        h3 {
            text-align: right;
        }
        .navbar-inverse {
            background-color: #343a40; /* Dark navbar */
            border-color: #454d55; /* Dark border */
        }
        .navbar-inverse .navbar-nav > li > a {
            color: #f8f9fa; /* Light text in navbar */
        }
        .navbar-inverse .navbar-nav > li > a:hover {
            color: #28a745; /* Green on hover */
        }
        img {
            float: right;
            margin-left: 10px; /* Space between image and text */
        }
        .content {
            margin: 20px; /* Margin around content */
        }
    </style>
    <script>
        function myFunction() {
            var element = document.body;
            element.classList.toggle("dark-mode");
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-inverse">
        <div class="container">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=request.getContextPath()%>/logouting">Logout</a></li>
                <li>
                    <b>Change Mode: <input type="radio" onclick="myFunction()"></b>
                </li>
            </ul>
        </div>
    </nav>

    <div class="content">
        <img src="success.jsp?username=<%=request.getParameter("email")%>&pass=<%=request.getParameter("password")%>" class="img-circle" alt="User Photo" width="70" height="80">
        <h1>Welcome <strong><%=request.getParameter("email")%></strong></h1>
        <h1><a href="viewcart.jsp">See Products</a></h1>
        <h1><a href="chat.jsp">Chat</a></h1>
    </div>
</body>
</html>
