<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="../error/error.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="BookShop.*"%>
<script language="javascript" src="../css/bs.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="../css/bs.css"/>
<jsp:useBean id="trade" class="BookShop.MyDb" scope="page">
</jsp:useBean>
<jsp:useBean id="newbook" class="BookShop.Ware" scope="page" />
<jsp:setProperty name="newbook" property="id" param="id"/> 
</head>
<%! String id,del,idbook,bookname,action,sqls,sqls1,bookadd;
	int d,i,j,k,quantity,sale,stock,quantityadd;
	float countprice,price,count;
%> 
<body> 
<p>&nbsp;</p>
<table width="658"  border="1" align="center" cellpadding="-1" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#0066ff" bordercolordark="#FFFFFF" > 
   <caption> 
  <div class="two">购物车</div> 
  <p></p> 
  </caption> 
 <tr align="center"> 
    <td width="240" height="22">书名</td> 
    <td width="111" height="22">单价</td> 
    <td width="92" height="22">数量</td> 
    <td width="112" height="22">金额</td> 
    <td width="91" height="22">退书</td> 
  </tr> 
<%	
	Vector buylist=(Vector)session.getAttribute("shoppingcart");
	try{
		action=(String)request.getParameter("action");
	}catch(Exception e){
		action="";
	}
	if(action.equals("del")){
		try{
		del=(String)request.getParameter("delj");
			d=(new Integer(del)).intValue();
		buylist.removeElementAt(d);
		}catch(Exception e){
		}
	}else if(action.equals("add")){
		boolean match=false;
		//新客户创建新列表
		if(buylist==null){
			buylist=new Vector();
			sqls="SELECT price,bookname,stock,sale FROM books WHERE idbook='"+newbook.getId()+"'";
			Statement stmt=trade.getstmtread();
			ResultSet rs=stmt.executeQuery(sqls);
			//控制图书是否卖完
			boolean match3=false;
			if(rs.next()){
				stock=rs.getInt("stock");
				sale=rs.getInt("sale");
				if(0>=(stock-sale)){
					session.setAttribute("error","图书已经购完");
					response.sendRedirect("../error/errorpage.jsp");
				}else{
					match3=true;
				}
			}
			rs.beforeFirst();
			if(rs.next()&&match3==true){
				newbook.setQuantity(1);
				newbook.setPrice(Float.parseFloat(rs.getString(1)));
				newbook.setName(rs.getString(2));
				newbook.setCountprice(newbook.getPrice()*newbook.getQuantity());
				buylist.addElement(newbook);
			}
			trade.close();
		//更改图书列表
		}else{
			for(i=0;i<buylist.size();i++){
				Ware book=(Ware)buylist.elementAt(i);
				//重复书籍计数
				if(book.getId().equals(newbook.getId())){
					sqls1="SELECT price,bookname,stock,sale FROM books WHERE idbook='"+newbook.getId()+"'";
					Statement stmt1=trade.getstmtread();
					ResultSet rs1=stmt1.executeQuery(sqls1);
					//控制图书是否卖完
					if(rs1.next()){
						stock=rs1.getInt("stock");
						sale=rs1.getInt("sale");
						if(0>=(stock-sale-book.getQuantity())){
							session.setAttribute("error","图书数量不足");
							response.sendRedirect("../error/errorpage.jsp");
						}else{
							newbook.setQuantity(book.getQuantity()+1);
							buylist.setElementAt(newbook,i);
						}
						match=true;
						trade.close();
					}
				}
				//新建立图书类型
				sqls="SELECT price,bookname,stock,sale FROM books WHERE idbook='"+newbook.getId()+"'";
				Statement stmt=trade.getstmtread();
				ResultSet rs=stmt.executeQuery(sqls);
				//控制图书是否卖完
				if(rs.next()){
					stock=rs.getInt("stock");
					sale=rs.getInt("sale");
					if(0>=(stock-sale)){
						session.setAttribute("error","图书数量不足");
						response.sendRedirect("../error/errorpage.jsp");
					}
				}
				rs.beforeFirst();
				if(rs.next()){
					newbook.setPrice(Float.parseFloat(rs.getString(1)));
					newbook.setName(rs.getString(2));
					newbook.setCountprice(newbook.getPrice()*newbook.getQuantity());
				}
				trade.close();
			}//for
			if(!match){
				sqls="SELECT price,bookname,stock,sale FROM books WHERE idbook='"+newbook.getId()+"'";
				Statement stmt=trade.getstmtread();
				ResultSet rs=stmt.executeQuery(sqls);
				//控制图书是否卖完
				boolean match2=false;
				if(rs.next()){
					stock=rs.getInt("stock");
					sale=rs.getInt("sale");
					if(0>=(stock-sale)){
						session.setAttribute("error","图书已经购完");
						response.sendRedirect("../error/errorpage.jsp");
					}else{
					match2=true;
					}
				}
				rs.beforeFirst();
				if(rs.next()&&match2==true){
					newbook.setPrice(Float.parseFloat(rs.getString(1)));
					newbook.setName(rs.getString(2));
					newbook.setQuantity(1);
					newbook.setCountprice(newbook.getPrice()*newbook.getQuantity());
					buylist.addElement(newbook);
				}
				trade.close();
			}//!match
		}//buylist!=null
	}else if(action.equals("update")){
		boolean match1=false;
		for(k=0;k<buylist.size();k++){
			try{
				bookadd=(String)request.getParameter("book"+k);
			}catch(Exception e){
				bookadd="";
			}
			try{
				quantityadd=Integer.parseInt((String)request.getParameter("quantity"+k));
			}catch(Exception e){
				quantityadd=0;
			}
			Ware book=(Ware)buylist.elementAt(k);
			if(bookadd!=""&&quantityadd!=0){
			//控制图书是否卖完
				sqls="SELECT price,bookname,stock,sale FROM books WHERE idbook='"+bookadd+"'";
				Statement stmt=trade.getstmtread();
				ResultSet rs=stmt.executeQuery(sqls);
				//控制图书是否卖完
				if(rs.next()){
					stock=rs.getInt("stock");
					sale=rs.getInt("sale");
					if(0>(stock-sale-quantityadd)){
						session.setAttribute("error","图书数量不足");
						response.sendRedirect("../error/errorpage.jsp");
					}else{
					match1=true;
					}
				}
				trade.close();
				//修改数量
				if(book.getId().equals(bookadd)&&match1==true){
					book.setQuantity(quantityadd);
					book.setCountprice(book.getPrice()*book.getQuantity());
				}
			}
		}//for
	}//endif
	session.setAttribute("shoppingcart",buylist);
	//显示功能
	if(buylist!=null&&buylist.size()>0){
		for(j=0;j<buylist.size();j++){
			Ware book=(Ware)buylist.elementAt(j);
			bookname=book.getName();
			price=book.getPrice();
			quantity=book.getQuantity();
			countprice=book.getCountprice();
			count=count+countprice;
%> 
  <tr align="center"> 
    <td height="22"><%=bookname%>&nbsp;</td> 
    <td height="22"><%=price%>&nbsp;</td> 
	<form name="<%="form"+j%>" method="post" action="trade.jsp">
    <td height="22">
	<input type="hidden" name="action" value="update"> 
	<input type="hidden" name="<%="book"+j%>" value="<%=book.getId()%>">
	<input name="<%="quantity"+j%>" type="text" size="5" value="<%=quantity%>" onBlur="javascript:submit(<%="form"+j%>)"> 
	</td> 
    </form>
    <td height="22"><%=countprice%>&nbsp;</td> 
    <form action="trade.jsp" method="post" name="form"> 
      <td height="22">
	   <input type="hidden" name="action" value="del"> 
        <input type="hidden" name="delj" value="<%=j%>"> 
        <input type="image" src="../image/move.gif"></td> 
    </form> 
  </tr> 
<%			
		}//for
%>
  <tr align="center"> 
    <td height="22" colspan="5"><span class="red12">总金额:<%=count%></span></td> 
  </tr>
  <tr align="center"> 
    <td height="22" colspan="2">
      <a href="account.jsp">收银台结账</a></td> 
    <td height="22" colspan="3"><a  href="#">修改数量</a></td>
  </tr>
<%
		count=0;
	}else{
%>
  <tr align="center"> 
    <td height="40" colspan="5" class="red12">你的购物车是空的！！！</td> 
  </tr> 
<%
	}
%> 
  <tr align="center">
    <td height="22" colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../customer/hotdeal.jsp" >继续购物</a></td>
  </tr> 
</table> 
</body>
</html>
