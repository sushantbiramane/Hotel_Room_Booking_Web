<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,com.example.demo.bean.HotelRoomList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Available Rooms</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0f4f8;
            padding: 30px;
        }
        table {
            width: 100%;
            border-collapse: collaps/*  */e;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        th {
            background-color: #007BFF;
            color: #fff;
            text-transform: uppercase;
        }
        tr:hover {
            background-color: #f1f9ff;
        }
        img {
            width: 100px;
            border-radius: 8px;
        }
        .book-btn {
            padding: 8px 16px;
            background: linear-gradient(to right, #28a745, #218838);
            color: white;
            border: none;
            border-radius: 6px;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <h2>Available Rooms from ${checkin} to ${checkout}</h2>

    <table>
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
        <c:forEach var="room" items="${availableRooms}">
            <tr>
                <td>${room.ID}</td>
                <td><img src="${room.image}" alt="Room Image"></td>
                <td>${room.type}</td>
                <td>${room.price}</td>
                <td>${room.size}</td>
                <td>${room.capacity}</td>
                <td>${room.status}</td>
                <td>${room.services}</td>
                <td>
                    <form action="checkoutpage" method="post">
                        <input type="hidden" name="ID" value="${room.ID}" />
                        <button type="submit" class="book-btn">Book Now</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
