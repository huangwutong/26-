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
import net.acai.forum.*;
import net.acai.forum.util.*;
import net.acai.util.*;
import net.acai.ip.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
public class SkinUtil
{
	public static void login(HttpServletRequest request,
				 HttpServletResponse response,
				 String username,
				 String password) throws UserNotFoundException,Exception
	{
			/*User sessionUser=new User(username,password);
			HttpSession session=request.getSession(true);
			session.setAttribute("UJBBUser",sessionUser);
			GCookie.setCookie(response,"UJBBUName",username,60*60*60);
			GCookie.setCookie(response,"UJBBUPSW",password,60*60*60);*/
	}
	public static User checkUser(HttpServletRequest request,HttpServletResponse response,int loginSign) throws UserNotFoundException,Exception{
		String userName=GCookie.getCookieValue(request,"UJBBUName","");
		String userPassword=GCookie.getCookieValue(request,"UJBBUPSW","");
		User tempUser=new User(userName,userPassword,loginSign);
		return tempUser;
	}

	public static void userLogin(HttpServletRequest request,HttpServletResponse response,int loginSign) throws UserNotFoundException,Exception{
		String userName=ParamUtil.getString(request,"userName","");
		String userPassword=ParamUtil.getString(request,"userPassword","");
		User tempUser=new User(userName,userPassword,loginSign);
		int cookieDate=ParamUtil.getInt(request,"cookieDate",1);
		switch(cookieDate){
			case 1:
				cookieDate=3600*24;
				break;
			case 2:
				cookieDate=30*3600*24;
				break;
			case 3:
				cookieDate=365*30*3600*24;
				break;

			default:
				cookieDate=3600*24;
				break;
		}

		GCookie.setCookie(response,"UJBBUName",userName,cookieDate);
		GCookie.setCookie(response,"UJBBUPSW",userPassword,cookieDate);
	}
	public static void userLogout(HttpServletResponse response,HttpServletRequest request) throws Exception
	{

			String userName=GCookie.getCookieValue(request,"UJBBUName","");
			String userPassword=GCookie.getCookieValue(request,"UJBBUPSW","");
			GCookie.setCookie(response,"UJBBUName",userName,0);
			GCookie.setCookie(response,"UJBBUPSW",userPassword,0);

			long 	statUserID=Long.parseLong(StringUtils.replace(request.getRemoteAddr(),".",""));
 			String sql="delete from bbs.online where ID="+statUserID;

			DBConnect dbc=new DBConnect(sql);
			dbc.executeUpdate();
	}


	public static User userLogin(String userName,String userPassword,int loginSign) throws UserNotFoundException,Exception{
		User tempUser=new User(userName,userPassword,loginSign);
		return tempUser;
	}


	public static void checkUserStats(HttpServletRequest request,HttpServletResponse response){
		String stats;
		if((stats=ParamUtil.getString(request,"stats"))==null)
		{
			stats="��̳��ҳ response";
		}

		checkUserStats(request,response,stats);

	}

