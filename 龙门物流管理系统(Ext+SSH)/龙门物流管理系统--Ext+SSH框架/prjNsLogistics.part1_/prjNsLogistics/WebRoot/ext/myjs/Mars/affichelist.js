Ext.onReady(function() {
	Ext.QuickTips.init();
	var expander = new Ext.grid.RowExpander({
				tpl : new Ext.Template('<p><b>发布人:</b> {userid}</p><br>',
						'<p><b>发布内容:</b> {affichecontent}</p>')
			});
	var ds = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../mars_afficheinfo_findAll.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'afficheid'
		}, {
			name : 'userid'
		}, {
			name : 'affichetitle'
		}, {
			name : 'affichecontent'
		}, {
			name : 'affichedata'
		}, {
			name : 'branchid'
		}])
	});

	var bbar = new Ext.PagingToolbar({
		pageSize : 5,
		store : ds,
		displayInfo : true,
		displayMsg : '显示第{0}条到第{1}条记录，一共{2}条',
		emptyMsg : '没有记录'
	});
	var grid = new Ext.grid.GridPanel({
		ds : ds,
		bbar : bbar,
		cm : new Ext.grid.ColumnModel([expander, {
			id : 'afficheid',
			header : "公告编号",
			sortable : true,
			dataIndex : 'afficheid',
			sortable : true
		}, {
			id : 'userid',
			header : "发布人",
			sortable : true,
			dataIndex : 'userid',
			sortable : true
		}, {
			id : 'affichetitle',
			header : "发布标题",
			sortable : true,
			dataIndex : 'affichetitle',
			sortable : true
		}, {
			id : 'affichedata',
			header : "发布时间",
			sortable : true,
			dataIndex : 'affichedata',
			sortable : true
		},]),
		viewConfig : {
			forceFit : true
		},
		width : 765,
		height : 425,
		plugins : expander,
		collapsible : true,
		animCollapse : false,
		title : '公告查询',
		iconCls : 'icon-grid',
		renderTo : document.body
	});
	grid.render();
	ds.load({
		params : {
			start : 0,
			limit : 5
		}
	});
})