<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/log.css" />
<style>
  .otp-container {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 20px;
  }

  .otp-input {
    width: 40px;
    height: 40px;
    text-align: center;
    font-size: 18px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
</style>
</head>
<body>
 
   
 <form class="registration-form" action="submitotp" method="POST">
    <h2><i class="fas fa-unlock-alt"></i> OTP Verification</h2>

    <label for="otp1">Enter OTP</label>
    <div class="otp-container">
      <input type="text" class="otp-input" name="otp1" id="otp1" maxlength="1" required>
      <input type="text" class="otp-input" name="otp2" id="otp2" maxlength="1" required>
      <input type="text" class="otp-input" name="otp3" id="otp3" maxlength="1" required>
      <input type="text" class="otp-input" name="otp4" id="otp4" maxlength="1" required>
      <input type="text" class="otp-input" name="otp5" id="otp5" maxlength="1" required>
      <input type="text" class="otp-input" name="otp6" id="otp6" maxlength="1" required>
    </div>

    

    <p class="error-message" id="forgotError"></p>

    <button type="submit" class="submit-btn">Submit</button>

    
  </form>

    
</body>

</html>