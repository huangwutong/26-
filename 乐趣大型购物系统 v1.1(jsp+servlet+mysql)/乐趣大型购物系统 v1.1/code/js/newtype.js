<script language="javascript">
var arrayboardID=new Array();
var arrayboardName=new Array();
var arrayboardParentID=new Array();
<%
Vector type_vct = mangeclass.getAllType()
for(int i=0; i<type_vct.size(); i++)
{
    Vector atype_vct =(Vector)type_vct.get(i);
    %>
    arrayboardID[<%=i%>]=<%=atype_vct.get(0)%>; arrayboardName[<%=i%>]='<%=atype_vct.get(1)%>'; arrayboardParentID[<%=i%>]='<%=atype_vct.get(2)%>';
    <%
}
%>
function changeBoardParent()
{
/**
*@设置一级拦目
*/	   
	   setBoard(document.form1.new_type.value);
}
function setBoard(province)
{
	
/**
*@设置二级拦目
*/		
document.form1.new_sub_type.options.length=0;
var count=0;

if(province!="all"){
	for(var i=0; i<arrayboardParentID.length; ++i)
	{
	    if(arrayboardParentID[i]==province)
	    {
	         document.form1.new_sub_type.add(document.createElement('OPTION'));
	         document.form1.new_sub_type.options[count].text=arrayboardName[i];
	         document.form1.new_sub_type.options[count].value=arrayboardID[i];
	         count++;
	    }
	}
    }
else
   {
document.form1.new_sub_type.add(document.createElement('OPTION'));
document.form1.new_sub_type.options[count].text="不限";
document.form1.new_sub_type.options[count].value="all";
count++;   
   }      
}
//-->
</script>