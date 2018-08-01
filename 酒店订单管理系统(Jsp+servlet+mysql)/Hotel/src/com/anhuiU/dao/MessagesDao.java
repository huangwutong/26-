package com.anhuiU.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.anhuiU.model.BaseModel;
import com.anhuiU.model.Messages;

public class MessagesDao extends BaseDao {

	
	public void add(BaseModel bm) {
		// TODO Auto-generated method stub
        Messages m=(Messages)bm;
        Connection con=ConnectionManage.getConnection();
        try {
			PreparedStatement ps=con.prepareStatement("insert into message values(default,?,?,now(),?)");
			ps.setString(1, m.getTopic());
			ps.setString(2, m.getContent());
			ps.setString(3, m.getType());
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

	}

	@Override
	public List select() {
		// TODO Auto-generated method stub
		List list=new ArrayList();
		Connection con=ConnectionManage.getConnection();
		try {
			Statement s=con.createStatement();
			ResultSet rs=s.executeQuery("select * from message");
			while(rs.next()){
				Messages mg=new Messages();
				mg.setId(rs.getInt("id"));
				mg.setTopic(rs.getString("topic"));
				mg.setContent(rs.getString("content"));
				mg.setDate(rs.getDate("dates"));
				mg.setType(rs.getString("type"));
				list.add(mg);
			}
			rs.close();
			s.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void update(BaseModel bm) {
		// TODO Auto-generated method stub

	}
     
	
	public void delete(int[] id) {
		// TODO Auto-generated method stub
		Connection con=ConnectionManage.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement("delete from message where id=?");
		    for (int i = 0; i < id.length; i++) {
				ps.setInt(1, id[i]);
				ps.addBatch();
			}
		    ps.executeBatch();
		    ps.close();
		    con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Messages selectById(int id){
		Connection con=ConnectionManage.getConnection();
		Messages mg=new Messages();
		try {
			PreparedStatement ps=con.prepareStatement("select * from message where id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				mg.setId(rs.getInt("id"));
				mg.setTopic(rs.getString("topic"));
				mg.setContent(rs.getString("content"));
				mg.setDate(rs.getDate("dates"));
				mg.setType(rs.getString("type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mg;
	}
	
	
	
}
