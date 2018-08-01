package com.anhuiU.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.anhuiU.model.BaseModel;
import com.anhuiU.model.Rooms;

public class RoomDao extends BaseDao {

	@Override
	public void add(BaseModel bm) {
		// TODO Auto-generated method stub
           Rooms r=(Rooms)bm;
           
           Connection con=ConnectionManage.getConnection();
           
           try {
			PreparedStatement ps=con.prepareStatement("insert into rooms value(default,?,?,?,?,?)");
			ps.setString(1, r.getNum());
			ps.setInt(2, r.getRoomType());
			ps.setDouble(3, r.getRoomPrice());
			ps.setString(5, r.getState());
			ps.setString(4, r.getImg());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List select() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(BaseModel bm) {
		// TODO Auto-generated method stub

	}

}
