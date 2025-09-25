package com.example.demo.controller;

import java.util.Map;
import java.util.Optional;
import java.util.Random;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.bean.BookingRegistrationBean;
import com.example.demo.bean.Checkout;
import com.example.demo.bean.HotelRoomList;
import com.example.demo.bean.SelectDate;
import com.example.demo.dao.BookingWebDao;
import com.example.demo.dao.CheckoutDao;
import com.example.demo.dao.HotelRoomListDao;
import com.example.demo.dao.SelectDateDao;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpSession;


@Controller
public class BookingWebController {

	@Autowired
	HotelRoomListDao hrd;

	@Autowired
	BookingWebDao bd;
	
	@Autowired
	SelectDateDao sd;
	
	@Autowired
	CheckoutDao cd;
	
	@Autowired
	JavaMailSender javamailSender;
	
	
	
	@RequestMapping("/index")
	public String Home(){
		return "index";
		
	}
	@RequestMapping("/about_us")
	public String about_us(){
		return "about_us";
		
	}
	@RequestMapping("/blog")
	public String blog(){
		return "blog";
		
	}
	@RequestMapping("/blog_details")
	public String blog_details(){
		return "blog_details";
		
	}
	@RequestMapping("/contact")
	public String contact(){
		return "contact";
		
	}
	@RequestMapping("/main")
	public String main(){
		return "main";
		
	}
	//Details of Room Bookings
	@RequestMapping("/confirmBooking")
	public String bookingsr(Checkout ck,HttpSession session){
		cd.save(ck);
		return "redirect:showbooking";
	}
	@RequestMapping("/showbooking")
	public String showbooking(HttpSession session) {
		 session.setAttribute("list", cd.findAll());
		return "bookings";
		
	}
	 @RequestMapping("/updatebooking")
	 String updatebooking(Checkout ck,HttpSession session) {
		 Optional<Checkout>op=cd.findById(ck.getID());
		 Checkout c = op.get();
		 session.setAttribute("updatregistration", c);
		return "updatebooking";
		 
	 }
	 
	 
	 
		@RequestMapping("/updatebookingdata")
		String updatebookingdata(Checkout ck, HttpSession session) {
			
		Optional<Checkout>op=cd.findById(ck.getID());
		Checkout c = op.get();
		c.setName(ck.getName());
		c.setEmail(ck.getEmail());
		c.setPhone(ck.getPhone());
		c.setRoomType(ck.getRoomType());
		c.setRoomSize(ck.getRoomSize());
		c.setGuests(ck.getGuests());
		c.setRoomsBooked(ck.getRoomsBooked());
		c.setCheckIn(ck.getCheckIn());
		c.setCheckOut(ck.getCheckOut());
		c.setPricePerNight(ck.getPricePerNight());
		c.setTotalNights(ck.getTotalNights());
		c.setTotalAmount(ck.getTotalAmount());
		c.setPaymentMethodcash(ck.getPaymentMethodcash());
		c.setPaymentMethodcard(ck.getPaymentMethodcard());
		c.setCardHolderName(ck.getCardHolderName());
		c.setCardNumber(ck.getCardNumber());
		c.setExpiryDate(ck.getExpiryDate());
		c.setCvv(ck.getCvv());
		c.setBillingAddress(ck.getBillingAddress());
		if(c.getPaymentMethodcash().equals(ck.getPaymentMethodcash())) {
			c.setBillingAddress(ck.getBillingAddress());
			cd.save(ck);
			return "redirect:showregister";
		}
		else {
			return"Error";
		}
		}
	//Details of Room Date checking
	 @RequestMapping("/Datecheck")
	 String Datecheck(SelectDate sb,HttpSession session,int id) {
		sd.save(sb);
		session.setAttribute("id",id );
		Optional<SelectDate> op=sd.findById(sb.getID());
		 SelectDate h = op.get();
			session.setAttribute("dates", h);
			
			
			
			return "redirect:checkoutpage";
			
		}
	
