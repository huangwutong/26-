Ext.onReady(function() {
	
	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='update-btn' value='详细信息' class='x-btn-wrap x-btn' onclick='selectinfo();'/>";
		return str;
	}
	var sm = new Ext.grid.RowSelectionModel();
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(),{
		header : '车辆编号',
		dataIndex : 'truckid',
		sortable : true
	}, {
		header : '车辆号码',
		dataIndex : 'trucknum',
		sortable : true
	}, {
		header : '车辆型号',
		dataIndex : 'tmid',
		sortable : true
	}, {
		header : '车辆购买时间',
		dataIndex : 'truckbuydata',
		sortable : true
	}, {
		header : '车辆隶属公司',
		dataIndex : 'branchid',
		sortable : true
	}, {
		header : '车辆状态',
		dataIndex : 'truckisvacancy',
		sortable : true
	}, {
		header : '操作',
		dataIndex : 'truckid',
		renderer : renderDescn
	}]);
	var ds = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../mars_truckinfo_findAll.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'truckid'
		}, {
			name : 'truckenginenum'
		}, {
			name : 'truckrunnum'
		}, {
			name : 'truckinsurancenum'
		}, {
			name : 'truckcolor'
		}, {
			name : 'truckphoto'
		}, {
			name : 'trucknum'
		}, {
			name : 'tmid'
		}, {
			name : 'truckbuydata'
		}, {
			name : 'branchid'
		}, {
			name : 'truckisvacancy'
		},])
	});

	

	window.selectinfo = function() {
		var win;
		if (!win) {
			var selectRecode = grid.getSelectionModel().getSelected();
			var from = new Ext.form.FormPanel({
				labelAlign : 'top',
				buttonAlign : 'right',
				title : '车辆信息',
				bodyStyle : 'padding:5px',
				height : 365,
				autoScroll : true,
				width : 570,
				frame : true,
				items : [{
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							xtype : 'textfield',
							fieldLabel : '车辆编号',
							name : 'truckid',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '车牌号码',
							name : 'trucknum',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '车辆发动机号',
							name : 'truckenginenum',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '车辆行驶证号',
							name : 'truckrunnum',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '车辆保险单号',
							name : 'truckinsurancenum',
							readOnly : true,
							anchor : '85%'
						} ]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							xtype : 'textfield',
							fieldLabel : '车辆颜色',
							name : 'truckcolor',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '车辆型号',
							name : 'tmid',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '车辆购买时间',
							name : 'truckbuydata',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '车辆隶属公司',
							name : 'branchid',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '车辆状态',
							name : 'truckisvacancy',
							readOnly : true,
							anchor : '85%'
						}]
					}]
				}]

			});

			win = new Ext.Window({
				title : 'InfoWindow',
				closable : true,
				width : 610,
				height : 400,
				autoScroll : true,
				// border:false,
				plain : true,
				draggable : true,
				collapsible : true,
				closeAction : 'hide',

				items : [from]
			});
		}
		win.show(Ext.get('update-btn'));
		if (selectRecode != null) {
			from.getForm().loadRecord(selectRecode);
		}

	}
	var bbar = new Ext.PagingToolbar({
		pageSize : 10,
		store : ds,
		displayInfo : true,
		displayMsg : '显示第{0}条到第{1}条记录，一共{2}条',
		emptyMsg : '没有记录'
	});
	var grid = new Ext.grid.EditorGridPanel({
		el : 'grid',
		height : 300,
		autoScroll : true,
		ds : ds,
		cm : cm,
		sm : sm,
		bbar : bbar
	});
	grid.render();
	ds.load({
		params : {
			start : 0,
			limit : 5
		}
	});
})