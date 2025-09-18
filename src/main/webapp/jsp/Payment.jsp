<%@page import="com.example.demo.bean.HotelRoomList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Room Booking</title>
<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
  <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
	<input type="text" id="amount">
<%HotelRoomList hr = (HotelRoomList)session.getAttribute("roomdetail"); %>

    <button onclick="paymentStart()">Pay</button>
</body>
<script>
  
  const paymentStart=()=>{
	  console.log("HII");
	  
	  let amount=document.querySelector("#amount").value;
	  console.log(amount);
	  if(amount=='' || amount==null){
		  alert("amount required");
		  return;
	  }
	 
	  $.ajax({
		  url:"/createOrder",
		  data:JSON.stringify({amount:amount,info:'order_request'}),
		  contentType:'application/json',
		  type:'POST',
		  dataType:'json',
		  success:function(response){
			  console.log("Hello");
			  console.log(response);
			  if(response.status=="created"){
				  var options = {
						  key: "rzp_test_HYCG9XE3B6gozQ", // Enter the Key ID generated from the Dashboard
						  amount: response.amount, // Amount is in currency subunits. Default currency is
						 
						  currency: "INR",
						  name: "Payment Gateway Demo",
						  description: "Test Transaction",
						  image: "https://example.com/your_logo",
						  order_id: response.id,
						 
						  handler: function (response){
						  console.log(response.razorpay_payment_id);
						  console.log(response.razorpay_order_id);
						  console.log(response.razorpay_signature);
						  alert("Payment Successful");
						  },
						  
						  prefill: {
						  name: "",
						  email: "",
						  contact: ""
						  },
						 
						  note: {
						  "address": "Satara"

						  },
						 
						  theme: {
						  color: "#3399cc"
						  }
						  };
						 
				          var rzp = new Razorpay(options);
						  
						  rzp.open();
						 
			  
		  }
		  },
		  error:function(error){
			  console.log(error);
		  }
		  
	  })
	  
  } 
</script>
