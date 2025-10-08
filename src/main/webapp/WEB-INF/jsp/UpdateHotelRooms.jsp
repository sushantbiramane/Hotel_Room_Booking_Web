<%@page import="com.example.demo.bean.HotelRoomList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/hotelroomupdate.css">
</head>
<body>
<%HotelRoomList hr = (HotelRoomList)session.getAttribute("updatroom"); %>
  <div class="form-container">
    <h2>Update Room Details</h2>
    <form action="updateroomdata" method="post" >
      
      <input type="hidden" name="ID" value="<%=hr.getID()%>">

      <div class="form-group">
  <label for="Image">Room Image</label>
  
  <!-- Show current image preview -->
  <img src="img/room/<%= hr.getImage() %>" alt="Room Image" style="max-width: 200px; display: block; margin-bottom: 10px;">

  <!-- New image upload input -->
  <input type="file" name="Image" id="Image" accept="image/*">
</div>

      <div class="form-group">
        <label for="Type">Type</label>
        <input type="text" name="Type" id="Type"  value="<%=hr.getType()%>" required>
      </div>

      <div class="form-group">
        <label for="Price">Price</label>
        <input type="text" name="Price" id="Price"  value="<%=hr.getPrice()%>" required>
      </div>

      <div class="form-group">
        <label for="Size">Size</label>
        <input type="text" name="Size" id="Size" value="<%=hr.getSize()%>"required>
      </div>

      <div class="form-group">
        <label for="Capacity">Capacity</label>
        <input type="text" name="Capacity" id="Capacity" value="<%=hr.getCapacity()%>" required>
      </div>

      <div class="form-group">
        <label for="Status">Status</label>
        <select name="Status" id="Status">
          <option value="Available">Available</option>
          <option value="Booked">Booked</option>
        </select>
      </div>

      <div class="form-group">
        <label for="Services">Services</label>
       <input  name="Services" id="Services" value="<%=hr.getServices()%>" rows="3"  ></input>
     
      </div>

      <button type="submit" class="btn">Update Room</button>
    </form>
  </div>
</body>
</html>