<%@ page contentType="application/msword; charset=gb2312" language="java" import="java.sql.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="jinghua.*"%>
<%@ page import="java.util.*"%>
<%@ page import = "jinghua.chart.servlet.WebHitChart" %>
<%@ page import = "jinghua.chart.servlet.WebHitDataSet" %>
<%@ page import = "java.io.PrintWriter" %>

<jsp:useBean id="DBCon" class="jinghua.JinghuaConn" scope="session">
</jsp:useBean>
<%!Connection con;
//查询参加某次正式考试的所有考生的ID
String colwidth="";
boolean debug=false;
String studentID="";
String gradenote="";
String gradename="";
int maxHisSubNum =0;
String mn_testID="";
Statement stmt=null;
ResultSet rs=null;
String sql="";
String test_subs="";
int sub_num=0;
int have_test=0;
int i=0;
int j=0;
long i10=0;
long i30=0;
float f10=0;
float f30=0;
DecimalFormat df=new DecimalFormat("####.00");
class mn_test{
    String id;
    String name;
    String gradenote;
    String subs;
    String totalMark;
    int sub_num;
    int testPeople;//全部参加人数
    //参加完所有测试的考生的ID，用","分隔
	int flag;//1:complete;2:uncomplete;3:do not any test;
    public String toString(){
        String temp="";
        temp="<br> id="+id+"<br> name="+name;
        return temp;
   }
};
class student{
    String id;
    String name;
    String jh_area;
    String school;
    String jh_area_sch;
    String grade;
    String test_date;
    int total_mark;//总分
    String avgTop10;//top 10%的总分
    String avgTop30;
    int posAll;//全部排名
    int posPercent;//100人排名

    public String toString(){
        String temp="";
        temp="<br> id="+id+"<br> name="+name+"<br> grade="+grade+"<br>jh_area="+jh_area+
        "<br>school="+school+"<br>jh_area_sch="+jh_area_sch+"<br>test_date="+test_date;
        return temp;
   }
};
class History{
    long id;
    String stu_id;
    String mn_test_id;
    int sub_num;
    int testPeople;
    String tested_id;
    int totalmark;
    String position;
    String top10avg;
    String top30avg;
    String testdate;
    String [] sub_names;
    String [] sub_marks;
    String debug;
    public String toString(){
        String temp="";
        temp="<br> id="+id+"<br> stu_id="+stu_id+"<br> mn_test_id="+mn_test_id+
            "<br>totalmark="+totalmark+"<br>position="+position+
            "<br>top10avg="+top10avg+"<br>top30avg="+top30avg;
        return temp;
   }
};
class Subject{
    int sub_id;
    String name;
    String totalMark;
    String realMark;
    String avgArea;
    String avgTotal;
    String avgTop10;
    String avgTop30;
    String posAll;//全部排名
    String posPercent;//100人排名
    int testnum=0;//试题数目
    String [] arrAnswer;
    String [] arrMark;
    String [] arrSubAnswer;
    String [] arrTF;
    String [] arrDif;
    String [] arrSubMark;
    String [] arrRate;//准确率
    String [] arrID;//question id数组
    public String toString(){
        String temp="";
        temp="<br> sub_id="+sub_id+"<br> name="+name+"<br> totalMark="+totalMark+
        "<br>avgArea="+avgArea+"<br>avgTotal="+avgTotal+"<br>avgTop10="+avgTop10+
        "<br>avgTop30="+avgTop30+ "<br>posAll="+posAll+ "<br>posPercent="+posPercent;
        return temp;
   }
};
mn_test mnTest;
student Student;
Vector subs;
Vector hisRS;
%>
<%


try{
    studentID=request.getParameter("stuID");
	mn_testID=request.getParameter("mn_testID");
    //Tools.showalert(studentID,out);

}catch(Exception e){
    Tools.showalert("您还没有登录，或连接超时，请重新登录!",out);
    Tools.showJS("window.open('../login.jsp','_self')",out);
}

