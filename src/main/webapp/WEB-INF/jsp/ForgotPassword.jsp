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
 <form class="registration-form" action="otp" method="POST">
    <h2><i class="fas fa-unlock-alt"></i> Update Password</h2>

    <div class="form-group">
      <label for="forgotEmail">Enter Email</label>
      <input type="text" id="forgotEmail" name="Email" required />
    </div>
    

    <p class="error-message" id="forgotError"></p>

    <button type="submit" class="submit-btn">Send OTP</button>

    
  </form>
</body>
</html>