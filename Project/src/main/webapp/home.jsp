<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gadget Hub</title>
  <!-- Bootstrap CDN -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
    body {
      background-color: #f8f5f1; /* Pastel cream background */
      font-family: 'Arial', sans-serif;
      overflow: hidden; /* Disable scrolling */
      height: 100vh; /* Full viewport height */
      margin: 0;
    }

    marquee {
      font-size: 36px;
      color: #6a6fbb; /* Pastel blue */
      font-weight: bold;
    }

    .navbar {
      background-color: #a5d8dd; /* Pastel cyan */
    }

    .navbar-dark .navbar-nav .nav-link {
      color: #ffffff; /* White text for contrast */
    }

    .navbar-dark .navbar-nav .nav-link:hover {
      color: #f7cac9; /* Pastel pink on hover */
    }

    .carousel-inner img {
      border: 5px solid #ffb6b9; /* Pastel coral */
      border-radius: 15px;
      width: 100%; /* Make image take up full width */
      height: 350px; /* Set fixed height for image */
      object-fit: cover; /* Ensure the image covers the space without stretching */
      margin: auto;
    }

    .carousel-control-prev-icon, .carousel-control-next-icon {
      background-color: #f7cac9; /* Pastel pink */
      border-radius: 50%;
    }

    input, button {
      background-color: #e3e6f3; /* Light pastel purple */
      color: #333333;
      border: 1px solid #a5d8dd;
      border-radius: 5px;
      padding: 8px;
    }

    input:focus, button:hover {
      background-color: #d4f1f4; /* Slightly lighter pastel cyan */
      border-color: #6a6fbb;
    }

    div3 {
      background-color: #f7cac9; /* Pastel pink */
      color: #6a6fbb; /* Pastel blue text */
      padding: 16px 20px;
      position: fixed;
      bottom: 564px;
      right: 80px;
      width: 300px;
      border: 2px solid #a5d8dd; /* Pastel cyan */
      border-radius: 10px;
      font-style: italic;
      font-size: 20px;
      text-align: center;
    }

    div2 {
      background-color: #d4f1f4; /* Pastel cyan */
      color: #ffb6b9; /* Pastel coral */
      padding: 16px 20px;
      position: fixed;
      bottom: 42px;
      right: 80px;
      width: 300px;
      border: 2px solid #6a6fbb; /* Pastel blue */
      border-radius: 15px;
      font-style: italic;
      font-size: 18px;
      text-align: center;
    }
  </style>
</head>
<body>
  <marquee behavior="alternate">🌟 Welcome to <i>Gadget Hub</i> 🚀</marquee>
  <nav class="navbar navbar-expand-md navbar-dark sticky-top">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mynav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="mynav">
        <!-- Links on the left -->
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.jsp">About Us</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.jsp">Contact Us</a>
          </li>
        </ul>

        <!-- Register and Login on the right -->
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="reg.jsp">Register</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">Login</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
 
  <div class="container mt-5">
    <div id="demo" class="carousel slide" data-ride="carousel">
      <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
      </ul>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="https://images.pexels.com/photos/190819/pexels-photo-190819.jpeg" alt="Watch 1">
        </div>
        <div class="carousel-item">
          <img src="${pageContext.request.contextPath}/images/watch3.jpg" alt="Watch 2">
        </div>
        <div class="carousel-item">
          <img src="${pageContext.request.contextPath}/images/watch4.jpg" alt="Watch 3">
        </div>
      </div>
      <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </a>
      <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
      </a>
    </div>
  </div>
</body>
</html>
