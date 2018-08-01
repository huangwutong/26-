package BookShop;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class MyDb{
	private Context ctx=null;
	private DataSource ds=null;
	private static Connection conn=null;
	private Statement stmt=null;
	private ResultSet rs=null;
	private static int COUNT=0;
	
	public MyDb(){
		
	}
	
	/***************************************************
		*method name:	close()<br>
		*method function:	close DataBase Connection<br>
		*return value: 	void<br>
		*method function:	no<br>
		*amend:	crazyadept<br>
		*		2004/8/18<br>
	****************************************************/
	public void close(){
		try{
			if (rs !=null) rs.close();
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
		try{
			if(stmt!=null) stmt.close();
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
		try{
			if(conn!=null) {
				conn.close();
			//	System.err.println("count -- "+(--COUNT));
			} 
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
	}
	
	/***************************************************
		*method name:	select()<br>
		*method function:	select DataBase data<br>
		*return value:  int<br>
		*		   	k=-10;	on word<br>
		*		   	k=0;	on record<br>
		*		   	k=-1;	have exception <br>
		*		   	k>0;	it is ok<br>
		*parameter explain:	no<br>
		*amend:	crazyadept<br>
		*		2004/8/18<br>
	****************************************************/
	public int select(String sql){
		int k=-10;
		try{
			k=0;
			rs=this.getstmtread().executeQuery(sql);
			while(rs.next()){
				k++;
			}
		}catch(Exception e){
			k=-1;
			e.printStackTrace(System.err);
		}finally{
			this.close();
		}
		return k;
	}
	
	/***************************************************
		*method name:	getCon()<br>
		*return value:  Connection<br>
		*parameter explain:	no<br>
		*amend:	crazyadept<br>
		*		2005/1/13<br>
	****************************************************/
	public Connection getCon(){
		try{
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/BookShop");
			conn = ds.getConnection();
		//	System.err.println("count ++ "+(++COUNT));
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
		return conn;
	}
	/***************************************************
		*method name:	update()<br>
		*method function:	updata,insert,delete<br>
		*return value:  int<br>
		*		   	k=-10;	on work	<br>
		*		   	k=0;	on insert data<br>
		*		   	k=-1;	hava exception<br>
		*		   	k>0; 	work is ok<br>
		*parameter explain:	no<br>
		*amend:	crazyadept<br>
		*		2004/8/2<br>
	****************************************************/
	public int update(String sql){
		int k=-10;
		try{
			k=0;
			k=this.getstmt().executeUpdate(sql);
		}catch(Exception e){
			k=-1;
			e.printStackTrace(System.err);
		}finally{
			this.close();
			return k;
		}
	}

	/***************************************************
		*method name:	getstmtread()<br>
		*method function:	get Statement be use select<br>
		*return value:  Statement<br>
		*		   		stmtread:	return Statement <br>
		*parameter explain:	no<br>
		*amend:	crazyadept<br>
		*		2004/8/17<br>
	****************************************************/
	public Statement getstmtread(){
		try{
			conn=getCon();
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
		return stmt;
	}
	
	/***************************************************
		*method name:	getstmt()<br>
		*method function:	get Statement be not use select<br>
		*return value:  Statement<br>
		*		   		stmtread:	return Statement <br>
		*parameter explain:	no<br>
		*amend:	crazyadept<br>
		*		2004/8/18<br>
	****************************************************/
	public Statement getstmt(){
		try{
			conn=getCon();
			stmt=conn.createStatement();
		}catch(Exception e){
			e.printStackTrace(System.err);
		}
		return stmt;
	}
	
	/***************************************************
		*method name:	inStr()<br>
		*method function:	change coding "'" to Char(1)<br>
		*return value:  String<br>
		*		    	return Chainese<br>
		*parameter explain:	str<br>
		*amend:	crazyadept<br>
		*		2004/8/17<br>
	****************************************************/
	public String inStr(String str){
		if(str==null){
			str="";
		}else{
			try{
				str=(new String(str.getBytes("iso-8859-1"),"GB2312")).trim();
				str=str.replace('\'',(char)1);
			}catch(Exception e){
				e.printStackTrace(System.err);
			}
		}
		return str;
	}

	/***************************************************
		*method name:	outStr()<br>
		*method function:	change coding Char(1) to "'"<br>
		*return value:  String<br>
		*		    	return Chainese<br>
		*parameter explain:	str<br>
		*amend:	crazyadept<br>
		*		2004/8/17<br>
	****************************************************/
	public String outStr(String str){
		if(str==null){
			str="";
		}else{
			try{
				str=str.replace((char)1,'\'');
			}catch(Exception e){
				e.printStackTrace(System.err);
			}
		}
		return str;
	}

	/***************************************************
		*method name:	selectStr()<br>
		*method function:	select DataBase be use SQL<br>
		*return value:  String<br>
		*		    	return %<br>
		*parameter explain:	str<br>
		*amend:	crazyadept<br>
		*		2004/8/26<br>
	****************************************************/
	public String selectStr(String str){
	
		if(str.equals("")){
			str=" LIKE '%' ";
		}else{
			str=(" LIKE '%"+str+"%' ");
		}
			return str;
	}
}