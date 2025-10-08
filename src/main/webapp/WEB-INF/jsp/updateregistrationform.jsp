<%@page import="com.example.demo.bean.BookingRegistrationBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insbrt title hbre</title>
<link rel="stylesheet" href="css/update.css" />
</head>
<body>
<%BookingRegistrationBean br = (BookingRegistrationBean)session.getAttribute("updatregistration"); %>


  <div class="form-containbr">
    <form class="form" action="updatedata" method="post">
      <h2 class="title">Update Information</h2>

      <div class="input-group">
      
        <input type="hidden" id="id" value="<%=br.getId()%>" name="Id" required autocomplete="given-name">
        
      </div>

      <div class="input-group">
        <input type="text" name="Name" id="name" value="<%=br.getName()%>" required />
        <label for="name">Name</label>
      </div>
		<div class="input-group">
        <input type="email" name="Email" id="email" value="<%=br.getEmail()%>"required />
        <label for="email">Email</label>
      </div>
      <div class="input-group">
        <input type="phone" name="Email" id="email" value="<%=br.getPhone()%>"required />
        <label for="phone">Phone</label>
      </div>
      
      
        <div class="input-group">
        <label for="gender">Gender</label>
        <select id="email" required>
          <option name="gender" value="<%=br.getGender() %>" disabled selected>Select Gender</option><br></br>
          <option>Male</option>
          <option>Female</option>
          <option>Other</option>
        </select>
      </div>
      
      
      
      
      <div class="input-group">
        <input type="Password" name="Password" id="name" value="<%=br.getPassword()%>"required />
        <label for="Password">Password</label>
      </div>

      <div class="input-group">
        <input type="Password" name="ConfirmPassword" id="message"  value="<%=br.getConfirmpassword()%>"required></input>
        <label for="Password">Confirm Password</label>
      </div>

      <button type="submit">Update</button>
    </form>
  </div>
</body>
</html>