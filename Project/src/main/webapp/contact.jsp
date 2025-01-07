<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff; /* Light pastel blue */
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #3498db; /* Light blue */
            margin-bottom: 20px;
        }

        .flip-card {
            background-color: transparent;
            width: 300px;  /* Reduced width */
            height: 200px; /* Reduced height */
            perspective: 1000px; /* Perspective effect */
            margin: auto; /* Centering the card */
        }

        .flip-card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            text-align: center;
            transition: transform 0.6s;
            transform-style: preserve-3d;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .flip-card:hover .flip-card-inner {
            transform: rotateY(180deg);
        }

        .flip-card-front, .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden; /* Hide the back when facing the front */
        }

        .flip-card-front {
            background-color: #fff; /* White for the front */
            color: black;
            display: flex; /* Flexbox for centering content */
            flex-direction: column; /* Stack content vertically */
            justify-content: center; /* Center vertically */
            align-items: center; /* Center horizontally */
            padding: 10px; /* Padding for inner content */
        }

        .flip-card-back {
            background-color: #2980b9; /* Blue for the back */
            color: white;
            display: flex; /* Flexbox for centering content */
            flex-direction: column; /* Stack content vertically */
            justify-content: center; /* Center vertically */
            align-items: center; /* Center horizontally */
            padding: 10px; /* Padding for inner content */
            transform: rotateY(180deg); /* Rotate back for visibility */
        }

        .fa {
            padding: 10px; /* Reduced padding for smaller icons */
            font-size: 20px; /* Adjusted size for visibility */
            margin: 8px 2px;
            color: white; /* White icons */
            background-color: #3498db; /* Background color for visibility */
            border-radius: 5px; /* Slight rounding for a better look */
            display: inline-block; /* Ensures spacing between icons */
        }

        .fa:hover {
            opacity: 0.7;
        }

        /* Close button styling */
        .close-btn {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 24px;
            color: #3498db;
            cursor: pointer;
            background-color: transparent;
            border: none;
        }

        .close-btn:hover {
            color: #2980b9;
        }
    </style>
</head>
<body>

    <!-- Close Button -->
    <button class="close-btn" onclick="window.location.href='home.jsp'">&times;</button>

    <h1>My Self</h1>
    <div class="flip-card">
        <div class="flip-card-inner">
            <div class="flip-card-front">
                <h1>Likitha</h1>
                <p>B.Tech (Computer Science & Engineering)</p>
                <p>@ JAVA DEVELOPER</p>
                <p>Email Id: <a href="mailto:kammariraghaliktha@gmail.com" style="color: #3498db;">kammariraghaliktha@gmail.com</a></p>
            </div>
            <div class="flip-card-back">
                <img src='<%= request.getContextPath() + "/images/gadget2.jpg" %>' alt="Avatar" style="width:100px;height:100px;border-radius: 50%;">
                <p>Connect with me!</p>
            </div>
        </div>
    </div>

    <div style="text-align: center; margin-top: 20px;">
        <h1><br></h1>
        <h1>You can Connect With Me through Below:</h1>
        <a href="https://www.facebook.com" class="fa fa-facebook"></a>
        <a href="https://www.google.com/" class="fa fa-google"></a>
        <a href="https://www.linkedin.com" class="fa fa-linkedin"></a>
        <a href="https://youtube.com" class="fa fa-youtube"></a>
        <a href="https://www.instagram.com/r_k_6915/" class="fa fa-instagram"></a>
        <a href="https://wa.me/qr/GWYLLTRAONKDN1" class="fa fa-whatsapp"></a>

        <h3>Reference Videos are:</h3>
        <iframe width="300" height="200" src="https://www.youtube.com/embed/v9r7PDnE0kA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen style="padding:20px;"></iframe>
        <iframe width="300" height="200" src="https://www.youtube.com/embed/M0WNM_3Eea8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" style="padding:20px;"></iframe>
        <br>
        <h4><a href="chat.jsp">Help?</a></h4>
    </div>

</body>
</html>
