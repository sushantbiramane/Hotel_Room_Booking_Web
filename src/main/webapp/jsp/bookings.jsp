<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page import="com.example.demo.bean.Checkout" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking Summary</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(to right, #f3f4f6, #e0eafc);
        margin: 0;
        padding: 30px;
    }

    .booking-container {
        display: flex;
        flex-wrap: wrap;
        gap: 24px;
        justify-content: center;
    }

    .booking-card {
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        padding: 24px;
        width: 420px;
        flex: 1 1 320px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border: 2px solid #e3e8f0;
    }

    .booking-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 12px 28px rgba(0, 0, 0, 0.2);
    }

    .booking-card h3 {
        margin-top: 0;
        color: #2b6cb0;
        font-size: 1.5rem;
        margin-bottom: 16px;
        border-bottom: 2px solid #edf2f7;
        padding-bottom: 10px;
    }

    .booking-info {
        display: grid;
        grid-template-columns: 1fr 1fr;
        row-gap: 10px;
        column-gap: 12px;
        font-size: 15px;
    }

    .booking-info .label {
        font-weight: 600;
        color: #4a5568;
    }

    .booking-info .value {
        color: #1a202c;
    }

    .action-buttons {
        margin-top: 20px;
        display: flex;
        justify-content: flex-end;
        gap: 12px;
    }

    .btn {
        padding: 8px 16px;
        font-size: 14px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        transition: all 0.25s ease;
    }

    .btn-modify {
        background-color: #4299e1;
        color: white;
    }

    .btn-modify:hover {
        background-color: #2b6cb0;
    }

    .btn-remove {
        background-color: #e53e3e;
        color: white;
    }

    .btn-remove:hover {
        background-color: #c53030;
    }

    @media (max-width: 768px) {
        .booking-card {
            width: 100%;
        }
    }
</style>
</head>
<body>

<% ArrayList<Checkout> list = (ArrayList<Checkout>) session.getAttribute("list"); %>

<div class="booking-container">
<% if (list != null && !list.isEmpty()) {
     for (Checkout c : list) { 
     
     
    	 DateTimeFormatter fmt = DateTimeFormatter.ofPattern("d MMMM, yyyy", java.util.Locale.ENGLISH);

         // 2. Convert the Strings from your bean into LocalDate
         java.time.LocalDate checkIn  = java.time.LocalDate.parse(c.getCheckIn(),  fmt);
         java.time.LocalDate checkOut = java.time.LocalDate.parse(c.getCheckOut(), fmt);

         // 3. Calculate the difference in days
         long totalNights = java.time.temporal.ChronoUnit.DAYS.between(checkIn, checkOut);
         if (totalNights <= 0) {
       	    out.print("Check-out date must be after check-in date.");
       	} else {
       	 //   out.print("Total nights: " + totalNights);
       	}
         
         
         int price = Integer.parseInt(c.getPricePerNight());         // price per night
 	    int rooms = Integer.parseInt(c.getRoomsBooked());          // number of rooms
 	    long totalAmount = price * totalNights * rooms;
     
     
     
     
     %>

    <div class="booking-card">
        <h3>Booking Summary</h3>
        <div class="booking-info">
           <div class="label">Name:</div>
<div class="value" data-value="<%= c.getName() %>"><%= c.getName() %></div>

<div class="label">Email:</div>
<div class="value" data-value="<%= c.getEmail() %>"><%= c.getEmail() %></div>

<div class="label">Phone:</div>
<div class="value" data-value="<%= c.getPhone() %>"><%= c.getPhone() %></div>

<div class="label">Room Type:</div>
<div class="value" data-value="<%= c.getRoomType() %>"><%= c.getRoomType() %></div>

<div class="label">Room Size:</div>
<div class="value" data-value="<%= c.getRoomSize() %>"><%= c.getRoomSize() %></div>

<div class="label">Guests:</div>
<div class="value" data-value="<%= c.getGuests() %>"><%= c.getGuests() %></div>

<div class="label">Rooms:</div>
<div class="value" data-value="2">2</div>

<div class="label">Check-in:</div>
<div class="value" data-value="<%= c.getCheckIn() %>"><%= c.getCheckIn() %></div>

<div class="label">Check-out:</div>
<div class="value" data-value="<%= c.getCheckOut() %>"><%= c.getCheckOut() %></div>

<div class="label">Price/Night:</div>
<div class="value" data-value="<%= c.getPricePerNight() %>">$<%= c.getPricePerNight() %></div>

<div class="label">Nights:</div>
<div class="value" data-value="3"><%=c.getTotalNights() %></div>

<div class="label">Total:</div>
<div class="value" data-value="<%=totalAmount %> ">
    <strong>$<%= totalAmount%>  </strong>
</div>

<div class="label">Payment:</div>
<div class="value" data-value="<%= c.getPaymentMethodcash() != null ? "Cash" : "Card" %>">
    <%= c.getPaymentMethodcash() != null ? "Cash" : "Card" %>
</div>

            <% if (c.getPaymentMethodcard() != null) { %>
                <div class="label">Card Name:</div><div class="value"><%= c.getCardHolderName() %></div>
                <div class="label">Card No:</div><div class="value"><%= c.getCardNumber() %></div>
                <div class="label">Expiry:</div><div class="value"><%= c.getExpiryDate() %></div>
                <div class="label">CVV:</div><div class="value"><%= c.getCvv() %></div>
            <% } %>

            <div class="label">Address:</div><div class="value"><%= c.getBillingAddress() %></div>
        </div>

        <div class="action-buttons">
            <form action="modifyBooking" method="post">
                <input type="hidden" name="bookingId" value="<%-- <%= c.getId() %> --%>">
                <button class="btn btn-modify" type="submit">Modify</button>
            </form>

            <form action="removebooking" method="post" >
                <input type="hidden" name="ID" value=" <%= c.getID() %> ">
                <button class="btn btn-remove" type="submit">Remove</button>
            </form>
        </div>
    </div>

<% } } else { %>
    <p style="text-align:center; font-size: 1.2rem;">No bookings found.</p>
<% } %>
</div>

</body>
</html>
