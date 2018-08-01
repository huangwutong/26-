Ext.onReady(function() {
	/**
	 * ����һ����Ϊ���������һ��ť
	 */
	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='update-btn' value='详细信息' class='x-btn-wrap x-btn' onclick='selectinfo();'/>";
		return str;
	}
	var sm = new Ext.grid.RowSelectionModel();
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
		header : '司机编号',
		dataIndex : 'driverid',
		sortable : true
	}, {
		header : '司机所属公司',
		dataIndex : 'branchid',
		sortable : true
	}, {
		header : '司机姓名',
		dataIndex : 'drivername',
		sortable : true
	}, {
		header : '司机驾照',
		dataIndex : 'driverdrivecardid',
		sortable : true
	}, {
		header : '随车电话',
		dataIndex : 'driverphone',
		sortable : true
	}, {
		header : '司机状态',
		dataIndex : 'driverisvacancy',
		sortable : true
	}, {
		header : '操作',
		dataIndex : 'driverid',
		renderer : renderDescn
	}]);
	var ds = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../mars_driverinfo_findAll.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'driverid'
		}, {
			name : 'branchid'
		}, {
			name : 'drivername'
		}, {
			name : 'driverage'
		}, {
			name : 'driversex'
		}, {
			name : 'driverphoto'
		}, {
			name : 'driverdrivecardid'
		}, {
			name : 'drivercardid'
		}, {
			name : 'driverphone'
		}, {
			name : 'drivermemo'
		}, {
			name : 'driverisvacancy'
		},])
	});



	window.selectinfo = function() {
			var win;
		if (!win) {
			var selectRecode = grid.getSelectionModel().getSelected();
			var from = new Ext.form.FormPanel({
				labelAlign : 'top',
				buttonAlign : 'right',
				title : '�司机信息',
				bodyStyle : 'padding:5px',
				height : 400,
				autoScroll : true,
				width : 600,
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
							fieldLabel : '司机编号',
							name : 'driverid',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '所属公司',
							name : 'branchid',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '司机姓名',
							name : 'drivername',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '司机年龄',
							name : 'driverage',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '司机性别',
							name : 'driversex',
							readOnly : true,
							anchor : '85%'
						}]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							xtype : 'textfield',
							fieldLabel : '司机驾照',
							name : 'driverdrivecardid',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '司机身份证',
							name : 'drivercardid',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '随车电话',
							name : 'driverphone',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '司机备注',
							name : 'drivermemo',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '司机状态',
							name : 'driverisvacancy',
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
				height : 200,
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