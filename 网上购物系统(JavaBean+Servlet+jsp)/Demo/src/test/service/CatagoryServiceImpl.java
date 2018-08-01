package test.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import test.util.DbConnectionService;
import test.vo.CatagoryInfo;

public class CatagoryServiceImpl implements ICatagoryService {

	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;

	public CatagoryServiceImpl() {
		connection = DbConnectionService.getConnection();
		try {
			statement = connection.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<CatagoryInfo> getCatagorys() {

		List<CatagoryInfo> list = new ArrayList<CatagoryInfo>();
		String sql = "select * from catagory";
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				list.add(new CatagoryInfo(resultSet.getInt(1), resultSet
						.getString(2), resultSet.getString(3)));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}

	public CatagoryInfo saveCatagory(CatagoryInfo catagoryInfo) {

		String sql = "insert into catagory(cname,xeplain) values('"
				+ catagoryInfo.getCname() + "','" + catagoryInfo.getXeplain()
				+ "')";
		try {
			statement.execute(sql);
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return catagoryInfo;
	}

	public Boolean delCatagoryInfo(int catano) {
		Boolean result = null;
		String sql = "delete from catagory where crono="+catano;
		
		try {
			result = statement.execute(sql);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
		return result;
	}
	
	public Boolean updateCatagoryInfo(CatagoryInfo catagoryInfo) {
		Boolean result = null;
		String sql = "update catagory set cname='"
				+ catagoryInfo.getCname() + "',xeplain='"
				+ catagoryInfo.getXeplain() + "' where crono="
				+ catagoryInfo.getCrono();
		
		
		try {
			result = statement.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public CatagoryInfo searchCatagoryInfo(int catano) {
		String sql = "select * from catagory where crono="+catano;
		CatagoryInfo catagoryInfo = new CatagoryInfo();
		try {
			resultSet = statement.executeQuery(sql);
			while(resultSet.next())
			{
				catagoryInfo.setCrono(resultSet.getInt(1));
				catagoryInfo.setCname(resultSet.getString(2));
				catagoryInfo.setXeplain(resultSet.getString(3));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return catagoryInfo;
	}

	
	public List<CatagoryInfo> getPageCatagorys(int currentPage) {
		
		String sql = "select * from catagory limit "+(currentPage*5)+",5";
		List<CatagoryInfo> list = new ArrayList<CatagoryInfo>();
		
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()){
			list.add(new CatagoryInfo(resultSet.getInt(1),resultSet.
					getString(2),resultSet.getString(3)));
				
			}
			
		} catch (SQLException e) {


			e.printStackTrace();
		}
		
		 
		return list;
	}


}
