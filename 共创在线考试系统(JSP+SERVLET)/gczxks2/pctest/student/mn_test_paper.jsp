<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jinghua.*"%>
<%@ page import="java.text.*" %>

<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%! boolean debug=false;%>
<%
String testID=request.getParameter("testID");
String studentID=request.getParameter("stuID");
String mn_testID=request.getParameter("mn_testID");

if(debug){
    out.print("<br>mn_testID="+mn_testID);
}

ResultSet rs=null;
String sql="";
String title="";
int testnum=0;
int testmark=0;

int old=Integer.parseInt(request.getParameter("old"));
if(old==1){
    Tools.showalert("������ʽ������������ͬ��Ŀ���Ծ���ϵͳ�Ѿ���¼������һ�����ÿ�Ŀ�Ծ�ĳɼ���"+
        "\\n����������������Ծ���ϵͳ����¼�ɼ���������������ϵͳ����Ա��ϵ��",out);
}
int valid=Integer.parseInt(request.getParameter("valid"));
PreparedStatement pstmt=null;
Statement stmt=null;
StringBuffer dbmsg=new StringBuffer();
StringBuffer testIDs=new StringBuffer();
//StringBuffer Answer=new StringBuffer();
//StringBuffer Mark=new StringBuffer();
int testNumber=0;
try{
    Connection con=DBCon.getConnection();

    if(old==0){
    //��ѯ�Ƿ���ɹ���ͬ��Ŀ�Ŀ��ԣ�
    int sub_id=-1;
    sql="select subid from test where id="+testID;
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        if(rs.next()){
            sub_id=rs.getInt("subid");
        }
        rs.close();
        stmt.close();

        if(debug){
            out.print("<br>query test sub sql="+sql);
        }
    }
    catch(SQLException se){
        out.print("<br>query test sub sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br>query test sub sql="+sql);
        out.print("<br>"+e.toString());
    }

    sql=" select count(*) as tested_sub from mn_scores where mn_test_id="+mn_testID+
        " and stu_id='"+studentID+"' and sub_id="+sub_id;
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        if(rs.next()){
            old=rs.getInt("tested_sub");
            if(old==1){
                 Tools.showalert("������ʽ������������ͬ��Ŀ���Ծ���ϵͳ�Ѿ���¼������һ�����ÿ�Ŀ�Ծ�ĳɼ���"+
            "\\n����������������Ծ���ϵͳ����¼�ɼ���������������ϵͳ����Ա��ϵ��",out);
            }

        }
        rs.close();
        stmt.close();

        if(debug){
            out.print("<br>query sub old sql="+sql);
        }
    }
    catch(SQLException se){
        out.print("<br>query sub old sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br>query sub old sql="+sql);
        out.print("<br>"+e.toString());
    }

    }//end if(old==0)

    sql="select id,paper,title,testnum from test where id="+testID;
    pstmt=con.prepareStatement(sql);
    rs=pstmt.executeQuery();

    if(rs.next()){
        //�������⣺����ID@��@����@���׶�;     һ������ĸ�ʽ����#�Ž���
        String paper=rs.getString("paper");

        title=rs.getString("title");
        testnum=rs.getInt("testnum");

        if(debug) dbmsg.append("<br>paper="+paper);
        String [] tests=paper.split("#");
        for(int i=0;i<tests.length;i++){
            //ȡ�������
            String [] test=tests[i].split("@");
            testIDs.append(test[0]+",");//���
            //Answer.append(test[1]+"#");//��
			//Mark.append(test[2]+"#");

            testmark+=Float.parseFloat(test[2]);
        }
        sql=testIDs.toString().substring(0,testIDs.length()-1);
        sql="select id,questtext,mark from question where id in ("+sql+") order by id";
		rs.close();
        pstmt.close();


        pstmt=con.prepareStatement(sql);
        rs=pstmt.executeQuery();



%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0041)http://jsptestonline.cosoft.org.cn/senior/none_xt.jsp -->
<HTML><HEAD><TITLE>����ϵͳ-<%=title%></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK
href="style/style.css" type=text/css rel=stylesheet>
<SCRIPT src="js/html.js"></SCRIPT>

<SCRIPT src="js/gnb_menus_layer.js"></SCRIPT>

<SCRIPT src="js/menu.js"></SCRIPT>

<SCRIPT src="js/jumpmenu.js"></SCRIPT>

<SCRIPT src="js/Valid.js"></SCRIPT>

<META content="MSHTML 6.00.2722.900" name=GENERATOR></HEAD>
<BODY text=#000000 bgColor=#ffffff>
<CENTER><form  ACTION="mn_test_rs.jsp"  method="post" name="viewdatabase" target="_blank">
  
  <!--begin test -->
  <table width="650" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td class="title1" align="center"><font color="#74a8d1" size="+2">
                            <strong><B>
                                <%=title%>
                                    </B>
                            </strong>
                        </font></td>
    </tr>
  </table>
  <br>
  <table id=AutoNumber1 style="BORDER-COLLAPSE: collapse"
height=82 cellspacing=1 width="650" border=0 cellpadding="2" bgcolor="#c1c1c1">
    <tbody>
      <tr class=trh>
        <td align=center width=80 bgcolor=#eaeaea><b>���</b></td>
        <td align=middle bgcolor=#eaeaea> <p align=center><b>��<%=testnum%>��,<%=testmark%>��</b></p></td>
      </tr>
	  <%while(rs.next()){%>
      <tr class=trh1 bgcolor="#FFFFFF">
        <td align=middle width=80>��
          <table width="100%" border=0>
            <tbody>
              <tr>
                <td> <center>
                   <%=(++testNumber)%> </center></td>
              </tr>
              <tr>
                <td> <center>
                      <%DecimalFormat df=new DecimalFormat("###");
                  String numNF=df.format(rs.getFloat("mark"));
              out.print("("+numNF+"��)");%>
                    </center></td>
              </tr>
            </tbody>
          </table></td>
        <td align=left>
		<br>
         <%=rs.getString("questtext")%>
		 <br>
		 </td>
      </tr>

	  <%}
    rs.close();
    pstmt.close();
    %>
    </tbody>
  </table>
  <table cellspacing=0 cellpadding=8 width=650 border=0>
    <tbody>
    <tr>
      <td align=center>
        <!--begin botton-->
        <input class=s02 type=submit value=�ύ name=submit1>
        &nbsp;&nbsp;
        <input class=s02 type=reset value=���� name=submit2>
        <input name="testid" type="hidden" id="testid2" value="<%=testID %>">
          <input name="studentid" type="hidden" id="studentid2" value="<%=studentID %>">
		  <input id=mn_testID type="hidden" value=<%=mn_testID%> name="mn_testID">
          <input name="valid" type="hidden" id="valid" value="<%=valid%>">
          <input name="old" type="hidden" id="old" value="<%=old%>">
        <!--end button-->
      </td>
    </tr>
    </tbody>
  </table>
  <!--end test -->
  <!--begin bottom -->
  <!--end bottom --></form></CENTER></BODY></HTML>




<%
}else{
        Tools.showalert("�����ݿ���ȡ���������û���ҵ���Ӧ�Ծ�!",out);
        Tools.goback(out);

}
}catch(SQLException e){
    out.print("<br>SQL Error:sql="+sql+"<br>"+e.toString());
}catch(Exception e){
    out.print(e.toString() );
}
finally{
    DBCon.dropConnection();
}
%>
