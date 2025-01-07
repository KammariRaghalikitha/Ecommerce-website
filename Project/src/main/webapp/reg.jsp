<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration Form</title>
  <!-- Bootstrap CDN -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <style>
    body {
      background-color: #ffe4e1; /* Light pink background */
      padding-top: 50px;
    }
    
    .form-container {
      background-color: white; /* White background for form */
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      padding: 30px;
      max-width: 600px;
      margin: auto;
      position: relative;
    }

    h1 {
      color: #4a4e69; /* Darker pastel color for heading */
      text-align: center;
      margin-bottom: 30px;
    }

    label {
      font-weight: bold;
      color: #4a4e69; /* Darker pastel color for labels */
    }

    input:hover, select:hover, button:hover {
      background-color: #f0f0f0; /* Light gray on hover */
    }

    button {
      margin-right: 10px;
    }

    .form-control:focus {
      border-color: #a7c2c9; /* Pastel blue on focus */
      box-shadow: 0 0 5px rgba(167, 194, 201, 0.5); /* Shadow effect */
    }

    .submit-btn {
      background-color: #28a745; /* Green for submit button */
      color: white;
      width: 100%;
    }

    .reset-btn {
      background-color: #dc3545; /* Red for reset button */
      color: white;
      width: 100%;
    }

    .btn-container {
      display: flex;
      justify-content: space-between;
    }

    @media (max-width: 768px) {
      .btn-container {
        flex-direction: column;
      }
      
      .btn-container button {
        width: 100%;
        margin-bottom: 10px;
      }
    }

    /* Back Button Style */
    .back-btn {
      position: absolute;
      top: 10px;
      right: 10px;
      font-size: 30px;
      background: none;
      border: none;
      color: #4a4e69;
      cursor: pointer;
    }

    .back-btn:hover {
      color: #dc3545; /* Red on hover */
    }
  </style>

  <script type="text/javascript">
    function dream() {
      var firstname = document.myform.firstname.value;
      var lastname = document.myform.lastname.value;
      var uemail = document.myform.uemail.value;
      var password = document.myform.password.value;
      var conpassword = document.myform.conpassword.value;
      var mobileno = document.myform.mobileno.value;
      var address = document.myform.address.value;
      var photo = document.myform.photo.value;

      if (firstname == "" || lastname == "" || uemail == "" || password == "" || conpassword == "" || mobileno == "" || address == "" || photo == "") {
        window.alert("Please enter all values.");
        return false;
      } else if (password !== conpassword) {
        window.alert("Passwords do not match.");
        return false;
      } else {
        return true;
      }
    }
  </script>
</head>
<body>
  <div class="container">
    <div class="form-container">
      <!-- Back Button -->
      <button class="back-btn" onclick="window.location.href='home.jsp'">&times;</button> <!-- X button for back -->

      <h1>Registration Form</h1>
      <form name="myform" action="insert" onsubmit="return dream()" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <label for="firstname">First Name</label>
          <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter first name" pattern="^[a-zA-Z]*$" required>
        </div>

        <div class="form-group">
          <label for="lastname">Last Name</label>
          <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter last name" pattern="^[a-zA-Z]*$" required>
        </div>

        <div class="form-group">
          <label for="uemail">User Email</label>
          <input type="email" class="form-control" id="uemail" name="uemail" placeholder="Enter email address" required>
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Enter password"  title="Must contain at least one number, one uppercase and lowercase letter, and at least 8 or more characters" required>
        </div>

        <div class="form-group">
          <label for="conpassword">Confirm Password</label>
          <input type="password" class="form-control" id="conpassword" name="conpassword" placeholder="Confirm password"  title="Must contain at least one number, one uppercase and lowercase letter, and at least 8 or more characters" required>
        </div>

        <div class="form-group">
          <label for="mobileno">Phone Number</label>
          <input type="tel" class="form-control" id="mobileno" name="mobileno" placeholder="Enter 10-digit phone number" pattern="[0-9]{10}" required>
        </div>

        <div class="form-group">
          <label for="photo">Photo</label>
          <input type="file" class="form-control-file" id="photo" name="photo" accept="image/*" required>
        </div>

        <div class="form-group">
          <label for="role">Role</label>
          <select class="form-control" id="role" name="role" required>
            <option value="admin">Admin</option>
            <option value="user">User</option>
          </select>
        </div>

        <div class="btn-container">
          <button type="submit" class="btn submit-btn">Submit</button>
          <button type="reset" class="btn reset-btn">Reset</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>