	public static void checkUserStats(HttpServletRequest request,HttpServletResponse response,String stats){

		String userName=GCookie.getCookieValue(request,"UJBBUName","");
		String userPassword=GCookie.getCookieValue(request,"UJBBUPSW","");
		String ip=request.getRemoteAddr();
		String[] addr=IPLocalizer.search(request);
		String comeFrom="";
		for(int i=0;i<addr.length;i++)
			comeFrom+=addr[i];
		String actCome=request.getHeader("X_FORWARDED_FOR");
		long 	statUserID=Long.parseLong(StringUtils.replace(ip,".",""));
 		boolean onlineSign=false;
 		String browser=request.getHeader("User-Agent");
		ResultSet rs;
 		try{
			String sql="";
			DBConnect dbc=new DBConnect();
			try{
 			sql="select * from bbs.online where id=?";
			dbc.prepareStatement(sql);
			dbc.setLong(1,statUserID);
			//dbc.setBytes(2,userName(new String(.getBytes("ISO-8859-1"),"GBK")).getBytes());
			rs=dbc.executeQuery();
			if(rs.next())
				onlineSign=true;
			else
				onlineSign=false;
			rs.close();
			}
			catch(Exception e){
				onlineSign=false;
			}




			if("".equals(userName)){
				//System.out.println("++++++++++++++"+stats);
				//if(stats.indexOf("response")==-1)stats = net.ds.toGBK(stats);
				//System.out.println("--------------"+stats);
				if(!onlineSign){
					sql="insert into bbs.online (id,username,userclass,ip,startime,lastimebk,browser,stats,actforip,ComeFrom,actCome) values(?,?,?,?,?,?,?,?,?,?,?)";
					dbc.prepareStatement(sql);
					dbc.setLong(1,statUserID);
					dbc.setString(2,"guest");
					dbc.setBytes(3,("����").getBytes());
					dbc.setBytes(4,(new String(ip.getBytes("ISO-8859-1"),"GBK")).getBytes());
					dbc.setString(5,Format.getDateTime());
					dbc.setString(6,Format.getDateTime());
					dbc.setString(7,browser);
					dbc.setBytes(8,stats.getBytes());
					dbc.setString(9,actCome);
					dbc.setBytes(10,comeFrom.getBytes());
					dbc.setString(11,actCome);
					dbc.executeUpdate();
					dbc.clearParameters();

				}
				else{
						sql="update bbs.online set lastimebk=?,lastime=?,ComeFrom=?,actCome=?,stats=? where id=?";
						dbc.prepareStatement(sql);
						dbc.setString(1,Format.getDateTime());
						dbc.setString(2,Format.getStrDateTime());
						dbc.setBytes(3,comeFrom.getBytes());
						dbc.setString(4,actCome);
						dbc.setBytes(5,stats.getBytes());
						dbc.setLong(6,statUserID);
						dbc.executeUpdate();
						dbc.clearParameters();

				}
			}
			else{
				sql="select * from bbs.online where  ID=? or username=?";
				dbc.prepareStatement(sql);
				dbc.setLong(1,statUserID);
				dbc.setBytes(2,(new String(userName.getBytes("ISO-8859-1"),"GBK")).getBytes());
				rs=dbc.executeQuery();
				if(rs.next())
					onlineSign=true;
				else
					onlineSign=false;
				dbc.clearParameters();
				try{
					//stats = net.ds.toGBK(stats);
					User theUser=new User(userName,userPassword,4);
					if(onlineSign){

						sql="update bbs.online set id=?,userName=?,userClass=?,lastimebk=?,lastime=?,ComeFrom=?,actCome=?,stats=? where id=? or username=?";
						dbc.prepareStatement(sql);
						dbc.setLong(1,statUserID);
						dbc.setBytes(2,(new String(userName.getBytes("ISO-8859-1"),"GBK")).getBytes());
						dbc.setBytes(3,getUserClass(theUser.getUserClass()).getBytes());
						dbc.setString(4,Format.getDateTime());
						dbc.setString(5,Format.getStrDateTime());
						dbc.setBytes(6,comeFrom.getBytes());
						dbc.setString(7,actCome);
						dbc.setBytes(8,stats.getBytes());
						dbc.setLong(9,statUserID);
						dbc.setBytes(10,(new String(userName.getBytes("ISO-8859-1"),"GBK")).getBytes());
						dbc.executeUpdate();
						dbc.clearParameters();
					}
					else{

						sql="insert into bbs.online(id,username,userclass,ip,startime,lastimebk,browser,stats,actforip,ComeFrom,actCome) values(?,?,?,?,?,?,?,?,?,?,?)";
						dbc.prepareStatement(sql);
						dbc.setLong(1,statUserID);//statUserID);
						dbc.setBytes(2,(new String(userName.getBytes("ISO-8859-1"),"GBK")).getBytes());
						dbc.setBytes(3,getUserClass(theUser.getUserClass()).getBytes());
						dbc.setString(4,ip);
						dbc.setString(5,Format.getDateTime());
						dbc.setString(6,Format.getStrDateTime());
						dbc.setString(7,browser);
						dbc.setBytes(8,stats.getBytes());
						if(actCome==null){
							dbc.setString(9,"null");
							dbc.setString(11,"null");
						}
						else{
							dbc.setString(9,actCome);
							dbc.setString(11,actCome);
						}
						dbc.setBytes(10,comeFrom.getBytes());
						dbc.executeUpdate();
						dbc.clearParameters();
					}
				}
				catch(Exception e){

					if(!onlineSign){
					sql="insert into bbs.online (id,username,userclass,ip,startime,lastimebk,browser,stats,actforip,ComeFrom,actCome) values(?,?,?,?,?,?,?,?,?,?,?)";
					dbc.prepareStatement(sql);
					dbc.setLong(1,statUserID);
					dbc.setString(2,"guest");
					dbc.setBytes(3,(new String("����".getBytes("ISO-8859-1"),"GBK")).getBytes());
					dbc.setBytes(4,(new String(ip.getBytes("ISO-8859-1"),"GBK")).getBytes());
					dbc.setString(5,Format.getDateTime());
					dbc.setString(6,Format.getDateTime());
					dbc.setString(7,browser);
					dbc.setBytes(8,stats.getBytes());
					dbc.setString(9,actCome);
					dbc.setBytes(10,comeFrom.getBytes());
					dbc.setString(11,actCome);
					dbc.executeUpdate();
					dbc.clearParameters();

					}
					else{
							sql="update bbs.online set lastimebk=?,lastime=?,ComeFrom=?,actCome=?,stats=? where id=?";
							dbc.prepareStatement(sql);
							dbc.setString(1,Format.getDateTime());
							dbc.setString(2,Format.getStrDateTime());
							dbc.setBytes(3,comeFrom.getBytes());
							dbc.setString(4,actCome);
							dbc.setBytes(5,stats.getBytes());
							dbc.setLong(6,statUserID);
							dbc.executeUpdate();
							dbc.clearParameters();

					}

				}

			}



			sql="delete from bbs.online where "
				+" datepart(YYYY,getdate()-lastimebk)=0 and "
				+" datepart(MM,getdate()-lastimebk)=0 and "
				+" datepart(DD,getdate()-lastimebk)=0 and "
				+" datepart(HH,getdate()-lastimebk)=0 and "
				+" datepart(MI,getdate()-lastimebk)<20";

			dbc.executeUpdate(sql);
			sql="select Maxonline from bbs.config";
			rs=dbc.executeQuery(sql);
			rs.next();
			int oldMaxOnLine=rs.getInt(1);
			sql="select count(*) from bbs.online";
			ResultSet tmprs=dbc.executeQuery(sql);
			tmprs.next();
			int newMaxOnLine=tmprs.getInt(1);
			if(newMaxOnLine>oldMaxOnLine){
				sql="update bbs.config set Maxonline="+newMaxOnLine+",MaxonlineDate=getdate()";
				dbc.executeUpdate(sql);
				ForumPropertiesManager.resetManager();
			}

			dbc.close();

		}
		catch(Exception e){

			e.printStackTrace();
		}

	}
	public static String getUserClass(int userClass){
		String user_level="";
		switch(userClass){

			case 1:
				user_level="������·";
				break;
			case 2:
				user_level="��̳����";
				break;
			case 3:
				user_level="��̳����";
				break;
			case 4:
				user_level="ҵ������";
				break;
			case 5:
				user_level="ְҵ����";
				break;
			case 6:
				user_level="��֮����";
				break;
			case 7:
				user_level="����";
				break;
			case 8:
				user_level="������";
				break;
			case 9:
				user_level="֩����";
				break;
			case 10:
				user_level="�����";
				break;
			case 11:
				user_level="С����";
				break;
			case 12:
				user_level="�����";
				break;
			case 13:
				user_level="������";
				break;
			case 14:
				user_level="��������";
				break;
			case 15:
				user_level="�ޱ���";
				break;
			case 16:
				user_level="��ŵ";
				break;
			case 17:
				user_level="��ʥ";
				break;
			case 18:
				user_level="���";
				break;
			case 19:
				user_level="����";
				break;
			case 20:
				user_level="�ܰ���";
				break;
			default:
				user_level="������·";
				break;
		}
		return user_level;
	}


