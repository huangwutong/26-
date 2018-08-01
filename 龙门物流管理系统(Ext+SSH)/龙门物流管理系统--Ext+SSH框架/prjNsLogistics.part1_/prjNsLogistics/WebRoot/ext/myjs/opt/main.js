Ext.onReady(function() {

	// 开始QuickTip提示功能
	Ext.QuickTips.init();

	/**
	 * 构建标签面板，出现在主显示页面，用于显示信息
	 */
	var tabs = new Ext.TabPanel({
		region : 'center',
		deferredRender : false,
		resizeTabs : true,
		minTabWidth : 115,
		tabWidth : 135,
		height : 100,
		autoScroll : true,
		enableTabScroll : true,
		plugins : new Ext.ux.TabCloseMenu()
	});

	var hig = document.body.clientHeight - 130;

	tabs.add({
		title : '我的桌面',
		contentEl : 'center1',
		html : '<iframe scrolling="auto" frameborder="0" width="100%"height="100%" src="../Mars/AfficheResult.html"></iframe>'
	});

	tabs.activate(0);

	/**
	 * 构建一个树，出现在页面左侧栏，用于导航页面
	 */
	var tree = new Ext.tree.TreePanel({
		root : new Ext.tree.AsyncTreeNode({
			id : '0',
			text : 'NeverSilence龙门镖局管理中心            '
		}),
		loader : new Ext.tree.TreeLoader({
			dataUrl : '../optOperationTree.do'
		}),
		title : '导航栏',
		region : 'west',
		split : true,
		border : true,
		collapsible : true,
		autoScroll : true,
		width : 240,
		minSize : 140,
		maxSize : 240,
		enableDD : true
	});

	/**
	 * 为导航树添加单击事件，当单击节点在主显示界面新开一个标签页用于浏览
	 */
	function treeClick(node, event) {
		if (node.isLeaf()) {
			event.stopEvent();
			var n = tabs.getComponent(node.id);
			if (!n) {
				n = tabs.add({
					'id' : node.id,
					'title' : node.text,
					closable : true,
					autoScroll : true,
					html : '<iframe scrolling="auto" frameborder="0" width="100%"height="100%" src="'
							+ node.attributes.href + '"></iframe>'
				});
			}
			tabs.setActiveTab(n)
		}
	};
	tree.on('click', treeClick);

	/**
	 * 获取屏幕宽度
	 */
	var hig = document.body.clientHeight

	/**
	 * 生成一个ViewPort，采用Border布局，保留天地栏，左中栏
	 */
	var viewport = new Ext.Viewport({
		layout : 'border',
		items : [{
			region : 'north',
			contentEL : 'north-div',
			height : 90,
			bodyStyle : 'background-color:#BBCCEE',
			items : [
			{
				layout : 'column',
				border : false,
				items : [{
					columnWidth : .9,
					layout : 'form',
					border : false,
					items : [{
						xtype : 'panel',
						html : '<center><img src="../Logo.jpg" width="908px"/></center>'
					}]
				}, {
					columnWidth : .1,
					layout : 'form',
					border : false,
					items : [{
						xtype : 'panel',
						bodyStyle : 'background-color:#BBCCEE',
						buttons : [{
							text : '注销登录',
							template : new Ext.Template(
							'<table border="0" cellpadding="0" cellspacing="0" class="x-btn-wrap"><tbody><tr>',
							'<td class="ux-startbutton-left"><i>&#160;</i></td><td class="ux-startbutton-center"><em unselectable="on"><button class="x-btn-text" type="{1}" style="height:30px;color:red" onclick="logout();">注销登录</button><br><button class="x-btn-text" type="{1}" style="height:30px;color:red" onclick="close();">关闭页面</button></em></td><td class="ux-startbutton-right"><i>&#160;</i></td>',
							"</tr></tbody></table>")
						}]
					}]
				}]

			}
			]
		}, {
			region : 'south',
			contentEL : 'south-div',
			collapsible : true,
			border : true,
			height : 20,
			bodyStyle : 'background-color:#BBCCEE',
			items : [{
				xtype : 'panel',
				bodyStyle : 'background-color:#BBCCEE',
				html : '<center><b> 欢迎龙门镖局管理系统 Copyright by NeverSilence </b></center>'
			}]
		}, tree, tabs]
	});

	/**
	 * 为注销按钮编写单击事件
	 */

	window.logout = function() {

		/**
		 * 获取跳转路径
		 */
		var path = window.location.pathname;
		path = path.substring(0, path.lastIndexOf('/') + 1);
		path += "LogOFF.jsp";
		window.location = path;
	}
	
	window.close = function() {

		window.close();
	}

})