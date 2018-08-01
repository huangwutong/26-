<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="jinghua.*"%>
<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!boolean debug=false;
Connection con=null;
class Test{
    long id;
    String name;
    String grade;
    String time;
    float mark;
    String paper;
	int testnum;
	int mntotalmark;
	long mntestID;
    public String toString(){
        String temp="";
        temp="<br> id="+id+"<br> name="+name;
        return temp;
   }
};

%>
<%
String testID=request.getParameter("testID");
String mntestID=request.getParameter("mntestID");
if(debug){
    out.print("<br>testID="+testID+
		"<br>mntestID="+mntestID);
}
String [] ids=request.getParameterValues("id");
if(ids==null || testID==null|| mntestID==null)
	throw new Exception("调用参数不足!");
Test t=new Test();
t.id=Long.parseLong(testID);
t.mntestID=Long.parseLong(mntestID);

String sql=null;
StringBuffer sb=null;
ResultSet rs=null;
Statement stmt=null;

try{
    con=DBCon.getConnection();
	con.setAutoCommit(false);
	sql="SELECT   `mn_test`.`mntotalmark` FROM  `mn_test`"+
		" WHERE  (`mn_test`.`id` = "+t.mntestID+")";
	stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
	if(rs.next()){
		t.mntotalmark=rs.getInt("mntotalmark");
		rs.close();
		stmt.close();
	}
	else{
		rs.close();
		stmt.close();
		throw new Exception("没有查询到正式考试的总分!");
	}


	sql="SELECT  `test`.`paper`,`test`.`testnum`,`test`.`mark` "+
		" FROM  `test` WHERE  (`test`.`id` = "+t.id+")";
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);

    if(rs.next()){
    	t.paper=rs.getString("paper");
		t.mark=rs.getFloat("mark");
		t.testnum=rs.getInt("testnum");
		rs.close();
    	stmt.close();
	}
	else{
		rs.close();
		stmt.close();
		throw new Exception("没有查询到试卷信息!");
	}

    if(debug) out.print("<br>mntotalmark="+t.mntotalmark+
				"<br>test paper="+t.paper+
				"<br>testnum="+t.testnum+
				"<br>mark="+t.mark);

	for(int i=0;i<ids.length;i++){
	//删除一道题
	if(debug) out.print("<br>delete quest id="+ids[i]);

	int pos1=0,pos2=0;
	pos1=t.paper.indexOf(ids[i]);
	if(pos1>=0){
		pos2=t.paper.indexOf('#',pos1);
		if(pos2>0){
			if(debug) out.print("<br>pos1="+pos1+" pos2="+pos2);
			String quest=t.paper.substring(pos1,pos2);
			if(debug) out.print("<br>quest paper="+quest);
			String [] temp=quest.split("@");
			float questmark=Float.parseFloat(temp[2]);
			if(debug) out.print("<br> quest id="+temp[0]+
        							" mark="+temp[2]);
			t.mark-=questmark;
			t.testnum--;
			t.mntotalmark-=questmark;
			t.paper=t.paper.substring(0,pos1)+t.paper.substring(pos2+1);

			sql="delete from question where ID="+ids[i];
			stmt=con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			if(debug) out.print("<br>delete quest sql="+sql);


		}
	}



}//end for i
sql="update test set paper='"+t.paper+"',testnum="+t.testnum+",mark="+t.mark+
	" where id="+t.id;
stmt=con.createStatement();
stmt.executeUpdate(sql);
stmt.close();
if(debug)
	out.print("<br>update test sql="+sql);
sql="update mn_test set mntotalmark="+t.mntotalmark+
	" where id="+t.mntestID;
stmt=con.createStatement();
stmt.executeUpdate(sql);
stmt.close();
if(debug)
	out.print("<br>update mn_test sql="+sql);
con.commit();
if(!debug)
	response.sendRedirect("modify_test_mn_paper.jsp?testID="+t.id+"&mnID="+t.mntestID);

        //Tools.showJS("window.open('admin_subject.jsp','_self')",out);
}
catch(SQLException se){
	con.rollback();
	out.println(se.toString());
	out.print("<br>sql="+sql);
}
catch(Exception e){
	con.rollback();
	out.print("<br>"+e.toString());
}
finally{
	DBCon.dropConnection();
}


%>
