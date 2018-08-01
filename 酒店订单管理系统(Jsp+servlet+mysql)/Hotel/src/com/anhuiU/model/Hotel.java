package com.anhuiU.model;

public class Hotel extends BaseModel{
       private int hotelId;
       private String hotelName;
       private int hotelLevel;
       private int totalRoomNum;
       private int leftRoomNum;
       private int addressId;
       private String address;
       private String info;
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public int getHotelLevel() {
		return hotelLevel;
	}
	public void setHotelLevel(int hotelLevel) {
		this.hotelLevel = hotelLevel;
	}
	public int getTotalRoomNum() {
		return totalRoomNum;
	}
	public void setTotalRoomNum(int totalRoomNum) {
		this.totalRoomNum = totalRoomNum;
	}
	public int getLeftRoomNum() {
		return leftRoomNum;
	}
	public void setLeftRoomNum(int leftRoomNum) {
		this.leftRoomNum = leftRoomNum;
	}
	public int getAddressId() {
		return addressId;
	}
	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
}
