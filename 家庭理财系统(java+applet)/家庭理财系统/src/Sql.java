/**
 *��Sql.class���ڲ��ԣ�ѧϰjava�����ݿ�Ĳ�������
 *�������ڳ����� 
 *
 * 
 * */

import java.sql.*;
  class Sql{

public  Sql(){
	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");//��װ����
	}catch(java.lang.ClassNotFoundException e){
		System.out.println("forname:��" + e.getMessage());
	}
	try{
		Connection c = DriverManager.getConnection("jdbc:odbc:STU");//�������ݿ�
		Statement s = c.createStatement();//��ѯ��ʱ��Ҫ��
		//PreparedStatement p1 = c.prepareStatement("UPDATE consumer set tatalmoney=? Where id=?");
		
		//ResultSet rs = s.executeQuery("select * from consumer");
		
		//s.executeUpdate("create table consumer(id char(10),name char(15),tatalmoney integer)");
		//String shouru = Moneymanager.txt1.getText();
	    //s.executeUpdate("insert into maneymanager values('5','"+shouru+" ','1231','6','6')");//�������
	    //p1.setInt(1,55);p1.setString(2,"123");p1.executeUpdate();p1.close();//�޸�����
	    //while(rs.next()){
	    	//System.out.println(rs.getString("id")+rs.getString("name"));
	    //}
	    		    	    	    
	    s.close();
		c.close();
	}catch(SQLException e){
		System.out.println("SQLException: "+ e.getMessage());	
		}

}

	


	public static void main(String[] args){
		//new Sql();
		
	}
}
		
