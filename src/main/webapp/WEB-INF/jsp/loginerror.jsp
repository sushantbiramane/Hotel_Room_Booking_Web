<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <style>
    body {
      background-color: #fef2f2;
      font-family: Arial, sans-serif;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }

    .error-box {
      background-color: #fff0f0;
      border: 1px solid #ffcccc;
      padding: 30px 40px;
      border-radius: 10px;
      text-align: center;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .error-box h2 {
      color: #d32f2f;
      margin-bottom: 20px;
    }

    .error-box a {
      text-decoration: none;
      color: #1565c0;
      font-weight: bold;
      margin-top: 10px;
      display: inline-block;
    }

    .error-box a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="error-box">
    <h2>Email and Password dont match.<br>Please check properly.</h2>
    <a href="Login"> Back to Login</a>
  </div>

</body>
</html>