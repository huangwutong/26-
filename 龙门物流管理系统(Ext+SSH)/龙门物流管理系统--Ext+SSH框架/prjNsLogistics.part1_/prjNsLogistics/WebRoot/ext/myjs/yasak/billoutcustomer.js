Ext.onReady(function() {
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';
	

	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
		header : '货票编号',
		dataIndex : 'billId',
		sortable : true
	}, {
		header : '发货单位',
		dataIndex : 'sendName'
	}, {
		header : '收货单位',
		dataIndex : 'receiveName'
	}, {
		header : '制单时间',
		dataIndex : 'billData'
	}, {
		header : '货票状态',
		dataIndex : 'billDataName'
	}, {
		header : '发货公司',
		dataIndex : 'sendBranchName'
	}, {
		header : '收货公司',
		dataIndex : 'receiveBranchName'
	}]);
	var ds = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../yasak_BillOutCustomerList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'billId',
			mapping : 'billId'
		}, {
			name : 'sendId',
			mapping : 'sendId'
		}, {
			name : 'sendName',
			mapping : 'sendName'
		}, {
			name : 'receiveId',
			mapping : 'receiveId'
		}, {
			name : 'receiveName',
			mapping : 'receiveName'
		}, {
			name : 'userId',
			mapping : 'userId'
		}, {
			name : 'userName',
			mapping : 'userName'
		}, {
			name : 'billData',
			mapping : 'billData'
		}, {
			name : 'billDataId',
			mapping : 'billDataId'
		}, {
			name : 'billDataName',
			mapping : 'billDataName'
		}, {
			name : 'sendBranchId',
			mapping : 'sendBranchId'
		}, {
			name : 'sendBranchName',
			mapping : 'sendBranchName'
		}, {
			name : 'receiveBranchId',
			mapping : 'receiveBranchId'
		}, {
			name : 'receiveBranchName',
			mapping : 'receiveBranchName'
		}])
	});
	var bbar = new Ext.PagingToolbar({
		pageSize : 10,
		store : ds,
		displayInfo : true,
		displayMsg : '显示第{0}条到{1}条,一共{2}条',
		emptyMsg : '没有记录'
	});

	var grid = new Ext.grid.EditorGridPanel({
		el : 'grid',
		title : '货票详细信息',
		width : 770,
		height : 260,
		trackMouseOver : false,
		loadMask : {
			msg : '正在加载数据，请稍候....'
		},
		ds : ds,
		cm : cm,
		sm : new Ext.grid.RowSelectionModel(),
		bbar : bbar
	});

	grid.render();
	ds.load({
		params : {
			start : 0,
			limit : 10
		}
	});

});