try{
    con=DBCon.getConnection();
	String filenamemn =request.getParameter("filenamemn");// WebHitChart.generateMnBarChart(Long.parseLong(mn_testID), session, new PrintWriter(out));
	String graphURLmn = request.getContextPath()+"/chart/temp/"+filenamemn; //+ "/servlet/DisplayChart?filename=" + filenamemn;

    String filenamestu = request.getParameter("filenamestu");//WebHitChart.generateStuHisXYChart(studentID, Long.parseLong(mn_testID),session, new PrintWriter(out));
	String graphURLstu = request.getContextPath()+"/chart/temp/"+filenamestu; //+ "/servlet/DisplayChart?filename=" + filenamestu;

    out.print("<br>graphURLmn="+graphURLmn);
    out.print("<br>graphURLstu="+graphURLstu);
    //获取考生的计算机等级信息
    sql=" SELECT   `grade`.`Name`,  `grade`.`note` FROM"+
        "  `grade`  INNER JOIN `UserInfo` ON (`grade`.`note` = `UserInfo`.`gradenote`)"+
        " WHERE  (`UserInfo`.`vcUserNo` = '"+studentID+"')";

    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);

        if(rs.next()){
            gradenote=rs.getString("note");
            gradename=rs.getString("Name");
            rs.close();
            stmt.close();
        }
        if(debug){
            out.print("<br>stuID="+studentID+"<br>gradenote="+gradenote);
        }
    }
    catch(SQLException se){
        out.print("<br> query student error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> query student error sql="+sql);
        out.print("<br>"+e.toString());
    }



    //获取正式考试的科目信息
    sql="select * from mn_test where id="+mn_testID;
    try{
        mnTest=new mn_test();
        Student=new student();
        subs=new Vector();
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        if(rs.next()){
            mnTest.subs=rs.getString("subs");
			if(mnTest.subs==null)
				mnTest.subs="-1";
			else if(mnTest.subs.equals(""))
				mnTest.subs="-1";
            mnTest.id=mn_testID;
            mnTest.name=rs.getString("name");
            mnTest.sub_num=rs.getInt("sub_num");
            mnTest.gradenote=gradenote;
            mnTest.testPeople=rs.getInt("testpeople");
        }
		rs.close();
        stmt.close();
        if(debug){
            out.print("<br>mn_test_subs="+mnTest.subs+"<br>sub_num="+mnTest.sub_num);
        }
    }
    catch(SQLException se){
        out.print("<br> query mn_test error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> query mn_test error sql="+sql);
        out.print("<br>"+e.toString());
    }
    //
    //如果完成了正式考试，
    have_test=0;
    sql="select count(*) as have_test from mn_history where stu_id='"+studentID+"' and mn_test_id="+mn_testID;
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        if(rs.next()){
            have_test=rs.getInt("have_test");
        }
        rs.close();
        stmt.close();

        if(debug){
            out.print("<br>query mn_history sql="+sql);
        }
    }
    catch(SQLException se){
        out.print("<br>query mn_history sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br>query mn_history sql="+sql);
        out.print("<br>"+e.toString());
    }
    //查询该考生是否完成该正式考试中的所有测试

%>


