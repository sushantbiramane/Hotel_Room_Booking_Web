<%@page import="java.util.ArrayList"%>
<%@page import="com.example.demo.bean.BookingRegistrationBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/table.css" />
</head>
<body>
<%ArrayList<BookingRegistrationBean>list=(ArrayList)session.getAttribute("list");%>
<table>
    <caption>Contact Table</caption>
    <thead>
      <tr>
      	<th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Password</th>
        <th>ConfirmPassword</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
    <%for(BookingRegistrationBean bd:list){ %>
     <tr>
  <td data-label="ID"><%=bd.getId() %></td>
  <td data-label="Name"><%=bd.getName()%></td>
  <td data-label="Email"><%=bd.getEmail() %></td>
  <td data-label="Password"><%=bd.getPassword() %></td>
  <td data-label="ConfirmPassword"><%=bd.getConfirmpassword() %></td>
  <td data-label="Action">
    <div class="action-buttons">
      <form action="deletedata" method="post" style="display:inline;">
        <input type="hidden" name="id" value="<%=bd.getId()%>">
        <button type="submit" class="delete-btn">Delete</button>
      </form>
      <form action="update" method="get" style="display:inline;">
        <input type="hidden" name="id" value="<%=bd.getId()%>">
        <button type="submit" class="update-btn">Update</button>
      </form>
    </div>
  </td>
</tr>

      <%} %>	
    </tbody>
  </table>
</body>
</html>