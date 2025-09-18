<%@page import="com.example.demo.bean.HotelRoomList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/admin.css" />
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet" />
</head>
<body>
<%ArrayList<HotelRoomList>list=(ArrayList)session.getAttribute("list");%>
  <div class="admin-container">
    <aside class="sidebar">
      <h2> Hotel Admin</h2>
     <ul class="sidebar-menu">
  <li><a href="dashboard.jsp" class="menu-link">Dashboard</a></li>
  <li><a href="showbooking" class="menu-link">Bookings</a></li>
  <li><a href="rooms.jsp" class="menu-link">Rooms</a></li>
  <li><a href="customers.jsp" class="menu-link">Customers</a></li>
  <li><a href="settings.jsp" class="menu-link">Settings</a></li>
  <li><a href="logout.jsp" class="menu-link logout-btn">Logout</a></li>
</ul>

    </aside>

    <main class="main-content">
      <header>
        <h1>Dashboard</h1>
       <a href="hotelList" class="add-room-btn">+ Add Room</a>
      </header>

      <section class="table-section">
        <h2>Room List</h2>
        <table>
          <thead>
            <tr>
              <th>Room ID</th>
              <th>Room Photo</th>
              <th>Type</th>
              <th>Price/Night</th>
              <th>Size</th>
              <th>Capacity</th>
              <th>Status</th>
              <th>Services</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
          <%if(list != null){ %>
          <%for(HotelRoomList hrd:list){ %>
            <tr>
              <td>#<%=hrd.getID() %></td>
              <td><img style="width: 100px;" src="img/room/<%= hrd.getImage() %>" alt=""></td>
              <td><%=hrd.getType() %></td>
              <td><%=hrd.getPrice()%></td>
              <td><%=hrd.getSize() %></td>
              <td><%=hrd.getCapacity() %> </td>
              <td><%=hrd.getStatus() %> </td>
              <td> <%=hrd.getServices() %></td>
              <td>
              <form action="deleteroom" method="post" >
       			 <input type="hidden" name="ID" value="<%=hrd.getID()%>">
       			 <button class="delete-btn">Delete</button>
                </form>
                <form action="updateroom" method="get" >
       			 <input type="hidden" name="ID" value="<%=hrd.getID()%>">
                 <button class="edit-btn">Edit</button>
                 </form>
              </td>
            </tr>
             <%} %>
             <%}  else { %> 
             
              <tr>
        <td colspan="8" style="text-align: center;">No rooms available.</td>
  			  </tr>
              <%} %>
          </tbody>
        </table>
      </section>
    </main>
  </div>
</body>
</html>