<%if(mnTest.sub_num==0){
    				Tools.showalert("正式考试还没有进行！",out);
                    Tools.showJS("window.close()",out);
				}else if (have_test<1){
		    		Tools.showalert("您还没有全部参加完这次正式考试的各科测试，不能统计分数！",out);
                    Tools.showJS("window.close()",out);
				}else{


    //查询正式考试的总分
    sql="select FORMAT(sum(mark),0) as totalmark from test,mn_scores "+
        "where test.id=mn_scores.test_id and mn_test_id="+mn_testID+" and stu_id='"+
        studentID+"'";
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        if(rs.next()){
            mnTest.totalMark=rs.getString("totalmark");
        }
		rs.close();
        stmt.close();
        if(debug){
            out.print("<br>mn_test totalMark sql="+sql);
            out.print("<br>mn_test totalMark="+mnTest.totalMark);
        }
    }
    catch(SQLException se){
        out.print("<br> query totalpeople error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> query totalpeople error sql="+sql);
        out.print("<br>"+e.toString());
    }



    //查询考生信息，生成成绩单，考试日期取为所有试卷最后做的时间
    sql="SELECT   `UserInfo`.`vcName`,  `UserInfo`.`vcUserNo`, "+
    "  DATE_FORMAT(`mn_scores`.`test_date`,\"%Y-%m-%e\") as test_date,  `UserInfo`.`vcSchool`,  `UserInfo`.`jh_area`,CONCAT(`UserInfo`.`jh_area`,'<br>(',`UserInfo`.`vcSchool`,')') AS jh_area_sch "+
    "FROM  `UserInfo`  LEFT OUTER JOIN `grade` ON (`UserInfo`.`gradenote` = `grade`.`note`) "+
    "LEFT OUTER JOIN `mn_scores` ON (`UserInfo`.`vcUserNo` = `mn_scores`.`stu_id`) "+
    "WHERE UserInfo.vcUserNo='"+studentID+"' and mn_scores.mn_test_id="+mn_testID+
    " and mn_scores.stu_id='"+studentID+"'"+
    " ORDER BY test_date DESC"+
    " LIMIT 1";
    try{
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    if(rs.next()){


        Student.grade=gradename;
        Student.id=rs.getString("vcUserNo");
        Student.jh_area=rs.getString("jh_area");
        Student.jh_area_sch=rs.getString("jh_area_sch");
        Student.name=rs.getString("vcName");
        Student.school=rs.getString("vcSchool");
        Student.test_date=rs.getString("test_date");

    }
        rs.close();
        stmt.close();
        if(debug){
            out.print("<br> query student info  sql="+sql);
            //out.print("<br>student info="+Student.toString());
        }
    }
    catch(SQLException se){
        out.print("<br> query student info error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> query student info error sql="+sql);
        out.print("<br>"+e.toString());
    }

    //成绩和排名
    //总分

    try{
    //个人总分
    sql=" SELECT mn_history.stu_id,mn_history.mn_test_id,  FORMAT(SUM(mn_scores.score),0) AS totalmark"+
        " FROM  `mn_history`  LEFT OUTER JOIN `mn_scores` ON  (`mn_history`.`mn_test_id` = `mn_scores`.`mn_test_id`) "+
        "   AND (`mn_history`.`stu_id` = `mn_scores`.`stu_id`) "+
        " WHERE mn_history.mn_test_id="+mnTest.id+" and mn_history.stu_id ='"+Student.id +"'"+
        " GROUP BY mn_history.stu_id,mn_history.mn_test_id"+
        " ORDER BY  totalmark desc";
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);
    if(debug)
        out.println("<br><br><br> person totalmark sql="+sql);
    if(rs.next()){
        Student.total_mark=rs.getInt("totalmark");
    }
    else{
        Student.total_mark=0;
    }
    rs.close();
    stmt.close();

    //排名
    i10=Math.round(mnTest.testPeople *0.1);//top10
    i30=Math.round(mnTest.testPeople *0.3);
    if(i10==0) i10=1;
    if(i30==0) i30=1;
    f10=0;
    f30=0;

    sql=" SELECT mn_history.stu_id,mn_history.mn_test_id,  FORMAT(SUM(mn_scores.score),0) AS totalmark"+
        " FROM  mn_history LEFT OUTER JOIN mn_scores ON(mn_history.stu_id=mn_scores.stu_id) "+
        " AND (`mn_history`.`mn_test_id` = `mn_scores`.`mn_test_id`)"+
        " WHERE mn_history.mn_test_id="+mnTest.id+
        " GROUP BY mn_history.stu_id,mn_history.mn_test_id"+
        " ORDER BY  totalmark desc";
    stmt=con.createStatement();
    rs=stmt.executeQuery(sql);

    i=0;
    int imark=0;
    int tempPos=1;
    float fmark=0;
    int tmark=Integer.MAX_VALUE;
    while(rs.next()){
        i++;
        imark=rs.getInt("totalmark");
        fmark=rs.getFloat("totalmark");

        if(i<=i10)
            f10+=fmark;
        if(i<=i30)
            f30+=fmark;
        //查找分数的排名

        if(debug){
            out.print("<br><br>student totalmark="+Student.total_mark +
            "<br>sql totalmark="+rs.getInt("totalmark"));
        }
        if(Student.total_mark==imark){
            Student.posAll=tempPos;
            if(mnTest.testPeople>100)
                Student.posPercent=100*tempPos/mnTest.testPeople;
            else
                Student.posPercent=tempPos;
        }
        else if(tmark>imark){//分数不同
            tempPos++;
            tmark=imark;
        }



    }
    rs.close();
    stmt.close();
    Student.avgTop10=df.format(f10/i10);
    Student.avgTop30=df.format(f30/i30);


    if(debug){
        out.print("<br>Query student's position: sql="+sql);
    }
    }
    catch(SQLException se){
        out.print("<br> Query student's position sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> Query student's total position sql="+sql);
        out.print("<br>"+e.toString());
    }

    //各科目的成绩单

    sql=" SELECT  test.paper as testpaper,test.testnum as testnum,mn_scores.test_rs,`subject`.`id` AS  `subid`,`subject`.`Name` AS `subname`,  FORMAT(`test`.`mark`,0) AS `totalmark`,  FORMAT(`mn_scores`.`score`,0) AS `score` "+
        " FROM  `mn_scores`  LEFT OUTER JOIN `subject` ON (`mn_scores`.`sub_id` = `subject`.`ID`)"+
        " LEFT JOIN `test` ON (`mn_scores`.`test_id` = `test`.`id`)"+
        " WHERE  (`mn_test_id` = "+mnTest.id+") AND (`stu_id` = '"+Student.id+"')"+
        " ORDER BY `subid`";
    try{
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        String temp=null;
        String [] arrtemp=null;
        String [] tests=null;
        while(rs.next()){
            Subject s=new Subject();
            s.sub_id=rs.getInt("subid");
            s.name=rs.getString("subname");
            s.totalMark=rs.getString("totalmark");
            s.realMark=rs.getString("score");
            s.testnum=rs.getInt("testnum");
            //处理试题信息
            temp=rs.getString("testpaper");
            tests=temp.split("#");

            StringBuffer Answer=new StringBuffer();
            StringBuffer Mark=new StringBuffer();
            StringBuffer Dif=new StringBuffer();
            StringBuffer testIDs=new StringBuffer();
            StringBuffer Rate=new StringBuffer();
            for(i=0;i<s.testnum;i++){
                //取回试题号
                arrtemp=tests[i].split("@");

                testIDs.append(arrtemp[0]+",");//题号
                Rate.append(T_Question.getCorrectRate(con,Integer.parseInt(arrtemp[0]))+",");
                Answer.append(arrtemp[1]+",");//答案
			    Mark.append(arrtemp[2]+",");
                Dif.append(arrtemp[3]+",");
            }
            s.arrAnswer=Answer.toString().split(",");
            s.arrDif=Dif.toString().split(",");
            s.arrMark=Mark.toString().split(",");
            s.arrID=testIDs.toString().split(",");
            s.arrRate=Rate.toString().split(",");
            Answer=null;
            Mark=null;
            Dif=null;
            testIDs=null;
            //处理科目考试结果
            temp=rs.getString("test_rs");
            arrtemp=temp.split("#");
            //s.arrAnswer=arrtemp[0].split(",");
            //s.arrMark=arrtemp[1].split(",");
            s.arrSubAnswer=arrtemp[0].split(",");
            s.arrTF=arrtemp[1].split(",");
            //s.arrDif=arrtemp[4].split(",");
            s.arrSubMark=arrtemp[2].split(",");



            subs.addElement(s);
        }
		rs.close();
        stmt.close();
        if(debug){
            out.print("<br>subject info sql="+sql);
            out.print("<br>subject info="+subs.toString());
        }
    }
    catch(SQLException se){
        out.print("<br> subject info error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> subject info error sql="+sql);
        out.print("<br>"+e.toString());
    }
    //科目的平均

    try{
        //分校平均
        sql="SELECT   `UserInfo`.`jh_area`,  `mn_history`.`mn_test_id`,  `mn_scores`.`sub_id`,"+
        "  FORMAT(AVG(`mn_scores`.`score`),2) AS `score_avg`"+
        "  FROM  `mn_history` "+
        "  LEFT OUTER JOIN `mn_scores` ON (`mn_history`.`stu_id` = `mn_scores`.`stu_id`) "+
        "  AND (`mn_history`.`mn_test_id` = `mn_scores`.`mn_test_id`)"+
        "  LEFT OUTER JOIN `UserInfo` ON (`mn_history`.`stu_id` = `UserInfo`.`vcUserNo`) "+
        "  WHERE"+
        "  (`UserInfo`.`jh_area` = '"+Student.jh_area+"') AND "+
        "  (`mn_history`.`mn_test_id` = "+mnTest.id+") "+
        "  GROUP BY  `UserInfo`.`jh_area`,  `mn_history`.`mn_test_id`,  `mn_scores`.`sub_id`"+
        "  ORDER BY  `mn_scores`.`sub_id`";


        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        i=0;
        Subject s=null;
        while(rs.next()){
            s=(Subject)subs.elementAt(i);
            s.avgArea=rs.getString("score_avg");
            i++;
        }
		rs.close();
        stmt.close();
        if(debug){
            out.print("<br>subject area_avg sql="+sql);
            out.print("<br>subject info="+subs.toString());
        }

        //全体平均
        sql="SELECT  `mn_scores`.`mn_test_id`,  `mn_scores`.`sub_id`,"+
        "  FORMAT(AVG(`mn_scores`.`score`),2) AS `score_avg`"+
        "  FROM  mn_history LEFT OUTER JOIN mn_scores ON(mn_history.stu_id=mn_scores.stu_id) "+
        "  AND (`mn_history`.`mn_test_id` = `mn_scores`.`mn_test_id`)"+
        "  WHERE mn_history.mn_test_id="+mnTest.id+
        "  GROUP BY   `mn_scores`.`mn_test_id`,  `mn_scores`.`sub_id`"+
        "  ORDER BY   `mn_scores`.`sub_id`";
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        i=0;
        s=null;
        while(rs.next()){
            s=(Subject)subs.elementAt(i);
            s.avgTotal=rs.getString("score_avg");
            i++;
        }
		rs.close();
        stmt.close();
        if(debug){
            out.print("<br>subject total sql="+sql);
            out.print("<br>subject info="+subs.toString());
        }

    }
    catch(SQLException se){
        out.print("<br> subject total error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> subject total error sql="+sql);
        out.print("<br>"+e.toString());
    }
    //10% top 30% top
    //
    DecimalFormat df=new DecimalFormat("####.##");
    for(j=0;j<subs.size();j++){
    //每一科目
    Subject s=(Subject)subs.elementAt(j);
    try{
        sql="  SELECT mn_history.mn_test_id,mn_history.stu_id, mn_scores.score, mn_scores.sub_id "+
            "  FROM  mn_history LEFT OUTER JOIN mn_scores ON(mn_history.stu_id=mn_scores.stu_id) "+
            "  AND (`mn_history`.`mn_test_id` = `mn_scores`.`mn_test_id`)"+
            "  WHERE mn_history.mn_test_id="+mnTest.id+
            "  AND  sub_id="+s.sub_id+
            "  ORDER BY mn_scores.score DESC";

        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        //top10
        i10=Math.round(mnTest.testPeople *0.1);
        i30=Math.round(mnTest.testPeople *0.3);
        if(i10==0) i10=1;
        if(i30==0) i30=1;
        f10=0;
        f30=0;
        if(debug){
            out.print("<br><br><br>Begin:j="+j+"<br>sub_name="+s.name +
            "<br>f10="+f10+"<br>i30="+i30+"<br>f30="+f30);

        }
        i=0;

        int tempPos=1;
         float fmark=Float.MAX_VALUE;

        float tempf=0;
        float realf=Float.parseFloat(s.realMark);
        if(debug){
            out.print("<br>top10-top30:"+
                "<br>i10="+i10+
                "<br>i30="+i30);
        }
        while(rs.next()){
            tempf=rs.getFloat("score");

            if(debug){
                out.print("<br>sub_real_mark="+realf+
                "<br>rs:score="+tempf);
            }
            i++;

            if(i<=i10)
                f10+=tempf;
            if(i<=i30)
                f30+=tempf;

            if(tempf==realf){
                        s.posAll=String.valueOf(tempPos);
                        if(mnTest.testPeople<=100)
                            s.posPercent=s.posAll;
                        else
                            s.posPercent=String.valueOf(100*tempPos/mnTest.testPeople);
            }
            else if(fmark>tempf){
                tempPos++;
                fmark=tempf;
           }
        }
        if(debug){
            out.print("<br>end:i10="+i10+"<br>f10="+f10+"<br>i30="+i30+
                "<br>f30="+f30+"<br>posall="+s.posAll);
        }
        rs.close();
        stmt.close();
        df=new DecimalFormat("####.00");
        s.avgTop10=df.format(f10/i10);
        s.avgTop30=df.format(f30/i30);


        if(debug){
            out.print("<br>avgTop10="+s.avgTop10+"<br>avgTop30="+s.avgTop30);
            out.print("<br>subject top10-30 sql="+sql);
        }

    }
    catch(SQLException se){
        out.print("<br> subject info error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> subject info error sql="+sql);
        out.print("<br>"+e.toString());
    }


    }//end for


    //更新历史记录
    //先将这次查询的结果存入mn_history
    try{
        sql=" select * from mn_history where mn_test_id="+mnTest.id+
            " and stu_id='"+Student.id+"'";
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        if(rs.next()){
            rs.close();
            stmt.close();
            StringBuffer sb=new StringBuffer();
            for(i=0;i<subs.size();i++){
                Subject s=(Subject)subs.elementAt(i);
                sb.append(s.name+":"+s.realMark+"#");
                }


            sql=" update mn_history set totalmark="+Student.total_mark+","+
                " submark='"+sb.toString()+"',test_date='"+Student.test_date+"',"+
                " sub_num="+mnTest.sub_num+","+
                " totalpeople="+mnTest.testPeople+","+
                " position="+Student.posAll+","+
                " top10avg="+Student.avgTop10+","+
                " top30avg="+Student.avgTop30+
                " where stu_id='"+Student.id+"' and mn_test_id="+mnTest.id;

            stmt=con.createStatement();
            stmt.executeUpdate(sql);

            if(debug) out.println("<br>update mn_history sql="+sql);
            stmt.close();

        }
        else{
            //将新记录插入数据库
            rs.close();
            stmt.close();
            StringBuffer sb=new StringBuffer();
            for(i=0;i<subs.size();i++){
                Subject s=(Subject)subs.elementAt(i);
                sb.append(s.name+":"+s.realMark+"#");
                }
            sql=" insert into mn_history(stu_id,mn_test_id,totalmark,submark,test_date,sub_num,"+
                " position,top10avg,top30avg,testpeople) "+
                " values('"+Student.id+"',"+mnTest.id+","+Student.total_mark+",'"+
                    sb.toString()+"','"+Student.test_date+"',"+mnTest.sub_num+","+
                    Student.posAll+","+Student.avgTop10+","+Student.avgTop30+","+mnTest.testPeople+")";
            stmt=con.createStatement();
            stmt.executeUpdate(sql);
            stmt.close();
        }

    }catch(SQLException se){
        out.print("<br> insert into mn_history sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> insert into mn_history sql="+sql);
        out.print("<br>"+e.toString());
    }

    //从mn_history中选取记录 stu_id,mn_test_id,totalmark,submark,test_date
     try{
	 
	 	sql="SELECT   MAX(`mn_history`.`sub_num`) AS `maxsub` FROM  `mn_history`"+
			" WHERE  (stu_id = '"+Student.id+"')";
		stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        
        if(rs.next())
         	maxHisSubNum=rs.getInt("maxsub");
		else
			maxHisSubNum=0;
		rs.close();
		stmt.close();
        sql=" SELECT   `mn_test`.`sub_num`,`mn_test`.`testpeople`,`mn_history`.`totalpeople`,  "+
            " `mn_history`.`mn_test_id`,  `mn_history`.`totalmark`,  `mn_history`.`position`,"+
            " `mn_history`.`top10avg`,  `mn_history`.`top30avg`,  `mn_history`.`submark`,"+
            " DATE_FORMAT(`mn_history`.`test_date`,\"%Y-%m-%e\") AS `test_date`, "+
            " `mn_history`.`stu_id` "+
            " FROM  `mn_history`  LEFT OUTER JOIN `mn_test` ON (`mn_history`.`mn_test_id` = `mn_test`.`id`)"+
            " WHERE  (`mn_history`.`stu_id` = '"+Student.id+"')"+" AND (`mn_test`.`grade_note` = '"+gradenote +"')"+
            " ORDER BY  `test_date` DESC";
        stmt=con.createStatement();
        rs=stmt.executeQuery(sql);
        hisRS=new Vector();
        if(debug)
            out.print("<br> query mn_history sql="+sql);
        String submarks;

        while(rs.next()){
        //构造一条历史记录/

            History h=new History();

            h.sub_num=rs.getInt("sub_num");
            h.testdate=rs.getString("test_date");
            h.mn_test_id=rs.getString("mn_test_id");
            h.stu_id=rs.getString("stu_id");
            h.totalmark=rs.getInt("totalmark");
            submarks=rs.getString("submark");
            h.sub_marks=submarks.split("#");

            if(rs.getInt("testpeople")==rs.getInt("totalpeople")){
                //正式考试的总人数没有变化
                h.top10avg=rs.getString("top10avg");
                h.top30avg=rs.getString("top30avg");
                h.position=rs.getString("position");
                h.testPeople=rs.getInt("totalpeople");
            }
            else{
            //历史排名 //重新求排名
            h.testPeople=rs.getInt("testpeople");
            i10=Math.round(h.testPeople *0.1);//top10
            i30=Math.round(h.testPeople *0.3);
            if(i10==0) i10=1;
            if(i30==0) i30=1;
            f10=0;
            f30=0;
        try{
            sql=" SELECT mn_history.stu_id,mn_history.mn_test_id,  FORMAT(SUM(mn_scores.score),0) AS totalmark"+
                " FROM  mn_history LEFT OUTER JOIN mn_scores ON(mn_history.stu_id=mn_scores.stu_id) "+
                " AND (`mn_history`.`mn_test_id` = `mn_scores`.`mn_test_id`)"+
                " WHERE mn_history.mn_test_id="+h.mn_test_id+
                " GROUP BY mn_history.stu_id,mn_history.mn_test_id"+
                " ORDER BY  totalmark desc";
            Statement tempstmt=con.createStatement();
            ResultSet temprs=tempstmt.executeQuery(sql);

            i=0;
            int imark=0;
            int tempPos=1;
            float fmark=0;
            int tmark=Integer.MAX_VALUE;
            while(temprs.next()){
                i++;
                imark=temprs.getInt("totalmark");
                fmark=temprs.getFloat("totalmark");

                if(i<=i10)
                    f10+=fmark;
                if(i<=i30)
                    f30+=fmark;
                //查找分数的排名

                if(debug){
                    out.print("<br><br>history student totalmark="+Student.total_mark +
                        "<br>sql totalmark="+temprs.getInt("totalmark"));
                }

                if(h.totalmark==imark){
                    h.position=String.valueOf(tempPos);
                    //Student.posAll=tempPos;
                }
                else if(tmark>imark){//分数不同
                    tempPos++;
                    tmark=imark;
                }
            }//end while
            temprs.close();
            tempstmt.close();
            df=new DecimalFormat("####.00");
            h.top10avg=df.format(f10/i10);
            h.top30avg=df.format(f30/i30);

            if(debug){
                out.print("<br>Query history student's position: sql="+sql);
            }
        }
        catch(SQLException se){
            out.print("<br> Query history student's position sql="+sql);
            out.print("<br>"+se.toString());
        }
        catch(Exception e){
            out.print("<br> Query history student's total position sql="+sql);
            out.print("<br>"+e.toString());
        }

        //将查询回的信息写入数据库
        try{
            sql=" update mn_history set "+
                " totalpeople="+h.testPeople+","+
                " position="+h.position+","+
                " top10avg="+h.top10avg+","+
                " top30avg="+h.top30avg+
                " where stu_id='"+Student.id+"' and mn_test_id="+mnTest.id;

            stmt=con.createStatement();

            stmt.executeUpdate(sql);
            if(debug) out.println("<br> update mn_history sql="+sql);
        }
        catch(SQLException se){
            out.print("<br> update history  position sql="+sql);
            out.print("<br>"+se.toString());
        }
        catch(Exception e){
            out.print("<br> update history  position sql="+sql);
            out.print("<br>"+e.toString());
        }

        }//end else

        hisRS.addElement(h);

        }//end while


    }catch(SQLException se){
        out.print("<br> select from mn_history error sql="+sql);
        out.print("<br>"+se.toString());
    }
    catch(Exception e){
        out.print("<br> select from mn_history error sql="+sql);
        out.print("<br>"+e.toString());
    }



    %>






