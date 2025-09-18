<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hotel Login</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: #f0f4f8;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .container {
      display: flex;
      width: 90%;
      max-width: 1000px;
      height: 500px;
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
      background: #fff;
    }

    .image-section {
      width: 50%;
      background-color: #fff;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
    }

    .image-section img {
      width: 109%;
      height: 109%;
      object-fit: contain; /* ✅ Keep image full, clean, and modern */
      border-radius: 10px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    }

    .form-section {
      width: 50%;
      padding: 40px 30px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      background: linear-gradient(to bottom right, #ffffff, #f3faff);
    }

    .form-section h2 {
      text-align: center;
      margin-bottom: 25px;
      color: #2c3e50;
      font-weight: 600;
    }

    .form-group {
      margin-bottom: 18px;
    }

    .form-group label {
      display: block;
      margin-bottom: 6px;
      font-weight: 500;
      color: #34495e;
    }

    .form-group input {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 10px;
      font-size: 14px;
      background-color: #f9f9f9;
    }

    .submit-btn {
      width: 100%;
      padding: 14px;
      border: none;
      border-radius: 10px;
      background: linear-gradient(to right, #00c6ff, #0072ff);
      color: white;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
    }

    .links {
      margin-top: 15px;
      text-align: center;
    }

    .links a {
      text-decoration: none;
      color: red;
      margin: 0 8px;
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
        height: auto;
      }

      .image-section, .form-section {
        width: 100%;
        height: auto;
      }

      .image-section img {
        max-width: 100%;
        height: auto;
        object-fit: contain;
      }
    }
  </style>
</head>
<body>

  <div class="container">

    <!-- ✅ Clean and full image side -->
    <div class="image-section">
      <img src="/img/room/room-1.jpg" alt="Hotel Room" />
    </div>

    <!-- ✅ Modern login form -->
    <div class="form-section">
      <form action="/loginData" method="post">
        <h2>Hotel Login</h2>

        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" id="email" name="Email" required />
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" id="password" name="Password" required />
        </div>

        <button type="submit" class="submit-btn">Login</button>

        <div class="links">
          <a href="/ForgotPassword">Forgot Password?</a> ||
          <a href="/registration">Create New Account</a>
        </div>
      </form>
    </div>

  </div>

</body>
</html>
