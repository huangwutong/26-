package com.anhuiU.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import java.sql.DriverManager;



public class ConnectionManage {
	public static Connection getConnection(){
		Connection con=null;
		try {
			Class.forName("org.gjt.mm.mysql.Driver");
			try {
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?useUnicode=true&characterEncoding=GBK","root","root");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
    
	
	
	public static void stmtClose(Statement stmt) {
		// TODO Auto-generated method stub
		if(stmt !=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				
			}
		}
	}

	

	public static void rsClose(ResultSet rs) {
		// TODO Auto-generated method stub
		if(rs !=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
			
			}
		}
	}
}
