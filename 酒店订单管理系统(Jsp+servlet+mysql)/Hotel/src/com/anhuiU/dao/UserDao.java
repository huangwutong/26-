package com.anhuiU.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.UserDataHandler;

import com.anhuiU.model.BaseModel;
import com.anhuiU.model.User;


public class UserDao extends BaseDao {


	public void add(BaseModel bm) {
		// TODO Auto-generated method stub
        Connection con=ConnectionManage.getConnection();
        User user=(User)bm;
        try {
			PreparedStatement ps=con.prepareStatement("insert into user values(default,?,?,?,?,?,?,now(),?)");
			ps.setString(1,user.getUserName());
			ps.setInt(2, user.getSex());
			ps.setString(3, user.getTel());
			ps.setString(4, user.getPassword());
			ps.setString(5, user.getEmail());
			ps.setString(6, user.getName());
			ps.setInt(7, user.getJifen());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	public void delete(int id) {
		// TODO Auto-generated method stub
		Connection con=ConnectionManage.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("delete from user where userId=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	public List select() {
		// TODO Auto-generated method stub
		
		List<User> list = new ArrayList<User>();
		Connection con=ConnectionManage.getConnection();
		try {
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery("select * from user ");
			while(rs.next()){
				User user=new User();
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setName(rs.getString("name"));
				user.setJifen(rs.getInt("jifen"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getInt("sex"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				list.add(user);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}


	public void update(BaseModel bm) {
		// TODO Auto-generated method stub

	}
	
	public boolean selectByName(String name){
		Connection con=ConnectionManage.getConnection();
		boolean result=false;
		try {
			PreparedStatement ps=con.prepareStatement("select * from user where userName=?");
			ps.setString(1, name);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				result=true;
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	public User checkPwd(String name){
		Connection con=ConnectionManage.getConnection();
		String result=null;
		User user=new User();
		try {
			
			PreparedStatement ps=con.prepareStatement("select * from user where userName=?");
			ps.setString(1, name);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setName(rs.getString("name"));
				user.setJifen(rs.getInt("jifen"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getInt("sex"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
							
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	
	public User selectById(int id){
		Connection con=ConnectionManage.getConnection();
		User user=new User();
		try {
			PreparedStatement ps=con.prepareStatement("select * from user where userId=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				user.setUserId(rs.getInt("userId"));
				user.setUserName(rs.getString("userName"));
				user.setName(rs.getString("name"));
				user.setJifen(rs.getInt("jifen"));
				user.setPassword(rs.getString("password"));
				user.setSex(rs.getInt("sex"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));
				user.setRegDate(rs.getString("regDate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		
	}
	
	
	
	

}