	@RequestMapping("/rooms")
	public String rooms(HttpSession session){
		session.setAttribute("list", hrd.findAll());
		return "rooms";
		
	}
	@RequestMapping("/rooms_details")
	public String rooms_details(){
		
		return "rooms_details";
		
	}
	 @RequestMapping("/roombooking")
		public String roombooking(HotelRoomList hr, HttpSession session){
		 Optional<HotelRoomList>op=hrd.findById(hr.getID());
		 HotelRoomList h = op.get();
			session.setAttribute("roomdetail", h);
			return "room_details";
			
		}
	@RequestMapping("/Login")
	public String Login(){
		return "Login";	
	}
	
	@RequestMapping("/checkoutpage")
	public String checkoutpage(HotelRoomList hr, HttpSession session){
		System.out.println("IN CHECKOUT");
		System.out.println(session.getAttribute("id"));
		if(session.getAttribute("id")!=null) {
		int id=(Integer)session.getAttribute("id");
		hr.setID(id);
		}
		Optional<HotelRoomList>op=hrd.findById(hr.getID());
		HotelRoomList h = op.get();
		for(SelectDate s:sd.findAll()) {
			System.out.println(s.getType());
			if(h.getType().equals(s.getType().trim())) {
				System.out.println("in if");
				session.setAttribute("dates", s);
				System.out.println(s.getCheck_In());
				session.setAttribute("roomdetail", h);
		

			}
		}
		
		return "checkout";
		
	}
	//Remove Bookings 
	 @RequestMapping("/removebooking")
	 String removebooking(Checkout ck) {
		 cd.deleteById(ck.getID());
		return "redirect:showbooking";
		 
	 }
	
	
	@RequestMapping("/loginerror")
	public String loginerror(){
		return "loginerror";
		
	}
	
	@RequestMapping("/loginData")
	public String loginData(BookingRegistrationBean br,HttpSession session) {
		
		for(BookingRegistrationBean b:bd.findAll()) {
			if(br.getEmail().equals(b.getEmail())&& br.getPassword().equals(b.getPassword())) {
				session.setAttribute("User", b);
				return "redirect:index";
			}
			if(br.getEmail().equals("sb@gmail.com")&& br.getPassword().equals("123")) {
				return "admin";
			}
		}
		return "loginerror";
	}
	@RequestMapping("/registration")
	public String registration(){
		return "registration";
		
	}
	@RequestMapping("/show")
	public String show(){
		return "show";
		
	}
	@RequestMapping("/admin")
	public String admin(HttpSession session){
		session.setAttribute("list", hrd.findAll());
		return "admin";
		
	}
	
	
	@RequestMapping("/ForgotPassword")
	public String ForgotPassword(){
		return "ForgotPassword";	
	}
	
	//Details of Svae Registration
	@RequestMapping("/saveregister")
	 String saveregister(BookingRegistrationBean br) {
		 if(br.getPassword().equals(br.getConfirmpassword())) {
			 for(BookingRegistrationBean b:bd.findAll()) {
				 if(b.getEmail().equals(br.getEmail())) {
					 return "Login";
				 }
			 }
		     bd.save(br);
		     return "show";
		 } else {
			 return "Error";
		 }
	}

	 @RequestMapping("/showregister")
	  String showregister(HttpSession session) {
		 session.setAttribute("list", bd.findAll());
		 session.setAttribute("email", bd.findAll());
		return "showregistration";
	 }
	
	//Details of Delete Registration
	 @RequestMapping("/deletedata")
	 String deletedata(BookingRegistrationBean br) {
		 bd.deleteById(br.getId());
		return "redirect:showregister";
		 
	 }

	
	 
	 @RequestMapping("/update")
	 String update(BookingRegistrationBean br,HttpSession session) {
		 Optional<BookingRegistrationBean>op=bd.findById(br.getId());
		 BookingRegistrationBean b = op.get();
		 session.setAttribute("updatregistration", b);
		return "updateregistrationform";
		 
	 }
	 
	 
	 
