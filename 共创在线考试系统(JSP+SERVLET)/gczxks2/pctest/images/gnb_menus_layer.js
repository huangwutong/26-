  function getGNBLinkColor(moduleID)/*鼠标over时显示颜色*/
  {
    if (moduleID == "www") return "#3260B1";
    if (moduleID == "senior") return "#B77BB4";
    if (moduleID == "junior") return "#F7A300";
    if (moduleID == "exercises") return "#77B7B9";
    if (moduleID == "community") return "#C28383";
    if (moduleID == "myjh") return "#8882B5";
    if (moduleID == "help") return "#CEAB75";
  }

  function getGNBLayerColor(moduleID)/*间隔的彩条基本颜色*/
  {
    if (moduleID == "senior") return "#F7E1F6";
    if (moduleID == "junior") return "#FFEBC4";
    if (moduleID == "exercises") return "#DFF1E4";
    if (moduleID == "community") return "#FBE2D3";
    if (moduleID == "myjh") return "#EFEDFD";
    if (moduleID == "help") return "#F5E8D3";
  }

  function getGNBLayerHighlightColor(moduleID)/*下拉菜单鼠标over时改变的颜色*/
  {
    if (moduleID == "senior") return "#D3ADD1";
    if (moduleID == "junior") return "#E4BD55";
    if (moduleID == "exercises") return "#77B7B9";
    if (moduleID == "community") return "#E1B1B1";
    if (moduleID == "myjh") return "#B5B1D4";
    if (moduleID == "help") return "#CEAB75";
  }

  function generateGNBLayerMenu(moduleID, subMenu, menuID, strOption)
  {

      var href = "javascript:sayNavigate('"+subMenu[0].replace(/'/g, '\\\'')+"');"
/*
    if (subMenu[0].substr(0, 7) == "http://")
      var href = "javascript:sayNavigate('"+subMenu[0].replace(/'/g, '\\\'')+"');"
    else
      var href = subMenu[0];
*/

    if (subMenu[2] == "normal")
      return "<TD "+strOption+" ONMOUSEOVER=\"javascript:highlightLayer('"+moduleID+"', '"+menuID+"')\" ONMOUSEOUT=\"javascript:restoreLayer('"+moduleID+"', '"+menuID+"')\" ONMOUSEDOWN=\""+href+"\" STYLE=\"cursor:hand\" CLASS=gnbSubMenu>&nbsp;<SPAN ID=text_"+menuID+">" + subMenu[1] + "</SPAN>&nbsp;&nbsp;</TD>";
    else if (subMenu[2] == "special")
      return "<TD "+strOption+" ONMOUSEOVER=\"javascript:highlightLayer('"+moduleID+"', '"+menuID+"');document.all.arrow_"+menuID+".color='#FFFFFF';\" ONMOUSEOUT=\"javascript:restoreLayer('"+moduleID+"', '"+menuID+"');document.all.arrow_"+menuID+".color='#BFBFBF';\" ONMOUSEDOWN=\""+href+"\" STYLE=\"cursor:hand\" CLASS=gnbSubMenu>&nbsp;<SPAN ID=text_"+menuID+"><FONT ID=arrow_"+menuID+" COLOR=#BFBFBF style='font-size:8pt;'>⒑</FONT>" + subMenu[1] + "</SPAN>&nbsp;&nbsp;</TD>";
    else
      return "<TD "+strOption+" ONMOUSEOVER=\"javascript:highlightLayer('"+moduleID+"', '"+menuID+"')\" ONMOUSEOUT=\"javascript:restoreLayer('"+moduleID+"', '"+menuID+"');document.all.text_"+menuID+".style.color='#646464';\" ONMOUSEDOWN=\""+href+"\" STYLE=\"cursor:hand; color:#646464;\" CLASS=gnbSubMenu ALIGN=right>&nbsp;<SPAN ID=text_"+menuID+"><b>more <FONT SIZE=-2>&gt;</FONT></b></SPAN>&nbsp;&nbsp;</TD>";
  }

  function generateGNBLayerTop(moduleID, subMenu, bgcolor, menuID)
  {
    document.writeln(
"<TR VALIGN=bottom HEIGHT=1>"+
  "<TD ROWSPAN=2 BGCOLOR=#717171></TD>"+
  "<TD ID="+menuID+" BGCOLOR="+bgcolor+" ROWSPAN=2 COLSPAN=3></TD>"+
  generateGNBLayerMenu(moduleID, subMenu, menuID, 'ID='+menuID+' BGCOLOR='+bgcolor+' ROWSPAN=2')+
  "<TD ID="+menuID+" BGCOLOR="+bgcolor+" ROWSPAN=2 COLSPAN=2></TD>"+
  "<TD ROWSPAN=2 BGCOLOR=#717171></TD>"+
  "<TD></TD>"+
"</TR>"+

"<TR BGCOLOR="+bgcolor+" VALIGN=bottom HEIGHT=17>"+
  "<TD BGCOLOR=#000000></TD>"+
"</TR>");
  }

  function generateGNBLayerCommon(moduleID, subMenu, bgcolor, menuID)
  {
    document.writeln(
"<TR ID="+menuID+" BGCOLOR="+bgcolor+" VALIGN=bottom HEIGHT=18>"+
  "<TD BGCOLOR=#717171></TD>"+
  "<TD COLSPAN=3></TD>"+
  generateGNBLayerMenu(moduleID, subMenu, menuID, '')+
  "<TD COLSPAN=2></TD>"+
  "<TD BGCOLOR=#717171></TD>"+
  "<TD BGCOLOR=#000000></TD>"+
"</TR>");
  }

  function generateGNBLayerBottom(moduleID, subMenu, bgcolor, menuID)
  {
    document.writeln(
"<TR ID="+menuID+" BGCOLOR="+bgcolor+" VALIGN=bottom HEIGHT=16>"+
  "<TD BGCOLOR=#717171></TD>"+
  "<TD></TD>"+
  "<TD ROWSPAN=2></TD>"+
  "<TD ROWSPAN=3></TD>"+
  generateGNBLayerMenu(moduleID, subMenu, menuID, 'ROWSPAN=3')+
  "<TD ROWSPAN=2></TD>"+
  "<TD></TD>"+
  "<TD BGCOLOR=#717171></TD>"+
  "<TD ROWSPAN=2 BGCOLOR=#000000></TD>"+
"</TR>"+

"<TR HEIGHT=1>"+
  "<TD ROWSPAN=2></TD>"+
  "<TD ROWSPAN=2 BGCOLOR=#717171></TD>"+
  "<TD ROWSPAN=2 BGCOLOR=#717171></TD>"+
  "<TD ROWSPAN=2 BGCOLOR=#000000></TD>"+
"</TR>"+

"<TR HEIGHT=1>"+
  "<TD BGCOLOR=#717171></TD>"+
  "<TD BGCOLOR=#717171></TD>"+
  "<TD></TD>"+
"</TR>");
  }
  
  function generateGNBLayerLine()
  {
    document.writeln(
"<TR BGCOLOR=#D3D3D3 HEIGHT=1>"+
  "<TD BGCOLOR=#717171></TD>"+
  "<TD COLSPAN=6></TD>"+
  "<TD BGCOLOR=#717171></TD>"+
  "<TD BGCOLOR=#000000></TD>"+
"</TR>");
  }

  function generateGNBLayer(moduleID, subMenus)
  {
    var bgcolor = getGNBLayerColor(moduleID);

    document.writeln(
"<DIV ID=gnb_layer_"+moduleID+"  ONMOUSEOVER=\"javascript:showSubMenuLayer('"+moduleID+"')\" ONMOUSEOUT=\"javascript:hideSubMenuLayer('"+moduleID+"')\" STYLE=\"position:absolute; display:none; z-index:99\">"+
"<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 STYLE=\"position:relative\">"+
  "<COL WIDTH=1>"+
  "<COL WIDTH=1>"+
  "<COL WIDTH=1>"+
  "<COL WIDTH=1>"+
  "<COL>"+
  "<COL WIDTH=1>"+
  "<COL WIDTH=1>"+
  "<COL WIDTH=1>"+
  "<COL WIDTH=1>");

    var isSpecial = false;
    var bgcolor = '#FFFFFF';

    for (key in subMenus)
    {
      if (subMenus[key][2] != 'normal')
        bgcolor = "#F8F8F3";
      else if (key % 2 == 0)
        bgcolor = getGNBLayerColor(moduleID);
      else
        bgcolor = "#FFFFFF";

      if (subMenus[key][2] != 'normal' && !isSpecial)
      {
        generateGNBLayerLine();
        isSpecial = true;
      }

      if (key == subMenus.length - 1)
        generateGNBLayerBottom(moduleID, subMenus[key], bgcolor, "gnb_layer_"+moduleID+"_"+key);
      else if (key == 0)
        generateGNBLayerTop(moduleID, subMenus[key], bgcolor, "gnb_layer_"+moduleID+"_"+key);
      else
        generateGNBLayerCommon(moduleID, subMenus[key], bgcolor, "gnb_layer_"+moduleID+"_"+key);
    }

    document.writeln(
  "<TR HEIGHT=1>"+
    "<TD COLSPAN=2></TD>"+
    "<TD BGCOLOR=#000000></TD>"+
    "<TD COLSPAN=2 BGCOLOR=#717171></TD>"+
    "<TD COLSPAN=3 BGCOLOR=#000000></TD>"+
    "<TD></TD>"+
  "</TR>"+

  "<TR HEIGHT=1>"+
    "<TD COLSPAN=4></TD>"+
    "<TD COLSPAN=2 BGCOLOR=#000000></TD>"+
    "<TD COLSPAN=3></TD>"+
  "</TR>"+

"</TABLE>"+
"</DIV>");
  }

  var originalLayerBGColor;
  var originalLayerFontColor;

  function highlightLayer(moduleID, menuID)
  {
    //showSubMenuLayer(moduleID);
    originalLayerBGColor = document.getElementById(menuID).bgColor;
    var colMenu = document.getElementsByName(menuID);
    for (var i=0; i<colMenu.length; i++)
      colMenu[i].bgColor = getGNBLayerHighlightColor(moduleID);
    document.all("text_"+menuID).style.color = "#FFFFFF";
  }

  function restoreLayer(moduleID, menuID)
  {
    //hideSubMenuLayer(moduleID);
    var colMenu = document.getElementsByName(menuID);
    for (var i=0; i<colMenu.length; i++)
      colMenu[i].bgColor = originalLayerBGColor;
    document.all("text_"+menuID).style.color = "#000000";
  }

  var originalMenuColor;
  var originalMenuFontWeight;
  var currentShewModuleID = '';

  function showSubMenuLayer(moduleID)
  {
    if (currentShewModuleID == moduleID)
      return;

    if (currentShewModuleID != '')
      hideSubMenuLayer(currentShewModuleID);

    currentShewModuleID = moduleID;

    var tg = document.all("gnb_layer_"+moduleID);
    var link = document.all("gnb_link_"+moduleID);
    var linkText = document.all("gnb_link_text_"+moduleID);

    originalMenuColor = linkText.style.color;
    originalMenuFontWeight = linkText.style.fontWeight;
    linkText.style.color = getGNBLinkColor(moduleID);
    linkText.style.fontWeight = "bold";

    if (tg != null)
    {
      tg.style.posTop = link.offsetTop + link.offsetHeight;
      tg.style.posLeft = link.offsetLeft;
      tg.style.display = "inline";

      for (var i=0; i<objectForClipping.length; i++)
      {
        var frameName = objectForClipping[i];
        var tableName = oTableForClipping[i];
        var oFrame = document.all[frameName];
        var oTable = document.all[tableName];

        if( 'undefined' != typeof(tableName) && '' != tableName )
        {
          var oldFrameOffsetTop = oFrame.offsetTop;
          var oldFrameOffsetLeft = oFrame.offsetLeft;
          var frameOffsetTop = oFrame.offsetTop + parseInt(oTable.style.top);
          var frameOffsetLeft = oFrame.offsetLeft + parseInt(oTable.style.left);
          var frameOffsetBottom = frameOffsetTop + oFrame.offsetHeight;
          var frameOffsetRight = frameOffsetLeft + oFrame.offsetWidth;
        }
        else
        {
          oFrame.style.position = 'relative';
          var frameOffsetTop = oFrame.offsetTop;
          var frameOffsetLeft = oFrame.offsetLeft;
          var frameOffsetBottom = oFrame.offsetTop + oFrame.offsetHeight;
          var frameOffsetRight = oFrame.offsetLeft + oFrame.offsetWidth;
        }

        var layerOffsetTop = tg.offsetTop;
        var layerOffsetBottom = tg.offsetTop + tg.offsetHeight;
        var layerOffsetLeft = tg.offsetLeft;
        var layerOffsetRight = tg.offsetLeft + tg.offsetWidth;

        if (frameOffsetTop <= layerOffsetBottom &&
            (layerOffsetLeft >= frameOffsetLeft && layerOffsetLeft <= frameOffsetRight ||
             frameOffsetLeft >= layerOffsetLeft && frameOffsetLeft <= layerOffsetRight))
        {
          oFrame.style.position = 'absolute';
          if( 'undefined' != typeof(tableName) && '' != tableName )
          {
            oFrame.style.top = oldFrameOffsetTop;
            oFrame.style.left = oldFrameOffsetLeft;
          }
          else
          {
            oFrame.style.top = frameOffsetTop;
            oFrame.style.left = frameOffsetLeft;
          }
            oFrame.style.clip = "rect(" + (layerOffsetBottom - frameOffsetTop + 1) + " auto auto auto)";
        }
      }
    }
  }

  function hideSubMenuLayer(moduleID, force)
  {
    if (currentShewModuleID != moduleID)
      return;

    var tg = document.all("gnb_layer_" + moduleID);
    var linkText = document.all("gnb_link_text_"+moduleID);

    currentShewModuleID = '';

    linkText.style.color = originalMenuColor?originalMenuColor:"#000000";
    linkText.style.fontWeight = originalMenuFontWeight?originalMenuFontWeight:"normal";

    if (tg != null)
    {
      tg.style.display = "none";

      for (var i=0; i<objectForClipping.length; i++)
      {
        var frameName = objectForClipping[i];
        var tableName = oTableForClipping[i];
        var oFrame = document.all[frameName];
        var oTable = document.all[tableName];

        oFrame.style.position = 'relative';
        oFrame.style.top = 0;
        oFrame.style.left = 0;
        oFrame.style.clip = "rect(auto)";
      }
    }
  }

  function showSubMenuLayer2(moduleID)
  {
    if (currentShewModuleID == moduleID)
      return;

    if (currentShewModuleID != '')
      hideSubMenuLayer(currentShewModuleID);

    currentShewModuleID = moduleID;

    var linkText = document.all("gnb_link_text_"+moduleID);

    originalMenuColor = linkText.style.color;
    originalMenuFontWeight = linkText.style.fontWeight;
    linkText.style.color = getGNBLinkColor(moduleID);
    linkText.style.fontWeight = "bold";
  }

  function hideSubMenuLayer2(moduleID)
  {
    if (currentShewModuleID != moduleID)
      return;

    var linkText = document.all("gnb_link_text_"+moduleID);

    currentShewModuleID = '';

    linkText.style.color = originalMenuColor?originalMenuColor:"#000000";
    linkText.style.fontWeight = originalMenuFontWeight?originalMenuFontWeight:"normal";
  }

  var objectForClipping = new Array();
  var oTableForClipping = new Array();

  function addIFrameForClipping(frameName, tableName)/*下拉菜单包含内容及其链接*/
  {
    var count = objectForClipping.length;
    objectForClipping[count] = frameName;
    oTableForClipping[count] = tableName;
  }

