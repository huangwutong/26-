<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0041)http://jsptestonline.cosoft.org.cn/senior/none_xt.jsp -->

<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!Connection con;
boolean debug=false;
String studentID="";
String mn_testID="";
String mn_test_name="";
Statement stmt=null;
ResultSet rs=null;
String sql="";
int test_num=-1;
String test_paper="";
String [] arrTestID=null;
int mn_testValid=0;
public class testItem{
  int id;
  int subid;
  String title;
  boolean old=false;//�ÿ����Ƿ��Ѿ������Ծ�
    public String toString(){
     String temp="";
     temp="<br> id="+id+"<br> subid="+subid+"<br> title="+title+"<br> old="+old+"<br>";
     return temp;
   }
};

%>
<%
Vector test=new Vector();

    studentID=(String)request.getParameter("stuID");
    //Tools.showalert(studentID,out);
    mn_testID=(String)request.getParameter("mn_testID");
    if(debug){
        out.print("<br>stuID="+studentID+"<br>mn_testID="+mn_testID);

    }
try{

    con=DBCon.getConnection();
    //��ѯ��ʽ����(mn_testID)��Ϣ
    sql=" select name,test_num,test_paper,begin_date,end_date, "+
        " IF(CURRENT_DATE>end_date OR CURRENT_DATE<begin_date,0,1) as valid "+
        " from mn_test where id="+mn_testID;
    try{
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    if(rs.next()){
        mn_testValid=rs.getInt("valid");

        test_num=rs.getInt("test_num");
        test_paper=rs.getString("test_paper");
        mn_test_name=rs.getString("name");
        rs.close();
        stmt.close();
    }
    if(mn_testValid==0){
        Tools.showalert("�����ʽ���Ե�ǰ�Ѿ���Ч�������������е��Ծ�\\n��ϵͳ����¼�ɼ���������������ϵͳ����Ա��ϵ��",out);
    }

    }catch(SQLException se){
        out.print("<br> query mn_test error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> query mn_test error sql="+sql);
        out.print("<br>"+e.toString());
    }
    //��������������(test��ID)
    if(debug){
        out.print("<br>test_paper="+test_paper);
    }
    if(test_paper!=null){
    arrTestID=test_paper.split("#");
    sql="";
    for(int i=0;i<arrTestID.length;i++){
        sql+=arrTestID[i]+",";
    }
    sql=sql.substring(0,sql.length()-1);
    sql="select * from test where id in("+sql+") order by subid";
    if(debug){
        out.print("<br>query test sql="+sql);
    }
    //��ѯtest��
    try{
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    while(rs.next()){
        testItem t=new testItem();
        t.id=rs.getInt("id");
        t.subid=rs.getInt("subid");
        t.title=rs.getString("title");
        t.old=false;
        test.addElement(t);

    }
    rs.close();
    stmt.close();

    }catch(SQLException se){
        out.print("<br> query mn_test error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> query mn_test error sql="+sql);
        out.print("<br>"+e.toString());
    }
    if(debug){
        out.print("<br>Vector test="+test.toString());
    }
    //��鿼���Ƿ��������Ծ���ͬ��Ŀ���Ծ�(�˴���ʽ������)

    for(int i=0;i<test.size();i++){
        testItem t=(testItem)test.elementAt(i);
        int testID=t.id;
        //sql="select * from scores where test_class=3 and test_id="+testID+" and stu_id='"+studentID+"'";
        sql="select * from mn_scores where sub_id="+t.subid+" and stu_id='"+studentID+"'"+
            " and mn_test_id="+mn_testID;
        try{
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            if(debug){
                out.print("<br>query mn_scores sql="+sql);
            }
            if(rs.next()){
                //�������Ծ�
                t.old=true;

            }
            rs.close();
            stmt.close();

        }catch(SQLException se){
            out.print("<br> query whether the student do the test error sql="+sql);
            out.print("<br>"+se.toString());
        }
        catch(Exception e){
            out.print("<br> query whether the student do the test error sql="+sql);
            out.print("<br>"+e.toString());
        }

    }
    if(debug){
        out.print("<br>Vector test="+test.toString());
    }
%>


<HTML><HEAD><TITLE>����ϵͳ</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK
href="style/style.css" type=text/css rel=stylesheet>
<SCRIPT src="js/html.js"></SCRIPT>

<SCRIPT src="js/gnb_menus_layer.js"></SCRIPT>

<SCRIPT src="js/menu.js"></SCRIPT>

<SCRIPT src="js/jumpmenu.js"></SCRIPT>

<SCRIPT src="js/Valid.js"></SCRIPT>


<BODY bgColor=#ffffff text=#000000 link="#0000FF" vlink="#0000FF" alink="#0000FF">
<FORM name="form1" action="UnitTestPaper.jsp" method="post">
<CENTER>
  
  <!--begin test -->
  <table width="650" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="title1" align="center"><div align="left">
            <p>&nbsp;</p>
            <p>����˵����ÿ���Ծ�ֻ����һ��(�ύһ��)��ͬһ��Ŀ���Ծ�ֻ��¼��һ�β��Եķ�����</p>
          </div></td>
    </tr>
  </table>
  <br>
  <table id=AutoNumber1 style="BORDER-COLLAPSE: collapse"
height=82 cellspacing=1 width="650" border=0 cellpadding="2" bgcolor="#c1c1c1">
    <tbody>
      <tr class=trh>
        <td align=center bgcolor=#eaeaea> <p align=center><b><%=mn_test_name%></b></p></td>
      </tr>
      <tr class=trh1 bgcolor="#FFFFFF">
        <td align=middle>


              <!--��ʾ�����ʽ���Եĸ����Ծ�-->
              <%

            for(int i=0;i<test.size();i++){
                testItem t=(testItem)test.elementAt(i);
                if(!t.old ){//û���������Ծ�%>


              <p align="left"><B><FONT color=#333300> <a href="mn_test_paper.jsp?testID=<%=t.id%>&stuID=<%=studentID%>&mn_testID=<%=mn_testID%>&old=0&valid=<%=mn_testValid%>"
                        title="<%=t.title%>"
				  		target="mainFrame">�� <%=t.title%> </a></FONT></B></p>


              <%}else{//�������Ծ�%>


              <p align="left"><B><FONT color=#333300> <a href="mn_test_paper.jsp?testID=<%=t.id%>&stuID=<%=studentID%>&mn_testID=<%=mn_testID%>&old=1&valid=<%=mn_testValid%>"
                        title="<%=t.title%>"
				  		target="mainFrame">�� <%=t.title%> </a></FONT></B></p>


              <%
                }


            }
        %>

          </td>
      </tr>
    </tbody>
  </table>
  <table cellspacing=0 cellpadding=8 width=650 border=0>
    <tbody>
    <tr>
        <td align=center>
          <!--begin botton-->
          &nbsp;&nbsp;
          <input id="mn_testID"
      type="hidden" value="<%=mn_testID%>" name="mn_testID">


          <!--end button-->
        </td>
    </tr>
    </tbody>
  </table>
  <!--end test -->
  <!--begin bottom -->
  <TABLE
style="BORDER-TOP: #dbdbdb 1px solid; MARGIN-TOP: 10px; MARGIN-BOTTOM: 10px; BACKGROUND-COLOR: #f6f6f6"
cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD align=middle colSpan=2 height=30>
      </TD></TR></TBODY></TABLE><!--end bottom --></CENTER>
			</form>
			</BODY></HTML>

<%
}//if test_paper!=null
else{
Tools.showalert("�ô���ʽ���Ի�û�з����Ծ������ĵȴ�����ϵͳ����Ա��ϵ",out);
Tools.showJS("window.close()",out);
}

}catch(Exception e){
    System.out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>