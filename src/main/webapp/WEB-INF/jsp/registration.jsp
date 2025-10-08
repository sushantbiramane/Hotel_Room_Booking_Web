<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Register</title>
  <link rel="stylesheet" href="css/login.css" />
   <style>
  .back-login {
    margin-top: 15px;
    width: 100%;
    text-align: center;
    margin-left: 218px;
  }

  .back-login a {
    color: #ff0000;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    transition: color 0.3s ease;
  }

  .back-login a:hover {
    color: #0056b3;
    text-decoration: underline;
  }
</style>

</head>
<body>

  <div class="form-container">
    <h2>Register Now</h2>
    <form action="saveregister" method="post">
      <div class="form-grid">

        <!-- Left Column -->
        <div class="form-group">
          <label for="fullname">Full Name</label>
          <input type="text" id="fullname" name="name" required />
        </div>

        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="email" required />
        </div>

        <div class="form-group">
          <label for="phone">Phone</label>
          <input type="tel" id="phone" name="phone" required />
        </div>

        <!-- Right Column -->
        <div class="form-group">
          <label for="gender">Gender</label>
          <select id="gender" name="gender" required>
            <option value="" disabled selected>Select Gender</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
          </select>
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" id="password" name="password" required />
        </div>

        <div class="form-group">
          <label for="confirm">Confirm Password</label>
          <input type="password" id="confirm" name="Confirmpassword" required />
        </div>

        <!-- Submit Button -->
        <button type="submit" class="submit-btn">Sign Up</button>

	<div class="back-login">
          <a href="Login">Back to Login</a>
        </div>
      </div>
    </form>
  </div>

</body>
</html>
