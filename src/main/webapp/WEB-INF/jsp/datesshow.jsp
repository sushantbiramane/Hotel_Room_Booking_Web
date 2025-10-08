<%@page import="com.example.demo.bean.SelectDate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f5f7fa;
      margin: 0;
      padding: 20px;
    }

    h2 {
      text-align: center;
      color: #333;
    }

    .availability-table {
      width: 100%;
      max-width: 1100px;
      margin: 20px auto;
      border-collapse: collapse;
      background: #fff;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
      border-radius: 12px;
      overflow: hidden;
    }

    .availability-table th, .availability-table td {
      padding: 16px 20px;
      text-align: center;
      border-bottom: 1px solid #eee;
    }

    .availability-table th {
      background-color: #2e86de;
      color: #fff;
      font-size: 16px;
      text-transform: uppercase;
    }

    .availability-table tr:hover {
      background-color: #f1f9ff;
    }

    .available {
      color: green;
      font-weight: bold;
    }

    .unavailable {
      color: red;
      font-weight: bold;
    }

    .btn-book {
      background-color: #27ae60;
      color: white;
      padding: 8px 16px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      transition: 0.3s;
    }

    .btn-book:hover {
      background-color: #219150;
    }
  </style>
</head>
<body>
<%ArrayList<SelectDate> list=(ArrayList)session.getAttribute("list");%>
<h2>Room Availability</h2>

<table class="availability-table">
  <thead>
    <tr>
    	<th>Room ID</th>
      <th>Check-In</th>
      <th>Check-Out</th>
      <th>Guest</th>
      <th>Room</th>
      <th>Status</th>
      <th>Action</th>
    </tr>
  </thead>
  <tbody>
  <%for(SelectDate sd:list){ %>
    <tr>
    
      <td><%=sd.getID() %></td>
      <td>2025-07-10<%=sd.getCheck_In() %></td>
      <td>2025-07-12<%=sd.getCheck_Out() %></td>
      <td><%=sd.getGuests() %></td>
      <td><%=sd.getRoom() %></td>
      <td class="available">Available</td>
      <!-- <td><button class="btn-book">Book Now</button></td> -->
    </tr>
    <%} %>
    
  </tbody>
</table>

</body>
</html>