<%
long endTime=(new Date()).getTime();
%>
<div align=center>
<table><tr><td height=2></td></tr></table>
<img src="pic/ad1.gif">
<a href="ftp://lzb:lzb@222.28.43.206:2000/" target="_blank" title="<%=net.ds.toGBK("��ӭ����FTPվ�㣬�д�����Դ��Ӧ�����������������ϵ����ķ�ʽ,�ҽ��ṩ��������ʻ�:-)")%>"><img src="pic/ad.gif" border=0></a>
<br>
<%=ads2%><%=copyRight%><%=version%>
<table align=center width=174>
    <tbody>
      <tr> 
        <td><img border=0 src="pic/biaoshi.gif"></td>
		<td>
		<a href="mailto:lzb_box@163.com">Mail:lzb_box@163.com</a>
		Tel:010-62349606<br>
		QQ:39717167 
		</td>
      </tr>
	  <tr><td colspan=2 align=center>
		<font color="#FF9900"><%=net.ds.toGBK("ҳ��ˢ��ʱ��:")%><%=(endTime-startTime)%>ms
	  </td></tr>
    </tbody>
  </table>
</div></body></html>