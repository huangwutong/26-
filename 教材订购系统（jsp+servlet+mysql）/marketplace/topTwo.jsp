<%@ page contentType="text/html; charset=gb2312" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css">


<%if(session.getAttribute("id")==null||session.getAttribute("form")==null){%>
<table width="97%" height="41"  border="0" align="center" cellpadding="0" cellspacing="0" >
      <tr align="center" >
        <td width="117" height="39" class="linkWhite"><a href="index.jsp" >������ҳ<br>
        Index</a></td>
        <td width="117" class="linkWhite"><a href="sell_resultTen.jsp">��������<br>
  SellSort</a></td>
        <td width="117" class="linkWhite"><a href="goodsAction.do?action=14&mark=0">���½̲�<br>
  NewsBooks</a></td>
        <td width="117" class="linkWhite"><a href="goodsAction.do?action=15&mark=1" >�ؼ۽̲�<br>
  At a sale</a></td>
        <td width="117" class="linkWhite"><a href="connection.jsp" >�鿴����<br>
  Order</a></td>
        <td width="117" class="linkWhite"><a href="connection.jsp" >�鿴���鳵<br>
  Cart</a></td>
        <td width="117" class="linkWhite"><a href="connection.jsp" >��Ա�޸�<br>
  Member</a></td>
        <td width="117" class="linkWhite"><a href="#" onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('http://www.arsene.com')" class="linkBlack">��Ϊ��ҳ<br>
  SettingFirst</a></td>
      </tr>
</table>
<%}else{%>
<table width="97%" height="41"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center">
        <td width="117" height="39" class="linkWhite"><a href="index.jsp">������ҳ<br>
        Index</a></td>
        <td width="117" class="linkWhite"><a href="sell_resultTen.jsp">��������<br>
  SellSort</a></td>
        <td width="117" class="linkWhite"><a href="goodsAction.do?action=14&mark=0">���½̲�<br>
  NewsBooks</a></td>
        <td width="117" class="linkWhite"><a href="goodsAction.do?action=15&mark=1">�ؼ۽̲�<br>
  At a sale</a></td>
        <td width="117" class="linkWhite"><a href="cart_detail.jsp">�鿴����<br>
  Order</a></td>
        <td width="117" class="linkWhite"><a href="cart_see.jsp">�鿴���鳵<br>
  Cart</a></td>
        <td width="117" class="linkWhite"><a href="memberAction.do?action=5&id=<%=session.getAttribute("id")%>">��Ա�޸�<br>
  Member</a></td>
        <td width="117" class="linkWhite"><a href="#" onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('http://www.arsene.com')">��Ϊ��ҳ<br>
  SettingFirst</a></td>
      </tr>
</table>
<%}%>
