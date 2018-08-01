/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j.formbean;

import java.util.Date;

/**
 * 点对点消息对象
 * @author Liudong
 */
public class MessageForm extends DlogActionForm {
    
    public final static int STATUS_NEW = 0x00;  //新信息
    public final static int STATUS_READ = 0x01;	//已读
    public final static int STATUS_DELETE = 0x02;//已删除
    
    int id;
    UserForm fromUser;
    UserForm toUser;
    String content;
    Date sendTime;
    Date readTime;
    int status;
    int isHtml;

    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public UserForm getFromUser() {
        return fromUser;
    }
    public void setFromUser(UserForm fromUser) {
        this.fromUser = fromUser;
    }
    public Date getSendTime() {
        return sendTime;
    }
    public String getSendTimeOutput() {
        if(sendTime==null)
            return "[无发送时间]";
        return df1.format(sendTime);
    }
    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }
    public UserForm getToUser() {
        return toUser;
    }
    public void setToUser(UserForm toUser) {
        this.toUser = toUser;
    }
    public void setToUserId(int toUser) {
        if(this.toUser==null)
            this.toUser = new UserForm();
        this.toUser.setId(toUser);
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getIsHtml() {
        return isHtml;
    }
    public void setIsHtml(int isHtml) {
        this.isHtml = isHtml;
    }
    public Date getReadTime() {
        return readTime;
    }
    public void setReadTime(Date readTime) {
        this.readTime = readTime;
    }
}
