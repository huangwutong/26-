package com.anhuiU.model;

import java.util.Date;

public class Order extends BaseModel{
            private int id;
            private int orderId;
            private  int addressId;
            private String roomType;
            private int roomNum;
            private Date inTime;
            private Date outTime;
			public int getId() {
				return id;
			}
			public void setId(int id) {
				this.id = id;
			}
			public int getOrderId() {
				return orderId;
			}
			public void setOrderId(int orderId) {
				this.orderId = orderId;
			}
			public int getAddressId() {
				return addressId;
			}
			public void setAddressId(int addressId) {
				this.addressId = addressId;
			}
			public String getRoomType() {
				return roomType;
			}
			public void setRoomType(String roomType) {
				this.roomType = roomType;
			}
			public int getRoomNum() {
				return roomNum;
			}
			public void setRoomNum(int roomNum) {
				this.roomNum = roomNum;
			}
			public Date getInTime() {
				return inTime;
			}
			public void setInTime(Date inTime) {
				this.inTime = inTime;
			}
			public Date getOutTime() {
				return outTime;
			}
			public void setOutTime(Date outTime) {
				this.outTime = outTime;
			}
}
