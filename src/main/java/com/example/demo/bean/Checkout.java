package com.example.demo.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Checkout {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ID;
	private String name;
    private String email;
    private String phone;

    // Room Details
    private String roomType;
    private String roomSize;
    private String pricePerNight;

    // Booking Details
    private String guests;
    private String roomsBooked;
    private String checkIn;
    private String checkOut;
    private String totalNights;
    private String totalAmount;
    private String paymentMethodcash;  // "card" or "cash"
    private String paymentMethodcard;
    private String cardHolderName;
    private String cardNumber;
    private String expiryDate;
    private String cvv;
    private String billingAddress;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getRoomSize() {
		return roomSize;
	}
	public void setRoomSize(String roomSize) {
		this.roomSize = roomSize;
	}
	public String getPricePerNight() {
		return pricePerNight;
	}
	public void setPricePerNight(String pricePerNight) {
		this.pricePerNight = pricePerNight;
	}
	public String getGuests() {
		return guests;
	}
	public void setGuests(String guests) {
		this.guests = guests;
	}
	public String getRoomsBooked() {
		return roomsBooked;
	}
	public void setRoomsBooked(String roomsBooked) {
		this.roomsBooked = roomsBooked;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public String getTotalNights() {
		return totalNights;
	}
	public void setTotalNights(String totalNights) {
		this.totalNights = totalNights;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getPaymentMethodcash() {
		return paymentMethodcash;
	}
	public void setPaymentMethodcash(String paymentMethodcash) {
		this.paymentMethodcash = paymentMethodcash;
	}
	public String getPaymentMethodcard() {
		return paymentMethodcard;
	}
	public void setPaymentMethodcard(String paymentMethodcard) {
		this.paymentMethodcard = paymentMethodcard;
	}
	public String getCardHolderName() {
		return cardHolderName;
	}
	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getCvv() {
		return cvv;
	}
	public void setCvv(String cvv) {
		this.cvv = cvv;
	}
	public String getBillingAddress() {
		return billingAddress;
	}
	public void setBillingAddress(String billingAddress) {
		this.billingAddress = billingAddress;
	}
	
    
}
