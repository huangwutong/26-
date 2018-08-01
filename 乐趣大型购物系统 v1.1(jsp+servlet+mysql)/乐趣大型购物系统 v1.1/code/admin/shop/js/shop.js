function goodsadd()
{

    
    if(isWhitespace(document.form1.name.value))
     {
     	alert("请输入商品名称！");
     	document.form1.name.focus();
     	return false;
     }  
    if(document.form1.parentid.value=='all')
     {
     	
         alert("请选择添加商品的大类");	
         document.form1.parentid.focus();
         return false;
     }	
     
    if(document.form1.catalog_id.value=='all')
     {
         alert("请选择添加商品的子类");	
         document.form1.catalog_id.focus();
         return false;
     }	    
    
     if(isWhitespace(document.form1.manufacturer.value))
     {
     	alert("请输入厂商名称！");
     	document.form1.manufacturer.focus();
     	return false;
     }    
  
    if(isWhitespace(document.form1.market_price.value))
     {
     	alert("请输入市场价格！");
     	document.form1.market_price.focus();
     	return false;
     }
     
    if(isWhitespace(document.form1.price.value))
     {
     	alert("请输入非会员价格！");
     	document.form1.price.focus();
     	return false;
     }  
     
    if(isWhitespace(document.form1.member_price.value))
     {
     	alert("请输入会员价格！");
     	document.form1.member_price.focus();
     	return false;
     }                   
    if(isWhitespace(document.form1.cost_price.value))
     {
     	alert("请输入成本价格！");
     	document.form1.cost_price.focus();
     	return false;
     }           
     
    if(isWhitespace(document.form1.keywords.value))
     {
     	alert("请输入商品关键字！");
     	document.form1.keywords.focus();
     	return false;
     }    
     
    if(isWhitespace(document.form1.brief.value))
     {
     	alert("请输入简短介绍！");
     	document.form1.brief.focus();
     	return false;
     }          
    if(isWhitespace(document.form1.product_intr.value))
     {
     	alert("请输入产品的详细介绍！");
     	document.form1.product_intr.focus();
     	return false;
     }      
    
    return true;     	
    
}

function recommand()
{
	
    if(document.form1.parentid.value=='all')
     {     	
         alert("请选择商品的大类");	
         document.form1.parentid.focus();
         return false;
     }	    
    else
     {
     	    return true;     	
     } 
   
}