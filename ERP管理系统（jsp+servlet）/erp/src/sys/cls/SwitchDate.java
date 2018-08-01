package sys.cls;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;

public class SwitchDate
{
	//导数据库
	public static void main(String[] args)
	{
		try
		{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection conn = DriverManager.getConnection("jdbc:odbc:szacce");
			Statement stmt = conn.createStatement();

			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			// Connection con =
			// DriverManager.getConnection("jdbc:sqlserver://192.168.1.101:1433;databaseName=crm;selectMethod=cursor","crmsystem",
			// "152637crm6059");
			Connection con = DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433;databaseName=erptest;selectMethod=cursor", "sa", "sa");
			Statement stm = con.createStatement();

//			 ResultSet rs = stmt.executeQuery("select * from usadmin");
//			 while (rs.next())
//			 {
//			 String usname = rs.getString("usname");
//			 if (usname.equals("admin"))
//			 {
//			 continue;
//			 }
//			 String str = "insert into personnel(realname,deptid,positionid,sex,dwelling,adddate,username,password,A,B) values('"
//			 + rs.getString("U_name") + "',";
//			 switch (rs.getInt("D_id"))
//			 {
//			 case 1:str += 15 + ",";
//			 break;
//			 case 2:str += 16 + ",";
//			 break;
//			 case 3:str += 17 + ",";
//			 break;
//			 case 4:str += 14 + ",";
//			 break;
//			 case 5:str += 17 + ",";
//			 break;
//			 case 6:str += 18 + ",";
//			 break;
//			 case 7:str += 19 + ",";
//			 break;
//			 default:
//			 continue;
//			 }
//			 switch (rs.getInt("J_id"))
//			 {
//			 case 1:str+=4+",";
//			 break;
//			 case 2:str+=5+",";
//			 break;
//			 case 3:str+=2+",";
//			 break;
//			 default:
//			 continue;
//			 }
//			 if (rs.getString("U_sex").equals("男"))
//			 {
//			 str+=1+",";
//			 }
//			 else
//			 {
//			 str+=0+",";
//			 }
//			 str+="'"+rs.getString("U_adds")+"','";
//			 str+=rs.getDate("U_adddate")+"',";
//			 str+="'"+usname+"',";
//			 str+="'"+MD5.md5(rs.getString("uspwd"))+"',";
//			 str+=150+",";
//			 str+=30+")";
//			 stm.execute(str);
			//			
			//			
			//			
			//			
			// //全局同用
			ResultSet rs = stmt.executeQuery("select * from cuser where Cid > 3085");
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			Connection co = DriverManager.getConnection("jdbc:odbc:szacce");
			Statement st = co.createStatement();
			while (rs.next())
			{
				String companyName = rs.getString("Cname");
				@SuppressWarnings("unused")
				Date date = rs.getDate("Caddtime");
				String company = "";
				int i = rs.getInt("uid");
				int userid = 0;
				if (i != 0)
				{
					ResultSet user = st.executeQuery("select U_name from usadmin where id = " + i);
					user.next();
					String userName = user.getString("U_name");
					String sqltemp = "select personnelid from personnel where realname = '" + userName + "'";
					ResultSet tem = stm.executeQuery(sqltemp);
					tem.next();
					userid = tem.getInt("personnelid");
				}

				 if (companyName!=null)
				 {
				 String companyKeywords = companyName.replace("深圳", "");
				 companyKeywords = companyKeywords.replace("市", "");
				 companyKeywords = companyKeywords.replace("（）", "");
				 companyKeywords = companyKeywords.replace("有限", "");
				 companyKeywords = companyKeywords.replace("()", "");
				 companyKeywords = companyKeywords.replace("分公司", "");
				 companyKeywords = companyKeywords.replace("公司", "");
				 companyKeywords = companyKeywords.replace("厂", "");
				 company += "insert into company(namekeywords,nameparticular,districtid,companyaddress,type,companytype,companynarrate,adddate,indate,personnelid,companystate,visitcount) values ('";
				 company += companyKeywords + "','";
				 company += companyName + "',";
				 company += 250 + ",'";
				 company += rs.getString("Cadds") + "','E','B','";
				 company += rs.getString("CEsize") + "<br/>"
				 + rs.getString("products") + "<br/>"
				 + rs.getString("Curl") + "','";
				 company +=
				 Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new
				 java.util.Date())) + "','";
				 company +=
				 Date.valueOf(DateFormat.getDateInstance(DateFormat.DEFAULT).format(new
				 java.util.Date())) + "',";
				 if (userid != 0)
				 {
				 company += userid + ",'A',";
				 }
				 else
				 {
				 company += null + ",'C',";
				 }
				 company+="0)";
				 stm.execute(company);
				 }

				// 联系人与拜访同用
//				String lm = rs.getString("Contact");
//				String linkman = "";
//				int companyid = 0;
//				if (companyName == null)
//				{
//					String sqltemp = "select Cname from cuser where Cid = " + rs.getString("cuid");
//					ResultSet r = st.executeQuery(sqltemp);
//					r.next();
//					String tempCompanyName = r.getString("Cname");
//					sqltemp = "select companyid from company where nameparticular = '" + tempCompanyName + "'";
//					ResultSet temp = stm.executeQuery(sqltemp);
//					temp.next();
//					companyid = temp.getInt("companyid");
//				}
//				else
//				{
//					ResultSet temp = stm.executeQuery("select companyid from company where nameparticular = '" + companyName + "'");
//					temp.next();
//					companyid = temp.getInt("companyid");
//				}

//				 if (lm !=null)
//				 {
//				 linkman += "insert into linkman (linkmanname,linkmanphone,linkmanmoblie,job,companyid,adddate)values ('";
//				 linkman += lm + "','"
//				 + rs.getString("Ctel") + "','"
//				 + rs.getString("Cntel") + "','"
//				 + rs.getString("Cjobs") + "',";
//				 linkman += companyid + ",'" + date
//				 + "')";
//				 stm.execute(linkman);
//				 }

				//				
				// //
				// //
//				String visit = "insert into visit (visittype,visittime,linkmanid,personnelid,companyid,visitlog) values('A','";
//				visit += date + "',";
//				ResultSet temp = stm.executeQuery("select linkmanid from linkman where companyid = " + companyid);
//				temp.next();
//				if (userid == 0)
//				{
//					visit += temp.getInt("linkmanid") + "," + null + "," + companyid + ",'" + rs.getString("Ctitle") + "<br/>" + rs.getString("connent") + "')";
//				}
//				else
//				{
//					visit += temp.getInt("linkmanid") + "," + userid + "," + companyid + ",'" + rs.getString("Ctitle") + "<br/>" + rs.getString("connent") + "')";
//				}
//				stm.execute(visit);
//				stm.executeUpdate("update company set visitcount = visitcount+1,lastvisitdate = '" + date + "' where companyid = " + companyid);
			}
		}
		catch (java.lang.ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch (SQLException ex)
		{
			ex.printStackTrace();
		}
	}
}
