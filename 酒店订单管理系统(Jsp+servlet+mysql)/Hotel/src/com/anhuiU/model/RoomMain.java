package com.anhuiU.model;

public class RoomMain extends BaseModel{
      private String roomId;
      private String roomType;
      private double roomPrice;
      private int roomNum;
      private int leftRoom;
		public String getRoomId() {
			return roomId;
		}
		public void setRoomId(String roomId) {
			this.roomId = roomId;
		}
		public String getRoomType() {
			return roomType;
		}
		public void setRoomType(String roomType) {
			this.roomType = roomType;
		}
		public double getRoomPrice() {
			return roomPrice;
		}
		public void setRoomPrice(double roomPrice) {
			this.roomPrice = roomPrice;
		}
		
		public int getRoomNum() {
			return roomNum;
		}
		public void setRoomNum(int roomNum) {
			this.roomNum = roomNum;
		}
		public int getLeftRoom() {
			return leftRoom;
		}
		public void setLeftRoom(int leftRoom) {
			this.leftRoom = leftRoom;
		}
}