<HTML><HEAD><TITLE>正式考试成绩查询</TITLE>

<style media="print">
.noprint { display: none }
</style>
</HEAD>
<BODY>



<table width="107%" height="440" border="0" align="center" bordercolor=#d3add1>
  <tbody>
      <tr>
        <td height="32" align="center" valign=middle><strong><font size="+2" face="宋体">个人成绩单(表)</font></strong>
        </td>
      </tr>
      <tr>
        <td height="43" align="center" valign=middle><table width="100%" border="0">
          <tr>
            <td width="44%" height="20" nowrap>考试名称:&nbsp;</td>
            <td width="13%">&nbsp;</td>
            <td width="43%" height="20" nowrap>
              <div align="left">单位名称：</div></td>
          </tr>
          <tr>
            <td height="20"><%--=Student.jh_area--%>
              <%=mnTest.name%></td>
            <td>&nbsp;</td>
            <td width="43%" height="20" nowrap>
              <div align="left">单位名称：</div></td>
          </tr>
          <tr>
            <td height="20"><em></em><%--=Student.school--%></em></td>
            <td>&nbsp;</td>
            <td width="43%" height="20" nowrap>
              <div align="left">网址：</div></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="168" align="center" valign="top"><table width="100%" border="1" cellpadding="0" cellspacing="0">
            <tr>

            <td height="24" width="20%">
              <div align="center">所属单位部门</div></td>
              <td width="20%"><div align="center">姓名</div></td>
              <td width="20%"><div align="center">编号</div></td>
              <td width="20%"><div align="center">计算机等级</div></td>
              <td width="20%"><div align="center">考试日期</div></td>
            </tr>
            <tr>

            <td height="24" nowrap>
              <div align="center"><%--=Student.jh_area_sch--%><%=Student.school%></div></td>
              <td><div align="center"><%=Student.name%></div></td>
              <td><div align="center"><%=Student.id%></div></td>
              <td><div align="center"><%=Student.grade%></div></td>
              <td><div align="center"><%=Student.test_date%></div></td>
            </tr>
          </table>
          <div align="left"><br>
            成绩和排名:</div>
          <table width="100%" border="1" cellpadding="0" cellspacing="0">
            <tr>

            <td height="24" width="21%">
              <div align="center">成绩</div></td>
              <td width="14%"><div align="center">10%平均</div></td>
              <td width="14%"><div align="center">30%平均</div></td>
              <td width="32%"> <div align="center" width="33%">全部参加人员排名</div></td>
              <td width="19%"> <div align="center" width"33%">100人换算排名</div></td>
            </tr>
            <tr valign="middle">

            <td height="24" nowrap>
              <div align="center"><%=Student.total_mark%>分(满分<%=mnTest.totalMark%>分)</div></td>

            <td nowrap>
