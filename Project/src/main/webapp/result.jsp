<html lang="en">
<head>
  <title>Search Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
  <form  action="search.jsp">
    <input type="text" name="name" class="form-control" placeholder="userid / uemail">
    <button type="submit" name="submit" class="btn btn-primary">Search</button>
  </form>
</div>
<%@ include file="retrive.jsp" %>  
</body>

</html> 
