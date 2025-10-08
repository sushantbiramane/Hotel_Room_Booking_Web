<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/admin.css" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            padding: 20px;
        }
        .update-form {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .update-form h2 {
            margin-bottom: 20px;
            color: #2c3e50;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: 600;
            display: block;
            margin-bottom: 6px;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #21618c;
        }
    </style>
</head>
<body>
    <form class="update-form" action="updateBooking" method="post">
        <h2>Update Booking</h2>

        <div class="form-group">
            <label for="name">Name:</label>
            <input name="name" value="Vijay" required />
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input name="email" value="vijay@gmail.com" required />
        </div>

        <div class="form-group">
            <label for="phone">Phone:</label>
            <input name="phone" value="9405110549" required />
        </div>

        <div class="form-group">
            <label for="roomType">Room Type:</label>
            <select name="roomType">
                <option selected>Deluxe Room</option>
                <option>Standard Room</option>
                <option>Suite</option>
            </select>
        </div>

        <div class="form-group">
            <label for="roomSize">Room Size:</label>
            <input name="roomSize" value="30 ft" />
        </div>

        <div class="form-group">
            <label for="guests">Guests:</label>
            <input type="number" name="guests" value="1" />
        </div>

        <div class="form-group">
            <label for="rooms">Rooms:</label>
            <input type="number" name="rooms" value="2" />
        </div>

        <div class="form-group">
            <label for="checkIn">Check-in:</label>
            <input type="text" name="checkIn" value="14 July, 2025" />
        </div>

        <div class="form-group">
            <label for="checkOut">Check-out:</label>
            <input type="text" name="checkOut" value="15 July, 2025" />
        </div>

        <div class="form-group">
            <label for="price">Price/Night:</label>
            <input name="price" value="159$/Pernight" />
        </div>

        <div class="form-group">
            <label for="nights">Nights:</label>
            <input type="number" name="nights" value="3" />
        </div>

        <div class="form-group">
            <label for="total">Total:</label>
            <input name="total" value="159$/Pernight * 3 * 2" />
        </div>

        <div class="form-group">
            <label for="payment">Payment:</label>
            <select name="payment">
                <option selected>Cash</option>
                <option>Card</option>
            </select>
        </div>

        <div class="form-group">
            <label for="cardName">Card Name:</label>
            <input name="cardName" />
        </div>

        <div class="form-group">
            <label for="cardNo">Card No:</label>
            <input name="cardNo" />
        </div>

        <div class="form-group">
            <label for="expiry">Expiry:</label>
            <input name="expiry" />
        </div>

        <div class="form-group">
            <label for="cvv">CVV:</label>
            <input name="cvv" />
        </div>

        <div class="form-group">
            <label for="address">Address:</label>
            <textarea name="address" rows="3">M.P. Mhate bk , Taluka-Jaoli,District-Satara Medha</textarea>
        </div>

        <button type="submit">Update Booking</button>
    </form>
</body>
</html>