Ext.onReady(function() {
	// 开启快速提示功能
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';
	/***************************************************************************
	 * 创建货票状态和公司角色的数据
	 */
	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='update-btn' value='详细信息' class='x-btn-wrap x-btn' onclick='selectinfo();'/>";
		return str;
	}
	var sm = new Ext.grid.RowSelectionModel();
	var datatwo = [['111', '收货'], ['222', '发货']];
	var storetwo = new Ext.data.Store({
		proxy : new Ext.data.MemoryProxy(datatwo),
		reader : new Ext.data.ArrayReader({}, [{
			name : 'sendbranch',
			mapping : 0
		}, {
			name : 'sendbranchis',
			mapping : 1
		}])
	});
	
	var billselectform = new Ext.FormPanel({
		labelAlign : 'left',
		region : 'north',
		title : '货票查询',
		buttonAlign : 'right',
		bodyStyle : 'padding:5px',
		width : 600,
		height:165,
		frame : true,
		labelWidth : 80,
		url : '../mars_billinfo_getparam.do',
		items : [{
			border : false,
			labelSeparator : ':',
			items : [{
				xtype : 'fieldset',
				title : '查询范围',
				autoHeight : true,
				defaultType : 'textfield',
				items : [{
					xtype : 'combo',
					fieldLabel : '公司角色',
					hiddenName : 'sendbranch',
					store : storetwo,
					emptyText : '请选择公司角色',
					triggerAction : 'all',
					valueField : 'sendbranch',
					displayField : 'sendbranchis',
					readOnly : true,
					allowBlank : false,
					editable : false
				}]
			}]
		}],
		buttons : [{
			text : '查询',
			handler : function() {
				billselectform.getForm().submit({
					success : function() {
						ds.load({
							params : {
								start : 0,
								limit : 5
							}
						});

					},
					failure : function() {
						Ext.MessageBox.alert('信息', '查询，请与管理员联系!');
					}

				});

			}
		}, {
			text : '重置',
			handler : function() {
				billselectform.getForm().reset();
			}
		}]
	})
	// billselectform.render("select");
	//var sm = new Ext.grid.CheckboxSelectionModel();

	// 编辑列数据
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(),{
		header : '货票编号',
		dataIndex : 'billid',
		sortable : true
		
	}, {
		header : '发货客户',
		dataIndex : 'sendcusname',
		sortable : true

	}, {
		header : '收货客户',
		dataIndex : 'receivecusname',
		sortable : true
		
	}, {
		header : '付款人',
		dataIndex : 'payername',
		sortable : true
		
	}, {
		header : '货票制单时间',
		dataIndex : 'billdata',
		sortable : true
		
	}, {
		header : '货票状态',
		dataIndex : 'billstatename',
		sortable : true
		
	}, {
		header : '收货公司',
		dataIndex : 'receivebranchname',
		sortable : true
		
	},{
		header : '操作',
		dataIndex : 'billid',
		renderer : renderDescn
	}]);
	var ds = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : 'BillJson.jsp'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'billid'
		}, {
			name : 'sendcusname'
		}, {
			name : 'receivecusname'
		}, {
			name : 'truckline'
		}, {
			name : 'payername'
		}, {
			name : 'username'
		}, {
			name : 'billdata'
		}, {
			name : 'billstatename'
		}, {
			name : 'billmemo'
		}, {
			name : 'sendbranchname'
		}, {
			name : 'receivebranchname'
		}])
	});
	 
	 window.selectinfo = function() {
			var win;
		if (!win) {
			var selectRecode = grid.getSelectionModel().getSelected();
			var from = new Ext.form.FormPanel({
				labelAlign : 'top',
				buttonAlign : 'right',
				title : '调度信息',
				bodyStyle : 'padding:5px',
				height : 380,
				autoScroll : true,
				width : 580,
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
							fieldLabel : '货票编号',
							name : 'billid',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '发货客户',
							name : 'sendcusname',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '收货客户',
							name : 'receivecusname',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '运输线路',
							name : 'truckline',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '付款人',
							name : 'payername',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '操作人',
							name : 'username',
							readOnly : true,
							anchor : '85%'
						}]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							xtype : 'textfield',
							fieldLabel : '货票日期',
							name : 'billdata',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '货票状态',
							name : 'billstatename',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '货票备注',
							name : 'billmemo',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '发货公司',
							name : 'sendbranchname',
							readOnly : true,
							anchor : '85%'
						}, {
							xtype : 'textfield',
							fieldLabel : '收货公司',
							name : 'receivebranchname',
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
	// 定义分页框
	var bbar = new Ext.PagingToolbar({
		pageSize : 5,
		store : ds,
		displayInfo : true,
		displayMsg : '显示第{0}条到第{1}条记录，一共{2}条',
		emptyMsg : '没有记录'
	});
	// 定义Grid
	var grid = new Ext.grid.EditorGridPanel({
		region : 'center',
		autoScroll:true,
		height : 150,
		ds : ds,
		cm : cm,
		sm : sm,
		bbar : bbar
	});

	//声明一个VIEWPORT
	var viewport = new Ext.Viewport({
		layout : 'border',
		items : [billselectform, grid]
	})
})