Ext.onReady(function() {

	var tabs = new Ext.TabPanel({
		renderTo : 'tabs',
		resizeTabs : true, // turn on tab resizing
		minTabWidth : 750,
		tabWidth : 450,
		enableTabScroll : true,
		width : 770,
		height : 400,
		defaults : {
			autoScroll : true
		}
	});

	// tab generation code
	tabs.add({
		title : '已入库状态',
		iconCls : 'tabs',
		closable : false,
		html : '<iframe scrolling="auto" frameborder="0" width="100%"height="100%" src="../Yasak/BillInBranch.html"></iframe>'
	}).show();

	tabs.add({
		title : '通知客户状态',
		iconCls : 'tabs',
		closable : false,
		html : '<iframe scrolling="auto" frameborder="0" width="100%"height="100%" src="../Yasak/BillInCustomer.html"></iframe>'
	});

	tabs.add({
		title : '客户提货状态',
		iconCls : 'tabs',
		closable : false,
		html : '<iframe scrolling="auto" frameborder="0" width="100%"height="100%" src="../Yasak/BillOutCustomer.html"></iframe>'
	});

});