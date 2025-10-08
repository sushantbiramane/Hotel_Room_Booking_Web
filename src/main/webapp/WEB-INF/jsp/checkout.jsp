<%@page import="com.example.demo.bean.SelectDate"%>
<%@page import="com.example.demo.bean.BookingRegistrationBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.demo.bean.HotelRoomList"%>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter, java.time.temporal.ChronoUnit" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
<link rel="stylesheet" href="css/checkout.css">
</head>
<body>
<%
    ArrayList<HotelRoomList> arr = (ArrayList) session.getAttribute("list");
    HotelRoomList hr = (HotelRoomList) session.getAttribute("roomdetail");
    SelectDate sd = (SelectDate) session.getAttribute("dates");
    BookingRegistrationBean list = (BookingRegistrationBean) session.getAttribute("User");
%>

<form action="confirmBooking" method="post" id="paymentForm">

    <div class="checkout-container">
        <!-- Left: Booking Details -->
        <div class="booking-details">
            <h2>Booking Summary</h2>
            <img src="img/room/<%=hr.getImage() %>" alt="Room Image" class="room-img">

            <% if (session.getAttribute("User") != null) {
                DateTimeFormatter fmt = DateTimeFormatter.ofPattern("d MMMM, yyyy", java.util.Locale.ENGLISH);
                LocalDate checkIn = LocalDate.parse(sd.getCheck_In(), fmt);
                LocalDate checkOut = LocalDate.parse(sd.getCheck_Out(), fmt);
                long totalNights = ChronoUnit.DAYS.between(checkIn, checkOut);
                if (totalNights <= 0) {
                    out.print("Check-out date must be after check-in date.");
                } else {
                    out.print("Total nights: " + totalNights);
                }
                int price = Integer.parseInt(hr.getPrice());
                int rooms = Integer.parseInt(sd.getRoom());
                long totalAmount = price * totalNights * rooms;
            %>

            <p><strong>Name:</strong> <%=list.getName()%></p>
            <input type="hidden" name="name" value="<%=list.getName()%>">

            <p><strong>Email:</strong> <%=list.getEmail()%></p>
            <input type="hidden" name="email" value="<%=list.getEmail()%>">

            <p><strong>Phone:</strong> <%=list.getPhone()%></p>
            <input type="hidden" name="phone" value="<%=list.getPhone()%>">

            <p><strong>Room Type:</strong> <%=hr.getType()%></p>
            <input type="hidden" name="roomType" value="<%=hr.getType()%>">

            <p><strong>Room Size:</strong> <%=hr.getSize()%></p>
            <input type="hidden" name="roomSize" value="<%=hr.getSize()%>">

            <p><strong>Guests:</strong> <%=sd.getGuests()%></p>
            <input type="hidden" name="guests" value="<%=sd.getGuests()%>">

            <p><strong>Rooms Booked:</strong> <%=sd.getRoom()%></p>
            <input type="hidden" name="roomsBooked" value="<%=sd.getRoom()%>">

            <p><strong>Check-in:</strong> <%=sd.getCheck_In()%></p>
            <input type="hidden" name="checkIn" value="<%=sd.getCheck_In()%>">

            <p><strong>Check-out:</strong> <%=sd.getCheck_Out()%></p>
            <input type="hidden" name="checkOut" value="<%=sd.getCheck_Out()%>">

            <p><strong>Price per Night:</strong> <%=hr.getPrice()%></p>
            <input type="hidden" name="pricePerNight" value="<%=hr.getPrice()%>">

            <p><strong>Total Nights:</strong> <%=totalNights%></p>
            <input type="hidden" name="totalNights" value="<%=totalNights%>">

            <p><strong>Total Amount:</strong> <%= price %> * <%= totalNights %> * <%= rooms %> = <%= totalAmount %></p>
            <input type="hidden" name="totalAmount" id="amount" value="<%= totalAmount %>">
            <% } %>
        </div>

        <!-- Right: Payment Section -->
        <div class="payment-section">
            <h2>Payment Details</h2>

            <label>Choose Payment Method:</label>
            <div class="radio-group">
                <label>
                    <input type="radio" name="paymentMethod" value="card" checked onclick="togglePayment('card')"> Credit/Debit Card
                </label>
                <label>
                    <input type="radio" name="paymentMethod" value="cash" onclick="togglePayment('cash')"> Cash on Place
                </label>
            </div>

            <div id="cardSection">
                <label for="cardName">Card Holder Name</label>
                <input type="text" id="cardName" name="cardHolderName">

                <label for="cardNumber">Card Number</label>
                <input type="text" id="cardNumber" name="cardNumber" maxlength="16">

                <div class="row">
                    <div class="col">
                        <label for="expDate">Expiry Date</label>
                        <input type="text" id="expDate" name="expiryDate" placeholder="MM/YY">
                    </div>
                    <div class="col">
                        <label for="cvv">CVV</label>
                        <input type="password" id="cvv" name="cvv" maxlength="3">
                    </div>
                </div>
            </div>

            <label for="billingAddress">Billing Address</label>
            <textarea id="billingAddress" name="billingAddress" rows="3" required></textarea>

            <!-- Hidden field to send selected payment method -->
            <input type="hidden" name="paymentMethodSelected" id="paymentMethodSelected">

            <button type="button" onclick="paymentStart()">Confirm Booking</button>
        </div>
    </div>
</form>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<script>
function togglePayment(method) {
    const cardSection = document.getElementById('cardSection');
    if (method === 'cash') {
        cardSection.style.display = 'none';
    } else {
        cardSection.style.display = 'block';
    }
}

const paymentStart = () => {
    const selectedMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
    const amount = document.querySelector("#amount").value;

    // Save selected method to hidden input
    document.getElementById("paymentMethodSelected").value = selectedMethod;

    if (!amount) {
        alert("Amount is required");
        return;
    }

    if (selectedMethod === "cash") {
        // Direct submit for cash method
        document.getElementById("paymentForm").submit();
        return;
    }

    // Else, card method: initiate Razorpay
    $.ajax({
        url: "/createOrder",
        data: JSON.stringify({ amount: amount, info: 'order_request' }),
        contentType: 'application/json',
        type: 'POST',
        dataType: 'json',
        success: function (response) {
            if (response.status == "created") {
                const options = {
                    key: "rzp_test_HYCG9XE3B6gozQ",
                    amount: response.amount,
                    currency: "INR",
                    name: "Payment Gateway Demo",
                    description: "Test Transaction",
                    image: "https://example.com/your_logo",
                    order_id: response.id,
                    handler: function (response) {
                        document.getElementById("paymentForm").submit();
                    },
                    prefill: {
                        name: "",
                        email: "",
                        contact: ""
                    },
                    theme: {
                        color: "#3399cc"
                    }
                };
                const rzp = new Razorpay(options);
                rzp.open();
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
}
</script>

</body>
</html>
