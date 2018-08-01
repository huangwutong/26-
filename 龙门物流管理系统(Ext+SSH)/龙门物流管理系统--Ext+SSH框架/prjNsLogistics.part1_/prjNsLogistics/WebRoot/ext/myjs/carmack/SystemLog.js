Ext.onReady(function() {

	/**
	 * 开启快速提示功能
	 */
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';

	// =================================列表显示========================================

	/**
	 * 生成列模型
	 */
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(),{
		// 系统日志编号
		header : '编号',
		dataIndex : 'SystemLogID',
		sortable : true
	}, {
		// 操作人编号
		header : '操作人',
		dataIndex : 'UserID',
		sortable : true
	}, {
		// 操作内容简述
		header : '简述',
		dataIndex : 'SystemLogMemo',
		width:150,
		sortable : true
	}, {
		// 所属分公司(仓库)编号
		header : '公司',
		dataIndex : 'BranchID',
		sortable : true
	}]);

	/**
	 * 声明数据适配器，将数据源与列模型绑定
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../systemLogList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'SystemLogID',
			mapping : 'SystemLogID'
		}, {
			name : 'UserID',
			mapping : 'UserID'
		}, {
			name : 'SystemLogMemo',
			mapping : 'SystemLogMemo'
		}, {
			name : 'BranchID',
			mapping : 'BranchID'
		}])
	});

	/**
	 * 生成Bbar,用于分页显示
	 */
	var bbar = new Ext.PagingToolbar({
		pageSize : 10,
		store : store,
		displayInfo : true,
		displayMsg : '显示第{0}条到{1}条记录，一共{2}条',
		emptyMsg : '没有记录'
	});

	

	/**
	 * 声明一个Grid，列表显示信息
	 */
	var grid = new Ext.grid.EditorGridPanel({
		el : 'SLgrid',
		title : '系统日志',
		height : 400,
		trackMouseOver : false,
		loadMask : {
			msg : '正在加载数据，请稍后.....'
		},
		ds : store,
		cm : cm,
		sm : new Ext.grid.RowSelectionModel(),
		bbar : bbar
		
		
	});

	/**
	 * 将Grid渲染呈现
	 */
	grid.render();
	store.load({
		params : {
			start : 0,
			limit : 10
		}
	});
})