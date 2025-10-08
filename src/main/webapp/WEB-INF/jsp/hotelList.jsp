<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/hotelList.css">
</head>
<body>
  <form class="form-container" action="hotelbooking" method="POST" >
    <h2>Room Details</h2>

    <div class="form-row">
      <!-- Left Column -->
      <div class="form-column">
        <div class="form-group">
          <label for="RoomImage">Room Image</label>
          <input type="file" id="RoomImage" name="Image" required>
        </div>

        <div class="form-group">
          <label for="type">Type</label>
          <input type="text" id="type" name="Type" required>
        </div>

        <div class="form-group">
          <label for="price">Price</label>
          <input type="text" id="price" name="Price" required>
        </div>
      </div>

      <!-- Right Column -->
      <div class="form-column">
        <div class="form-group">
          <label for="size">Size</label>
          <input type="text" id="size" name="Size" required>
        </div>

        <div class="form-group">
          <label for="capacity">Capacity</label>
          <input type="text" id="capacity" name="Capacity" required>
        </div>

        <div class="form-group">
          <label for="status">Status</label>
          <input type="text" id="status" name="Status" required>
        </div>

        <div class="form-group">
          <label for="services">Services</label>
          <input type="text" id="services" name="Services" required>
        </div>
      </div>
    </div>

    <div class="form-actions">
      <button type="submit">Submit</button>
    </div>
  </form>
</body>
</html>