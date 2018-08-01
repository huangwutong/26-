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
package dlog4j.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 * 用户转换工具
 * 用于将asp版的数据导入到新的数据库结构中的工具基类
 * @author liudong
 */
public class Transfer {
	
	public static void main(String[] args) throws SQLException {
		transfer_reply();
	}

	public static void transfer_reply() throws SQLException{
		Connection conn = getNewConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "INSERT INTO dlog_journal(logid,catid,siteid,userid,author,author_url,title,content,logtime,weather,useFace,useUbb,showFormerly,status,viewcount,replycount,moodlevel) VALUES(?,2,1,?,?,?,?,?,?,'sunny',1,1,0,0,?,?,3)";
		try{
			//1.读出所有评论
			ps = conn.prepareStatement("SELECT * FROM log_r");
			rs = ps.executeQuery();
			while(rs.next()){
				int r_id = rs.getInt("log_r_id");
				int old_logid = rs.getInt("log_id");
				String old_user = rs.getString("log_r_author");
				String face = rs.getString("log_r_face");
				face = "faces" + face.substring(4);
				String content = rs.getString("log_r_content");
				Timestamp wt = rs.getTimestamp("r_written_time");
				int userid = getUserId(old_user);
				int logid = getNewLogId(r_id);
				if(logid==-1)
					continue;
				//System.out.println(r_id + " = " + logid);
				
				try{
					insertReply(userid,logid,face,content,wt);
					System.out.println("reply:"+content+" inserted.");
				}catch(Exception e){
					System.out.println("reply:"+content+" failed.");
				}
			}
			//2.获取该评论者现在的userid
			//3.获取该评论对应现在的logid
			//4.插入新的表中
		}finally{
			conn.close();
		}
	}
	
	protected static int insertReply(int userid,int logid,String face,String content,Timestamp t) throws SQLException{

		Connection conn = getNewConn();
		PreparedStatement ps = null;
		try{
			//1.读出所有评论
			ps = conn.prepareStatement("INSERT INTO dlog_reply VALUES(?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, r_id++);
			ps.setInt(2,1);
			ps.setInt(3, userid);
			ps.setInt(4, logid);
			ps.setString(5, face);
			ps.setString(6, content);
			ps.setInt(7, 1);
			ps.setInt(8, 0);
			ps.setInt(9, 0);
			ps.setTimestamp(10, t);
			return ps.executeUpdate();
		}finally{
			ps.close();
			conn.close();
		}		
	}
	
	static int r_id = 1;
	
	public static int getNewLogId(int old_log_id) throws SQLException{
		int new_log_id = -1;
		Connection conn = getNewConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			//1.读出所有评论
			ps = conn.prepareStatement("select l.logid from dlog_journal l, log ol,log_r r where r.log_id=ol.log_id and ol.log_tittle=l.title and ol.log_content=l.content and ol.written_time=l.logtime and r.log_r_id=?");
			ps.setInt(1, old_log_id);
			rs = ps.executeQuery();
			if(rs.next())
				new_log_id = rs.getInt("logid");			
		}finally{
			rs.close();
			ps.close();
			conn.close();
		}		
		return new_log_id;
	}

	public static int getUserId(String username) throws SQLException{
		int userid= 3;
		Connection conn = getNewConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			//1.读出所有评论
			ps = conn.prepareStatement("SELECT userid FROM dlog_user WHERE username=?");
			ps.setString(1, username);
			rs = ps.executeQuery();
			if(rs.next())
				userid = rs.getInt("userid");			
		}finally{
			rs.close();
			ps.close();
			conn.close();
		}		
		return userid;
	}
	
	public static void transfer_log() throws SQLException{
		Connection conn1 = getOldConn();
		Connection conn2 = getNewConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "INSERT INTO dlog_journal(logid,catid,siteid,userid,author,author_url,title,content,logtime,weather,useFace,useUbb,showFormerly,status,viewcount,replycount,moodlevel) VALUES(?,2,1,?,?,?,?,?,?,'sunny',1,1,0,0,?,?,3)";
		try{
			ps = conn1.prepareStatement("SELECT * FROM log WHERE cat_id=5 order by log_id");
			rs = ps.executeQuery();
			int logid = 3;
			while(rs.next()){
				String user = rs.getString("log_author");
				String title = rs.getString("log_tittle");
				String content = rs.getString("log_content");
				Timestamp writeTime = rs.getTimestamp("written_Time");
				int vcount = rs.getInt("lv_count");
				int rcount = rs.getInt("lr_count");
				String author = rs.getString("author");
				String author_url = rs.getString("author_url");
				PreparedStatement ps2 = conn2.prepareStatement(sql);
				ps2.setInt(1, logid++);
				if("YY".equals(user))
					ps2.setInt(2, 6);
				else
					ps2.setInt(2, 9);
				ps2.setString(3, author);
				ps2.setString(4, author_url);
				ps2.setString(5, title);
				ps2.setString(6, content);
				ps2.setTimestamp(7, writeTime);
				ps2.setInt(8, vcount);
				ps2.setInt(9, rcount);
				ps2.executeUpdate();
				System.out.println("log " + title+ " transfered.");
			}
		}finally{
			conn1.close();
			conn2.close();
		}
	}
	
	public static void test_connection(String[] args) throws SQLException {
		Connection conn = getOldConn();
		conn.close();
		System.out.println("测试旧版数据库连接成功.");
		conn = getNewConn();
		conn.close();
		System.out.println("测试新版数据库连接成功.");
	}
		
	/**
	 * 用户转换
	 * @throws SQLException
	 */
	public static void transfer_user() throws SQLException {
		
		Connection conn1 = getOldConn();
		Connection conn2 = getNewConn();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "INSERT INTO dlog_user(userid,siteid,username,password,displayName,email,homepage,resume,regtime,userrole) VALUES(?,1,?,?,?,?,?,?,?,2)";
		try{
			ps = conn1.prepareStatement("SELECT * FROM user_mdb WHERE username<>'admin'");
			rs = ps.executeQuery();
			int userid = 2;
			while(rs.next()){
				String name = rs.getString("username");
				String password = "ACEB1D8E96AB2739";
				String email = rs.getString("email");
				String home = rs.getString("homepage");
				String demo = rs.getString("underwrite");
				Timestamp regTime = rs.getTimestamp("reg_Time");
				PreparedStatement ps2 = conn2.prepareStatement(sql);
				ps2.setInt(1, userid++);
				ps2.setString(2, name);
				ps2.setString(3, password);
				ps2.setString(4, name);
				ps2.setString(5, email);
				ps2.setString(6, home);
				ps2.setString(7, demo);
				ps2.setTimestamp(8, regTime);
				ps2.executeUpdate();
				System.out.println("User " + name+ " transfered.");
			}
		}finally{
			conn1.close();
			conn2.close();
		}
	}
	
	public static Connection getConnection(String ds) throws SQLException{
		return DriverManager.getConnection("jdbc:odbc:"+ds);
	}
	public static Connection getNewConn() throws SQLException{
		return getConnection("mydlog");
	}
	public static Connection getOldConn() throws SQLException{
		return getConnection("mydlog_old");
	}
	static{
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		}catch(Exception e){}
	}
}