var subMenus_senior = new Array();
subMenus_senior[0] = new Array();
subMenus_senior[0][0] = "/senior/";
subMenus_senior[0][1] = "高考通";
subMenus_senior[0][2] = "normal";
subMenus_senior[1] = new Array();
subMenus_senior[1][0] = "/senior/none_g3.jsp";
subMenus_senior[1][1] = "高考通高三";
subMenus_senior[1][2] = "normal";
subMenus_senior[2] = new Array();
subMenus_senior[2][0] = "/senior/none_g2.jsp";
subMenus_senior[2][1] = "高考通高二";
subMenus_senior[2][2] = "normal";
subMenus_senior[3] = new Array();
subMenus_senior[3][0] = "/senior/none_g1.jsp";
subMenus_senior[3][1] = "高考通高一";
subMenus_senior[3][2] = "normal";

var subMenus_senior_in = new Array();

var subMenus_junior = new Array();
subMenus_junior[0] = new Array();
subMenus_junior[0][0] = "/junior/index.jsp";
subMenus_junior[0][1] = "中考通";
subMenus_junior[0][2] = "normal";
subMenus_junior[1] = new Array();
subMenus_junior[1][0] = "/junior/none_c3.jsp";
subMenus_junior[1][1] = "中考通初三";
subMenus_junior[1][2] = "normal";
subMenus_junior[2] = new Array();
subMenus_junior[2][0] = "/junior/none_c2.jsp";
subMenus_junior[2][1] = "中考通初二";
subMenus_junior[2][2] = "normal";
subMenus_junior[3] = new Array();
subMenus_junior[3][0] = "/junior/none_c1.jsp";
subMenus_junior[3][1] = "中考通初一";
subMenus_junior[3][2] = "normal";