		@RequestMapping("/updatedata")
		String updatedata(BookingRegistrationBean br, HttpSession session) {
			
		Optional<BookingRegistrationBean>op=bd.findById(br.getId());
		BookingRegistrationBean b = op.get();
		b.setName(br.getName());
		b.setEmail(br.getEmail());
		b.setPhone(br.getPhone());
		b.setGender(br.getGender());
		b.setPassword(br.getPassword());
		b.setConfirmpassword(br.getConfirmpassword());
		if(br.getPassword().equals(br.getConfirmpassword())) {
			bd.save(br);
			return "redirect:showregister";
		}
		else {
			return"Error";
		}
		}
		@RequestMapping("/hotelList")
		public String hotelList() {
			return"hotelList";
		}
		 @RequestMapping("/hotelbooking")
		 String hotelbooking(HotelRoomList hr) {
			hrd.save(hr);
			return "show";
			 
		}
		 @RequestMapping("/showhotelList")
		  String showhotelList(HttpSession session) {
			 session.setAttribute("list", hrd.findAll());
			return "admin";
		 }
		 @RequestMapping("/deleteroom")
		 String deleteroom(HotelRoomList hr) {
			 hrd.deleteById(hr.getID());
			return "redirect:showhotelList";
			 
		 }
		 
		 @RequestMapping("/updateroom")
		 String updateroom(HotelRoomList hr,HttpSession session) {
			 Optional<HotelRoomList>op=hrd.findById(hr.getID());
			 HotelRoomList b = op.get();
			 session.setAttribute("updatroom", b);
			return "UpdateHotelRooms";
			 
		 }
		 
		 
		 
			@RequestMapping("/updateroomdata")
			String updateroomdata(HotelRoomList hr, HttpSession session) {
				System.out.println("update");
			Optional<HotelRoomList>op=hrd.findById(hr.getID());
			
			HotelRoomList b = op.get();
			if(b.getImage().isEmpty()) {
				b.setImage(b.getImage());
			}else {
			b.setImage(hr.getImage());
			}
			b.setType(hr.getType());
			b.setPrice(hr.getPrice());
			b.setSize(hr.getSize());
			b.setCapacity(hr.getCapacity());
			b.setStatus(hr.getStatus());
			b.setServices(hr.getServices());
							hrd.save(hr);
				return "redirect:showhotelList";
			
			
			}

		 
		 
		 
		 
		 
		 
		 
		 
		 @RequestMapping("/enteremail")
			public String enteremail() {
				return"enteremail";
			}
		 
