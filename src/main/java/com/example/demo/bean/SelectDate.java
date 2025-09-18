package com.example.demo.bean;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class SelectDate {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int  ID;
	
	private String Check_In;
	private String Check_Out;
	private String Guests;
	private String Room;
	private String Type;
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	
	
	public String getCheck_In() {
		return Check_In;
	}
	public void setCheck_In(String check_In) {
		Check_In = check_In;
	}
	public String getCheck_Out() {
		return Check_Out;
	}
	public void setCheck_Out(String check_Out) {
		Check_Out = check_Out;
	}
	public String getGuests() {
		return Guests;
	}
	public void setGuests(String guests) {
		Guests = guests;
	}
	public String getRoom() {
		return Room;
	}
	public void setRoom(String room) {
		Room = room;
	}	
	
}
