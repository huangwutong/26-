package com.anhuiU.model;

public class User extends BaseModel {
         private int userId;
         private String userName;
         private String name;
         private String tel;
         private int sex;
         private String email;
         private String password;
         private int jifen;
         private String regDate;
		public int getUserId() {
			return userId;
		}
		public void setUserId(int userId) {
			this.userId = userId;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public int getSex() {
			return sex;
		}
		public void setSex(int sex) {
			this.sex = sex;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public int getJifen() {
			return jifen;
		}
		public void setJifen(int jifen) {
			this.jifen = jifen;
		}
		public String getRegDate() {
			return regDate;
		}
		public void setRegDate(String regDate) {
			this.regDate = regDate;
		}
}