var subMenus_junior_in = new Array();

var subMenus_exercises = new Array();
subMenus_exercises[0] = new Array();
subMenus_exercises[0][0] = "/exercises/index.jsp";
subMenus_exercises[0][1] = "考题资料";
subMenus_exercises[0][2] = "normal";
subMenus_exercises[1] = new Array();
subMenus_exercises[1][0] = "/exercises/index.jsp";
subMenus_exercises[1][1] = "模拟考试";
subMenus_exercises[1][2] = "normal";

var subMenus_community = new Array();
subMenus_community[0] = new Array();
subMenus_community[0][0] = "http://jsptestonline.cosoft.org.cn/";
subMenus_community[0][1] = "名师辅导";
subMenus_community[0][2] = "normal";
subMenus_community[1] = new Array();
subMenus_community[1][0] = "/community/bbs.jsp";
subMenus_community[1][1] = "学习论坛";
subMenus_community[1][2] = "normal";
subMenus_community[2] = new Array();
subMenus_community[2][0] = "/cardshow/list.jsp";
subMenus_community[2][1] = "贺卡";
subMenus_community[2][2] = "normal";
subMenus_community[3] = new Array();
subMenus_community[3][0] = "/community/wallpaper.jsp";
subMenus_community[3][1] = "壁纸";
subMenus_community[3][2] = "normal";
subMenus_community[4] = new Array();
subMenus_community[4][0] = "/community/color.jsp";
subMenus_community[4][1] = "多彩空间";
subMenus_community[4][2] = "normal";
subMenus_community[5] = new Array();
subMenus_community[5][0] = "/community/lab.jsp";
subMenus_community[5][1] = "多媒体实验";
subMenus_community[5][2] = "normal";

