<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/log.css" />
</head>
<body>
<form class="registration-form" id="loginForm" action= "setpassword" method="get">
    <h2> Set Password</h2>

    <div class="form-group">
      <label for="loginEmail">Password</label>
      <input type="password" id="loginEmail" name="Password" required />
    </div>

    <div class="form-group">
      <label for="loginPassword">Confirm Password</label>
      <input type="password" id="loginPassword" name="ConfirmPassword" required />
    </div>

    <p class="error-message" id="loginError"></p>

  <a href="index.jsp">  <button type="submit" class="submit-btn">Change Password</button></a>
 
</body>
</html>