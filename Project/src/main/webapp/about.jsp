<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>About - Gadget Hub</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #ffffff; /* White background */
      margin: 0;
      padding: 0;
      text-align: center;
      color: #6b4c94; /* Pastel purple text color */
    }

    h2 {
      color: #4f2c7a; /* Deep pastel purple */
      font-size: 32px;
      margin-top: 30px;
      font-weight: bold;
    }

    .button {
      background-color: #b3a0d0; /* Pastel lavender */
      color: white;
      padding: 18px 32px;
      margin: 20px;
      border: none;
      font-size: 18px;
      cursor: pointer;
      border-radius: 8px;
      transition: background-color 0.3s;
    }

    .button:hover {
      background-color: #9f8dc9; /* Lighter pastel lavender */
    }

    .panel {
      padding: 20px;
      background-color: #ffffff; /* White background for the panel */
      width: 70%;
      margin: 20px auto;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      display: none; /* Hidden by default */
    }

    .panel p {
      font-size: 16px;
      color: #6b4c94; /* Pastel purple text */
      line-height: 1.6;
    }

    /* Box style for the link in pastel colors without hover effect */
    .box-container {
      display: flex;
      justify-content: center; /* Center the box */
      margin: 20px auto;
    }

    .box {
      background-color: #f9c8d7; /* Pastel pink */
      color: white;
      padding: 18px 30px;
      font-size: 18px;
      border-radius: 8px;
      text-decoration: none;
      text-align: center;
      width: 200px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    a {
      color: #4f2c7a; /* Deep pastel purple for links */
      text-decoration: none;
      font-weight: bold;
      font-size: 18px;
      display: inline-block;
      margin-top: 20px;
      border-bottom: 2px solid #4f2c7a; /* Underline */
      padding-bottom: 5px;
    }

    a:hover {
      color: #f9a5c0; /* Pink on hover */
      border-bottom-color: #f9a5c0; /* Change underline to pink */
    }

    .back-button {
      background-color: #a8d3e3; /* Pastel teal */
      color: white;
      padding: 15px 25px;
      border: none;
      font-size: 18px;
      cursor: pointer;
      border-radius: 8px;
      text-decoration: none;
      transition: background-color 0.3s;
      margin-top: 30px;
    }

    .back-button:hover {
      background-color: #85c0d3; /* Lighter pastel teal */
    }
  </style>
</head>
<body>

  <div class="container">
    <h2>About Watches</h2>

    <!-- Short introduction about watches -->
    <p>Watches were developed in the 17th century from spring-powered clocks, which appeared as early as the 14th century. During most of its history, the watch was a mechanical device.</p>

    <!-- Button to display more info -->
    <button class="button" onclick="togglePanel()">More to Learn</button>

    <!-- Panel with detailed information -->
    <div class="panel" id="infoPanel">
      <p>Watches were driven by clockwork, powered by winding a mainspring, and keeping time with an oscillating balance wheel. These are called mechanical watches. Modern watches can be powered by a variety of technologies, including digital electronics, solar energy, or kinetic energy from wrist movements.</p>
    </div>

    <!-- Centered Box with pastel color for the link -->
    <div class="box-container">
      <a href="testimonial.jsp" class="box">Click here for more watches</a>
    </div>

    <!-- Back to Home Button -->
    <a href="home.jsp" class="back-button">Back to Home</a>
  </div>

  <script>
    // Function to toggle the display of the panel
    function togglePanel() {
      var panel = document.getElementById("infoPanel");
      if (panel.style.display === "block") {
        panel.style.display = "none";
      } else {
        panel.style.display = "block";
      }
    }
  </script>
</body>
</html>