	public static int getPoint(int p){
		int level_point=0;
		switch(p){
			case 1:
				level_point=0;
				break;
			case 2:
				level_point=100;
				break;
			case 3:
				level_point=200;
				break;
			case 4:
				level_point=300;
				break;
			case 5:
				level_point=400;
				break;
			case 6:
				level_point=500;
				break;
			case 7:
				level_point=600;
				break;
			case 8:
				level_point=800;
				break;
			case 9:
				level_point=1000;
				break;
			case 10:
				level_point=1200;
				break;
			case 11:
				level_point=1500;
				break;
			case 12:
				level_point=1800;
				break;
			case 13:
				level_point=2100;
				break;
			case 14:
				level_point=2500;
				break;
			case 15:
				level_point=3000;
				break;
			case 16:
				level_point=3500;
				break;
			case 17:
				level_point=4000;
				break;
			default:
				level_point=0;
				break;
		}
		return level_point;
	}

	public static Vector getTopList(HttpServletRequest request) throws Exception{
		int orders=ParamUtil.getInt(request,"orders",7);
		String sql="";
		switch(orders){
		case 1:
			sql="select username,useremail,userclass,oicq,homePage,article,addDate,userwealth as wealth ,userID from bbs.myuser order by article desc";
			break;
		case 2:
			sql="select  username,useremail,userclass,oicq,homePage,article,addDate,userwealth as wealth ,userID from bbs.myuser order by AddDate desc";
			break;
		case 7:
			sql="select username,useremail,userclass,oicq,homePage,article,addDate,userwealth as wealth ,userID from bbs.myuser order by AddDate desc ";
			break;
		default:
			sql="select  username,useremail,userclass,oicq,homePage,article,addDate,userwealth as wealth ,userID from bbs.myuser order by article desc";
			break;
		}

		DBConnect dbc=new DBConnect();
		ResultSet rs=dbc.executeQuery(sql);
		Vector userVector=new Vector();
		int i = 0 ;
		while(rs.next()){

			User tempUser=new User();
			tempUser.setUserName(rs.getString(1));
			tempUser.setUserEmail(rs.getString(2));
			tempUser.setUserClass(rs.getInt(3));
			tempUser.setOicq(rs.getString(4));
			tempUser.setHomePage(rs.getString(5));
			tempUser.setArticle(rs.getInt(6));
			tempUser.setAddDate(rs.getString(7));
			tempUser.setUserWealth(rs.getInt(8));
			tempUser.setUserID(rs.getInt(9));
			userVector.add(tempUser);
			
			i++;
			if(orders!=7)
			{
				if(i==10)break;
			}
		}
		return userVector;
	}


}