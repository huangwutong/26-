<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page errorPage="QuestGen_error.jsp" %>

<HTML><HEAD><TITLE>在线测试</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK
href="../common/css/style.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2462.0" name=GENERATOR>
<script>
function GetMnMart()
{
	document.URL = "Query_mark_mn.jsp";

}
</script>
</HEAD>
<BODY>
　
<P align="center" class="word"><strong> 选择查询成绩的类型</strong></P>
  <div align="center">
    
  <table bordercolor=#d3add1 height=226 width="38%" border=1>
    <tbody>
      <tr> 
        <td align="center" valign=middle background=images/lvbgcolor.gif> 
          <div align="center"> 
            <p class="word">
              <input type="button" name="Submit2" value="正式考试" onClick="GetMnMart()">
            </p>
          </div>
          <div align="left"> 
            <p align="center" class="word">
              <label></label>
              <br>
            </p>
          </div></td>
      </tr>
    </tbody>
  </table>
  </div>
  <P> </P>
<P>&nbsp;</P>
<P>&nbsp;</P>

</BODY></HTML>
