package com.anhuiU.model;

import java.util.Date;



public class Messages extends BaseModel{
       private int id;
       private String topic;
       private String content;
       private Date date;
       private String type;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getTopic() {
			return topic;
		}
		public void setTopic(String topic) {
			this.topic = topic;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}  
}