		@RequestMapping("otp")
		public String otp(BookingRegistrationBean br,HttpSession session) {
			boolean userexist = true;
			for (BookingRegistrationBean s :  bd.findAll()) {
				
				if(s.getEmail().equals(br.getEmail())) {
					Random random = new Random();
					int otp = 100000+random.nextInt(999999);
					session.setAttribute("email", s.getEmail());
					session.setAttribute("otp", otp);
					String name=s.getName();
					MimeMessage message = javamailSender.createMimeMessage();
				    try {
						MimeMessageHelper helper = new MimeMessageHelper(message, true);
						
						// Set email details
					    helper.setFrom("biramanesushant94@gmail.com");
					    helper.setTo(br.getEmail());
						
					 // Set email details
					  
					    String htmlContent = "<!DOCTYPE html>"
					    	    + "<html>"
					    	    + "<head>"
					    	    + "<style>"
					    	    + "body { font-family: 'Arial', sans-serif; background-color: #f2f7ff; color: #333; margin: 0; padding: 0; }"
					    	    + ".email-container { max-width: 650px; margin: 20px auto; background: #ffffff; border-radius: 15px; box-shadow: 0 6px 20px rgba(0,0,0,0.15); overflow: hidden; border: 1px solid #e0e0e0; }"
					    	    + ".header { background: linear-gradient(135deg, #ff7a59, #ffb847); color: #ffffff; padding: 25px; text-align: center; font-size: 28px; font-weight: bold; text-transform: uppercase; }"
					    	    + ".content { padding: 30px; font-size: 17px; line-height: 1.8; color: #555; }"
					    	    + ".footer { background: #f8f9fc; color: #666; padding: 20px; text-align: center; font-size: 15px; border-top: 1px solid #e0e0e0; }"
					    	    + ".button { background: linear-gradient(135deg, #4caf50, #81c784); color: #ffffff; padding: 15px 30px; text-decoration: none; border-radius: 30px; font-size: 18px; font-weight: bold; display: inline-block; margin-top: 20px; transition: all 0.3s ease-in-out; }"
					    	    + ".button:hover { background: linear-gradient(135deg, #81c784, #4caf50); transform: translateY(-3px); }"
					    	    + "a { color: #4caf50; text-decoration: none; }"
					    	    + "a:hover { text-decoration: underline; }"
					    	    + "p { margin: 20px 0; }"
					    	    + "</style>"
					    	    + "</head>"
					    	    + "<body>"
					    	    + "<div class='email-container'>"
					    	    + "  <div class='header'>Hiii Sushant please dont share otp</div>"
					    	    + "  <div class='content'>"
					    	    + "    <p>Dear " + name + ",</p>"
					    	    + "    <p>Your otp"+otp+"</p>"
					    	  
					    	    + "  </div>"
					    	    + "  <div class='footer'>"
					    	    + "    <p>Organic fruit &copy; 2024. All rights reserved.</p>"
					    	    + "    <p><a href='#'>Unsubscribe</a> | <a href='#'>Contact Us</a></p>"
					    	    + "  </div>"
					    	    + "</div>"
					    	    + "</body>"
					    	    + "</html>";
					    
					    // Set the email content as HTML
					    helper.setText(htmlContent, true);

					    // Send the email
					    javamailSender.send(message);

					    // Print success message
					    System.out.println("Email sent successfully!");
					    
					    
					} catch (MessagingException e) {
						System.out.println("Failed to send email: " + e.getMessage());
					    e.printStackTrace();
						
					}
				    return "otp";

				}else {
					userexist=false; 
					
				}
			}
			if (userexist==false) {
				System.out.println("User Not Found");
			}
			return "enteremail";
			
		}
		@RequestMapping("/submitotp")
		public String submitotp(int otp1,int otp2, int otp3, int otp4, int otp5, int otp6,HttpSession session) {
			int genereted = (Integer) session.getAttribute("otp");
			String o = otp1+""+otp2+""+otp3+""+otp4+""+otp5+""+otp6;
			int otp = Integer.parseInt(o);
			if (otp == genereted) {
				System.out.println("otp match");
				return"setpassword";
			}else {
				System.out.println("otp does not match");
				return"otp";
			}
			
		}

		@RequestMapping("/setpassword")
		public String setpassword(String password, String Confirmpassword,HttpSession session) {
			String email = (String)session.getAttribute("email"); 
			if (password.equals(Confirmpassword)) {
				for (BookingRegistrationBean s:bd.findAll()) {
					if (s.getEmail().equals(email)) {
						Optional<BookingRegistrationBean> op = bd.findById(s.getId());
						BookingRegistrationBean s1 = op.get();
						s1.setPassword(password);
						s1.setConfirmpassword(Confirmpassword);
						bd.save(s1);
					}
				}
			}else {
				System.out.println("Password Does Not Match");
				return"setpassword";
			}
			return"redirect:Login";
			
		}
		
		@RequestMapping("/checkAvailability")
		public String checkAvailability(Checkout c) {
			
			for(Checkout c1:cd.findAll()) {
				
				int Room=Integer.parseInt(c.getRoomsBooked());
				if(c.getCheckIn().equals(c1.getCheckIn())&& Room>2) {
					
					System.out.println("Not Available");
					return "index";
					
				}
			}
			
			
			return "redirect:rooms";
		   
		}
		@RequestMapping("/bookingPayment")
		public String bookingPayment() {
			return "bookingPayment";
		}
	 
		@PostMapping("/createOrder")
		@ResponseBody
		public String create_order(@RequestBody Map<String, Object> data,HttpSession session) throws Exception {


			System.out.println(data);
			int amt=Integer.parseInt(data.get("amount").toString());
			
				var client=new RazorpayClient("rzp_test_HYCG9XE3B6gozQ","7BySOPI6P2G2Gihg9tUGfrEz");
				JSONObject obj=new JSONObject();
				obj.put("amount", amt*100);
				obj.put("currency", "INR");
				obj.put("receipt", "txn_235425");
				
				Order order=client.orders.create(obj);
				System.out.println(order);
				
				
				return order.toString();
			
		}
		
		@RequestMapping("/Payment")
		public String Payment() {
			return "Payment";
			
		}
}

