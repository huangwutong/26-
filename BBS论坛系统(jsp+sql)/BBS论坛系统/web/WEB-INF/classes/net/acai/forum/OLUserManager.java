package net.acai.forum;
/**
 * Title:        ��������
 * Description:
 * Copyright:    Copyright (c) 2002
 * Company:      www.SuperSpace.com
 * @author:       SuperSpace
 * @version 1.0
 */
import net.acai.database.*;
import net.acai.util.*;
import java.util.Vector;
import java.sql.*;
public class OLUserManager{
	int OLUserNum=0;
	public OLUserManager(){
	}
	public int getOLUserNum(){
		return OLUserNum;

	}
	public  Vector getOLUsers(String forumType,int start,int perPage){
		Vector OLUsers=new Vector();
		try{
			//DBConnect dbc=new DBConnect(2,0);
			DBConnect dbc=new DBConnect();
			String sql="select * from bbs.online ";
			if(!"".equals(forumType)){

				sql+=" where stats like ?";
				dbc.prepareStatement(sql);
				forumType="%"+forumType+"%";
				dbc.setBytes(1,(new String(forumType.getBytes("ISO-8859-1"),"GBK")).getBytes());

			}
			else
				dbc.prepareStatement(sql);


			ResultSet rs=dbc.executeQuery();
			if(rs.last())
				OLUserNum=rs.getRow();
			int i=0;


			rs.absolute(start);

			do{

				OLUser tempOLUser=new OLUser();
				tempOLUser.setUserID(rs.getInt(1));
				tempOLUser.setUserName(rs.getString(2));
				tempOLUser.setUserClass(rs.getString(3));
				tempOLUser.setStats(rs.getString(4));
				tempOLUser.setUserIP(rs.getString(5));
				tempOLUser.setStartTime(rs.getString(6));
				tempOLUser.setLastTimeBK(rs.getString(7));
				tempOLUser.setLastTime(rs.getString(8));
				tempOLUser.setBrowser(rs.getString(9));
				tempOLUser.setActForIP(rs.getString(10));
				tempOLUser.setComeFrom(rs.getString(11));
				tempOLUser.setActCome(rs.getString(12));
				OLUsers.add(tempOLUser);

			}
			while(rs.next()&&++i<perPage);
			dbc.close();

		}
		catch(Exception e){
			e.printStackTrace();

		}
		return OLUsers;

	}


}