<div align="center"><%=Student.avgTop10%>分</div></td>
              <td><div align="center"><%=Student.avgTop30%></div></td>

            <td nowrap>
              <div align="center"><%=Student.posAll%>名(全部参加排名者<%=mnTest.testPeople%>人)</div></td>

            <td nowrap>
              <div align="center"><%=Student.posPercent%></div></td>
            </tr>
          </table>
          <div align="left"><br>
            成绩单:</div>
          <table width="100%" border="1" cellpadding="0" cellspacing="0">
            <tr>

            <td width="12%" height="24">&nbsp;</td>

            <td width="11%" nowrap>
<div align="center">分数</div></td>

            <td width="11%" nowrap>
<div align="center">得分</div></td>

            <!--td width="11%" nowrap>
<div align="center">分校平均</div></td-->

            <td width="11%" nowrap>
<div align="center">全体平均</div></td>

            <td width="11%" nowrap>
<div align="center">10%平均</div></td>

            <td width="11%" nowrap>
<div align="center">30%平均</div></td>

            <td width="11%" nowrap>
<div align="center">总排名</div></td>

            <td width="11%" nowrap>
<div align="center">100名排名</div></td>
            </tr>
            <%
              for(i=0;i<subs.size();i++){
                Subject s=(Subject)subs.elementAt(i);
              %>
            <tr valign="middle">

            <td height="24" nowrap >
              <div align="center"><%=s.name%></div></td>

            <td nowrap>
              <div align="center"><%=s.totalMark%></div></td>

            <td nowrap>
              <div align="center"><%=s.realMark%></div></td>

            <!--td nowrap>
<div align="center"><%=s.avgArea%></div></td-->

            <td nowrap>
<div align="center"><%=s.avgTotal%></div></td>

            <td nowrap>
<div align="center"><%=s.avgTop10%></div></td>

            <td nowrap>
<div align="center"><%=s.avgTop30%></div></td>

            <td nowrap>
<div align="center"><%=s.posAll%></div></td>

            <td nowrap>
<div align="center"><%=s.posPercent%></div></td>
            </tr>
            <%}%>
          </table>
		  <div align="left"><br>
            判分表及难易度：准确率 A(0～20%)、B(21～40%)、C(41～60%)、D(61～80%)、E(81～100%) :</div>

            <%
            df=new DecimalFormat("00");
            for(i=0;i<subs.size();i++){
                Subject s=(Subject)subs.elementAt(i);
                colwidth=" width=\""+String.valueOf(80.00/s.testnum)+"%\"";
         %>









          <table width="100%" border="1" cellspacing="0" cellpadding="0">
            <tr>

            <td width="8%" height="24" nowrap>
              <div align="center"><strong><font size="+1">科目</font></strong></div></td>

            <td width="92%" height="24" colspan="<%=s.testnum+1%>">&nbsp;
            </td>
            </tr>
            <tr>
              <td rowspan="8"  width="8%"><div align="center"><%=s.name%></div></td>

            <td width="12%" height="20" nowrap>
              <div align="center">题号</div></td>
              <%for(j=1;j<=s.testnum;j++)
                  out.println("<td "+colwidth+"><div align=\"center\">"+df.format(j)+"</div></td>");
              %>
            </tr>
            <tr>

            <td   height="20" nowrap>
              <div align="center">正确答案</div></td>
              <%for(j=0;j<s.arrAnswer.length;j++)
                  out.println("<td "+colwidth+"><div align=\"center\">"+s.arrAnswer[j]+"</div></td>");
              %>
            </tr>
            <tr>

            <td   height="20" nowrap>
              <div align="center">个人答案</div></td>
              <%for(j=0;j<s.arrSubAnswer.length;j++)
                  out.println("<td "+colwidth+"><div align=\"center\">"+s.arrSubAnswer[j]+"</div></td>");
              %>
            </tr>
            <tr>

            <td height="20"  >
              <div align="center">对错</div></td>
              <%for(j=0;j<s.arrTF.length;j++)
                  out.println("<td "+colwidth+"><div align=\"center\">"+s.arrTF[j]+"</div></td>");
              %>
            </tr>
            <tr>

            <td height="20" nowrap>
              <div align="center">分值</div></td>
              <%for(j=0;j<s.arrMark.length;j++)
                  out.println("<td "+colwidth+"><div align=\"center\">"+s.arrMark[j]+"</div></td>");
              %>
            </tr>
            <tr>

            <td  height="20" nowrap>
              <div align="center">得分</div></td>
               <%for(j=0;j<s.arrSubMark.length;j++)
                  out.println("<td "+colwidth+"><div align=\"center\">"+s.arrSubMark[j]+"</div></td>");
              %>
            </tr>
            <tr>

            <td  height="20" nowrap>
              <div align="center">难易度</div></td>
              <%for(j=0;j<s.arrDif.length;j++)
                  out.println("<td "+colwidth+"><div align=\"center\">"+s.arrDif[j]+"</div></td>");
              %>
            </tr>
            <tr>

            <td  height="20" nowrap>
              <div align="center">准确率</div></td>
              <%for(j=0;j<s.arrDif.length;j++)
                  out.println("<td "+colwidth+"><div align=\"center\">"+s.arrRate[j]+"</div></td>");
              %>
            </tr>
          </table>


          <%}//end for 科目判分%>

          <div align="left"><br>
            历史记录 :</div>
        <%

        colwidth=" width=\""+String.valueOf(88.00/(maxHisSubNum+4))+"%\"";

        %>
          <table width="100%" border="1" cellpadding="0" cellspacing="0">
            <tr>

            <td width="12%" height="24" nowrap>
              <div align="center"><strong>考试日期</strong></div></td>
              <td <%=colwidth%> nowrap><div align="center"><strong>总分</strong></div></td>
              <td <%=colwidth%> nowrap><div align="center"><strong>10%平均</strong></div></td>
              <td <%=colwidth%> nowrap><div align="center"><strong>30%平均</strong></div></td>
              <td <%=colwidth%> nowrap><div align="center"><strong>排名</strong></div></td>
              <%
               /*
			    for(i=0;i<subs.size();i++){
                    out.println("<td "+colwidth+" nowrap><div align=\"center\"><strong>"+
                        ((Subject)subs.elementAt(i)).name+"</div></td>");
                }
				*/
				for(i=0;i<maxHisSubNum;i++){
                    out.println("<td "+colwidth+" nowrap>&nbsp;</td>");
                }
              %>

            </tr>
            <%for(i=0;i<hisRS.size();i++){
                History h=(History)hisRS.elementAt(i);
            %>
            <tr>

            <td height="20" nowrap>
              <div align="center"><%=h.testdate%></div></td>
              <td nowrap>
<div align="center"><%=h.totalmark%></div></td>
              <td nowrap>
<div align="center"><%=h.top10avg%></div></td>
              <td nowrap>
<div align="center"><%=h.top30avg%></div></td>
              <td nowrap>
<div align="center"><%=h.position%></div></td>
                <%for(j=0;j<h.sub_num;j++)
                {   String [] submark=h.sub_marks[j].split(":");
                    //out.println("<td><div align=\"center\">"+submark[1]+"</div></td>");
                    out.println("<td nowrap><div align=\"center\">"+h.sub_marks[j]+"</div></td>");
                }
				for(;j<maxHisSubNum;j++)
					out.println("<td nowrap>&nbsp;</td>");
                %>

            </tr>
            <%}%>
          </table>
          <br><br>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="0%">&nbsp;</td>
              <td width="45%"><div align="right"><img src="<%= graphURLmn %>" width=350 height=250 border=0 ></div></td>
              <td width="8%">&nbsp;</td>
              <td width="47%"><img src="<%= graphURLstu %>" width=350 height=250 border=0 ></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><div align="right"></div></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td align="center" valign=middle></td>
      </tr>
    </tbody>
  </table>
  </div>
  <P> </P>
<P>&nbsp;</P>
<P>&nbsp;</P>

</BODY></HTML>

<%
}
}
catch(Exception e){
    System.out.print(e.toString());
}
finally{
    DBCon.dropConnection();
}
%>