<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="BookShop.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>����̨</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean id="trade" class="BookShop.MyDb" scope="page"></jsp:useBean>
<jsp:useBean id="time" class="BookShop.MyTime" scope="page"></jsp:useBean>

</head>
<%! String idbook,bookname,action,idcustomer,id,sqli,sqli2,sqli3,sqls,sqls1,sqls2;
	int quantity,iddistinction,j,dispricecount;
	float countprice,price,discount,limitprice,disprice,count;
%> 
<body> 
<p>&nbsp;</p>
<table width="658"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
   <caption> 
  <div class="two">����̨</div> 
  <p></p> 
  </caption> 
<%
	if(session.getAttribute("id")==null){
%> 
<tr align="center"> 
    <td height="50" colspan="4" class="two">�㻹û�е�¼������<a href="../user/login.jsp" target="_parent">��¼</a></td> 
  </tr>
<%	
	}else{
%> 
 <tr align="center"> 
    <td width="240" height="22">����</td> 
    <td width="140" height="22">����</td> 
    <td width="127" height="22">��Ԫ��</td> 
    <td width="141" height="22">���ۺ�Ԫ��</td> 
  </tr>
<%		
		Vector buylist=new Vector();
		buylist=(Vector)session.getAttribute("shoppingcart");
		id=(String)session.getAttribute("id");
		count=0;
		if(buylist!=null&&buylist.size()>0){
			for(j=0;j<buylist.size();j++){
				Ware book=(Ware)buylist.elementAt(j);
				idbook=book.getId();
				bookname=book.getName();
				price=book.getPrice();
				quantity=book.getQuantity();
				countprice=book.getCountprice();
				sqls="SELECT a.discount,a.iddistinction FROM distinction AS a,customers AS b WHERE a.iddistinction=b.iddistinction AND idcustomer='"+id+"'"; 
				Statement stmt=trade.getstmtread();
				ResultSet rs=stmt.executeQuery(sqls);
				if(rs.next()){
					discount=Float.parseFloat(rs.getString(1));
					iddistinction=rs.getInt(2);
					disprice=price*quantity*discount/10;
					count=count+disprice;
%>
  <tr align="center">
    <td height="22"><%=bookname%>&nbsp;</td> 
    <td height="22"><%=quantity%>&nbsp;</td> 
    <td height="22"><%=countprice%>&nbsp;</td> 
    <td height="22"><%=disprice%>&nbsp;</td> 
  </tr>
<%
					}//rs
					trade.close();
					//�������ۼ�¼
					sqli="INSERT INTO salebook(idbook,idcustomer,saletime,quantity,disprice) VALUES('"+idbook+"','"+id+"','"+time.getDay()+"',"+quantity+","+disprice+")";
					Statement stmt1=trade.getstmt();
					stmt1.executeUpdate(sqli);
					trade.close();
					//����ͼ������
					stmt=trade.getstmtread();
					rs=stmt.executeQuery("SELECT sale FROM books WHERE idbook='"+idbook+"'");
					if(rs.next()){
						sqli3="UPDATE books SET sale="+(quantity+rs.getInt(1))+" WHERE idbook='"+idbook+"'";
						trade.close();
						Statement stmt3=trade.getstmt();
						stmt3.executeUpdate(sqli3);
					}
					trade.close();
			}//for
%>
  <tr align="right">
    <td height="22" colspan="4" class="red12">�������ǵ�<%=iddistinction%>����Ա&nbsp;&nbsp;�ܽ��<%=count%></td>
  </tr> 
<%			
				//���Ļ�Ա�ȼ�
				sqls1="SELECT SUM(disprice) AS disprice FROM salebook WHERE idcustomer='"+id+"'";
				Statement stmt=trade.getstmtread();
				ResultSet rs=stmt.executeQuery(sqls1);
				if(rs.next()){
					dispricecount=rs.getInt(1);
				}
				trade.close();
				//�ж��Ƿ��ǹ���Ա
				if(iddistinction<6){
					sqls2="SELECT limitprice FROM distinction ORDER BY iddistinction";
					Statement stmt2=trade.getstmtread();
					ResultSet rs2=stmt2.executeQuery(sqls2);
					iddistinction=-2;
					while(rs2.next()){
						limitprice=rs2.getInt(1);
						if((dispricecount-countprice)>=limitprice){
							iddistinction++;
						//out.print((dispricecount-countprice)+"count"+"<br>");
						//out.print(limitprice+"limitprice"+"<br>");
						}
					}
					trade.close();
					sqli2="UPDATE customers SET iddistinction ="+iddistinction+" WHERE idcustomer='"+id+"'";
					Statement stmt3=trade.getstmtread();
					stmt3.executeUpdate(sqli2);
					trade.close();
				}//iddispricecount
		}else{
			session.setAttribute("error","�㻹û�й���");	
			response.sendRedirect("../error/errorpage.jsp");
		}//buylist
	}//id
	session.removeAttribute("shoppingcart");
%>
</table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0" class="red12">
    <tr>
      <td width="73%" height="80" align="right" valign="bottom">����ѡ��</td>
      <td width="10%" align="center" valign="bottom"><a href="../customer/active.jsp">��������</a></td>
      <td width="5%" align="center" valign="bottom">����</td>
      <td width="10%" align="center" valign="bottom"><a target="_parent" href="../index.htm">�˳�����</a></td>
    </tr>
  </table>
</body>
</html>