package com.uitils;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.anhuiU.dao.ConnectionManage;

import java.sql.ResultSetMetaData;





public class PageBeanDao {
	private static final String Convert = null;

	/**
	 * 
	 * @return 返回共有多少条记录
	 */
	public  PageBean getsumSava(String tableName){	
		
		 Connection conn=ConnectionManage.getConnection();
		
		Statement stmt=null;		
		PageBean pb=new PageBean();
		
		try {
			stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select count(*) from  "+tableName+"");
			while(rs.next()){				
				pb.setSumSava(rs.getInt("count(*)"));		
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{	
			ConnectionManage.stmtClose(stmt);

			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}		
		return pb;
		
	}
	/**
	 * 
	 * @param sumSava 需要共有多少记录
	 * @return 总的页数
	 */
	public PageBean getCountPage(int sumSava){
		PageBean pb=new PageBean();
	
		
		if(sumSava%pb.getPageRow()>0){
			pb.setSumPage(sumSava/pb.getPageRow()+1);
		}else{
			pb.setSumPage(sumSava/pb.getPageRow());
		}
		return pb;
	}
	public PageBean getPageRowSava(int thisPage,String tableName){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		PageBean pb=new PageBean();
		ResultSet rs=null;	
		
		int sratr=(thisPage-1)*pb.getPageRow();
		int mun=pb.getPageRow();
		
		 String sql="select *  from  "+tableName+" limit "+sratr+","+mun+"";
		 
 		 Connection conn	=ConnectionManage.getConnection();
		
			try {
				 PreparedStatement pstmt=null;				
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					ResultSetMetaData rsmd=rs.getMetaData();
					int clomunCount=rsmd.getColumnCount();
					while(rs.next()){
						Map map=new HashMap();
						for(int i=1;i<=clomunCount;i++){
							String columnName=rsmd.getColumnName(i);
							String value=rs.getString(columnName);
							map.put(columnName, value);
						}
						list.add(map);
					}
					pb.setMap(list);
				    pb.setSumSava(this.getsumSava(tableName).getSumSava());
				    pb.setSumPage(this.getCountPage(pb.getSumSava()).getSumPage());
				    
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{	
				ConnectionManage.rsClose(rs);
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				}
			return pb;
	}
	//转换int为字符串
	public String returnString(int mun){
		String s=mun+"";
		return s;
		
	}
	//转换字符串为int
	public int returnInt(String mun){
		int s=Integer.parseInt(mun);
		return s;
		
	}
	

}
