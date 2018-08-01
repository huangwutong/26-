  var maxPage = 0;   //最大页数
  var curPage = 1;   //当前页数
     
  function init(page) {
      dwr.engine.beginBatch();
      //alert(page);
      DeptPositionService.getDeptPositionMaxPage(processMaxPage);
      if(page == null) {
         showPositionPopedom(1);
      } else {
         showPositionPopedom(page);
      }     
      dwr.engine.endBatch();
  }
  
  function processMaxPage(result) {
     maxPage = result;
     //alert(result);
  }
  
  function showPositionPopedom(page) {
     curPage = page;
     DeptPositionService.findDeptPositionByPage(curPage,processShowPositionPopedom);
  }
  
  function processShowPositionPopedom(list) {
  	  //alert(list.length);
      dwr.util.removeAllRows("partPopedomBody");  //删除原有数据
      dwr.util.addRows("partPopedomBody",list,cellFuncs);
      $("header").innerText = "第" + curPage + "页/共" + maxPage + "页";
      showLinks();
  }
  
  //定义一个函数数组，由数组中每个元素构成表格中的一列
  var cellFuncs = [
       function(deptPosition) { return deptPosition.dept.deptName; },
       function(deptPosition) { return deptPosition.position.positionName; },
       function(deptPosition) {
           var btnEdit = document.createElement("input");
           btnEdit.setAttribute("type","button");
           btnEdit.setAttribute("value","编辑");
           btnEdit.onclick = function() {
               location.href = "positionPopedom.do?operate=toEdit&id=" + deptPosition.id + "&page=" + curPage;
           }
           return btnEdit;
       }
  ];
  
  function showLinks() {
     var links = "";
     if(curPage == 1) {
         links += "首页 上一页";
     }
     if(curPage > 1) {
         links += "<a href='javascript:showPositionPopedom(1)'>首页</a> ";
         links += "<a href='javascript:showPositionPopedom(" + (curPage-1) +")'>上一页</a>";
     }
     if(curPage == maxPage) {
         links += " 下一页 尾页"
     }
     if(curPage < maxPage) {
         links += " <a href='javascript:showPositionPopedom(" + (curPage+1) +")'>下一页</a> ";
         links += "<a href='javascript:showPositionPopedom(" + maxPage +")'>尾页</a>";
     }
     links += " 跳转到<input type='text' size='3' id='page'>页<input type='button' value='GO' onclick='gotoPage()'>";
     $("links").innerHTML = links;     
  }
  
  function gotoPage() {
      var page = trim($("page").value);
      if(page == "" || page < 1 || page > maxPage || isNaN(page)) {
          $("page").value = "";
          $("page").focus();
          return;
      }
      showPositionPopedom(page);      
  }
  
  //去前后空格
  function trim(str) {
      return str.replace(/^\s+/,'').replace(/\s+$/,'');
  }