var subMenus_saygame = new Array();

var subMenus_myjh = new Array();
subMenus_myjh[0] = new Array();
subMenus_myjh[0][0] = "/myjh/index.jsp";
subMenus_myjh[0][1] = "我的资料";
subMenus_myjh[0][2] = "normal";
subMenus_myjh[1] = new Array();
subMenus_myjh[1][0] = "/myjh/index_rc.jsp";
subMenus_myjh[1][1] = "日程管理";
subMenus_myjh[1][2] = "normal";
subMenus_myjh[2] = new Array();
subMenus_myjh[2][0] = "";
subMenus_myjh[2][1] = "考试管理";
subMenus_myjh[2][2] = "normal";

var subMenus_help = new Array();
subMenus_help[0] = new Array();
subMenus_help[0][0] = "/help/product/pro_001.jsp";
subMenus_help[0][1] = "产品介绍";
subMenus_help[0][2] = "normal";
subMenus_help[1] = new Array();
subMenus_help[1][0] = "/help/buy/buy_001.jsp";
subMenus_help[1][1] = "购买向导";
subMenus_help[1][2] = "normal";
subMenus_help[2] = new Array();
subMenus_help[2][0] = "/help/use/use_001.jsp";
subMenus_help[2][1] = "使用帮助";
subMenus_help[2][2] = "normal";
subMenus_help[3] = new Array();
subMenus_help[3][0] = "/help/vote/vote_001.jsp";
subMenus_help[3][1] = "建议投诉";
subMenus_help[3][2] = "normal";
