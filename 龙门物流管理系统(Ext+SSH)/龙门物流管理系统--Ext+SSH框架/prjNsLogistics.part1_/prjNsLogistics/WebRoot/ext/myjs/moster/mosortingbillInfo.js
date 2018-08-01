Ext.onReady(function() {

	/**
	 * 开启快速提示功能
	 */
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';

	// =================================列表显示========================================
	/**
	 * 声明一个函数，为操作列添加一个按钮
	 */
	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='show-btn' value='查看操作' class='x-btn-wrap x-btn' onclick='checkInfo();'/>";
		return str;
	}

	/**
	 * 生成列模型
	 */
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
		// 货票编号
		header : '编号',
		dataIndex : 'BillID',
		sortable : true
	}, {
		// 发货客户姓名
		header : '发货客户',
		dataIndex : 'SendName',
		sortable : true
	}, {
		// 收货客户姓名
		header : '收货客户',
		dataIndex : 'ReceiveName',
		sortable : true
	}, {
		// 制单时间
		header : '制单时间',
		dataIndex : 'BillData',
		sortable : true
	}, {
		// 接货分公司名称
		header : '收货分公司',
		dataIndex : 'ReceiveBranchName',
		sortable : true
	}, {
		// 货票当前状态
		header : '货票状态',
		dataIndex : 'BillStateName',
		width : 180,
		sortable : true
	}, {
		// 操作列
		header : '操作',
		dataIndex : 'CargoIDs',
		renderer : renderDescn
	}]);

	/**
	 * 声明数据适配器，将数据源与列模型绑定
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../MosortingBillList.do?MoBIStateID=1004'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
				name : 'BillID',
				mapping : 'BillID'
			}, {
				name : 'SendName',
				mapping : 'SendName'
			}, {
				name : 'SendID',
				mapping : 'SendID'
			}, {
				name : 'SendBranchID',
				mapping : 'SendBranchID'
			}, {
				name : 'SendBranchName',
				mapping : 'SendBranchName'
			}, {
				name : 'PayerName',
				mapping : 'PayerName'
			}, {
				name : 'TruckLine',
				mapping : 'TruckLine'
			}, {
				name : 'ReceiveName',
				mapping : 'ReceiveName'
			}, {
				name : 'ReceiveID',
				mapping : 'ReceiveID'
			}, {
				name : 'BillData',
				mapping : 'BillData'
			}, {
				name : 'ReceiveBranchName',
				mapping : 'ReceiveBranchName'
			}, {
				name : 'ReceiveBranchID',
				mapping : 'ReceiveBranchID'
			}, {
				name : 'BillStateID',
				mapping : 'BillStateID'
			}, {
				name : 'UserID',
				mapping : 'UserID'
			}, {
				name : 'BillMemo',
				mapping : 'BillMemo'
			}, {
				name : 'BillStateName',
				mapping : 'BillStateName'
			}, {
				name : 'CargoIDs',
				mapping : 'cgarray'
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
	var grid = new Ext.grid.GridPanel({
		el : 'Grid',
		title : '货票信息',
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

	// =================================表单提交========================================
	/**
	 * 为操作列按钮编写单击事件
	 */

	window.checkInfo = function() {
		var win;
		/**
		 * 获取Grid中选中行id
		 */
		var selectRecode = grid.getSelectionModel().getSelected();
		var srID = selectRecode.data['BillID'];

		/**
		 * 声明一个FormPanel,显示选中信息，更改后提交
		 */
		
		var from = new Ext.form.FormPanel({
			labelAlign : 'top',
			buttonAlign : 'right',
			title : '货票详细信息',
			bodyStyle : 'padding:5px',
			height : 300,
			autoScroll : true,
			width : 598,
			frame : true,
			collapsible : true,
			url : '../MosortingBillUpdateOk.do',

			items : [{
				layout : 'column',
				border : false,
				items : [{
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						// 货票ID
						xtype : 'textfield',
						fieldLabel : '货票编号',
						name : 'BillID',
						readOnly : true,
						anchor : '95%'
					}, {
						// 发货客户ID
						xtype : 'textfield',
						fieldLabel : '发货客户编号',
						name : 'SendID',
						readOnly : true,
						anchor : '95%'
					}, {
						// 发货客户名称
						xtype : 'textfield',
						fieldLabel : '发货客户名称',
						name : 'SendName',
						readOnly : true,
						anchor : '95%'
					}, {
						// 发货公司ID
						xtype : 'textfield',
						fieldLabel : '发货分公司编号',
						name : 'SendBranchID',
						readOnly : true,
						anchor : '95%'
					}, {
						// 发货公司名称
						xtype : 'textfield',
						fieldLabel : '发货分公司名称',
						name : 'SendBranchName',
						readOnly : true,
						anchor : '95%'
					}, {
						// 付款人姓名
						xtype : 'textfield',
						fieldLabel : '付款人',
						name : 'PayerName',
						readOnly : true,
						anchor : '95%'
					}, {
						// 运输路线
						xtype : 'textfield',
						fieldLabel : '运输线路',
						name : 'TruckLine',
						readOnly : true,
						anchor : '95%'
					}]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						// 制单时间
						xtype : 'textfield',
						fieldLabel : '制单时间',
						name : 'BillData',
						readOnly : true,
						anchor : '95%'
					}, {
						// 收货客户ID
						xtype : 'textfield',
						fieldLabel : '收货客户编号',
						name : 'ReceiveID',
						readOnly : true,
						anchor : '95%'
					}, {
						// 收货客户名称
						xtype : 'textfield',
						fieldLabel : '收货客户名称',
						name : 'ReceiveName',
						readOnly : true,
						anchor : '95%'
					}, {
						// 收货公司ID
						xtype : 'textfield',
						fieldLabel : '收货分公司编号',
						name : 'ReceiveBranchID',
						readOnly : true,
						anchor : '95%'
					}, {
						// 收货公司名称
						xtype : 'textfield',
						fieldLabel : '收货分公司名称',
						name : 'ReceiveBranchName',
						readOnly : true,
						anchor : '95%'
					}, {
						// 操作人编号
						xtype : 'textfield',
						fieldLabel : '操作人编号',
						name : 'UserID',
						readOnly : true,
						anchor : '95%'
					}, {
						// 货票状态
						xtype : 'combo',
						store : new Ext.data.SimpleStore({
							fields : ["BillStateID", "BillStateName"],
							data : [[1000, 'Send_客服已接单,等待入库'],
									[1001, 'Send_入库已确认'],
									[1002, 'Send_货物清点完毕，等待调度'],
									[1003, 'Send_调度装配完毕,货已发出'],
									[1004, 'Receive_货已到岸,未签收'],
									[1005, 'Receive_货已签收,未分拣'],
									[1006, 'Receive_分拣完毕,已入库'],
									[1007, 'Receive_客服通知客户,等待提货'],
									[1008, 'Receive_客户验收,付款提货']]
						}),
						valueField : "BillStateID",
						displayField : "BillStateName",
						mode : 'local',
						forceSelection : true,
						blankText : '请选择货票状态',
						emptyText : '选择货票状态',
						hiddenName : 'BillStateID',
						editable : false,
						triggerAction : 'all',
						allowBlank : false,
						fieldLabel : '货票状态',
						anchor : '90%'
					}]
				}]
			}, {
				// 货票备注
				xtype : 'htmleditor',
				id : 'BillMemo',
				fieldLabel : '货票备注',
				height : 200,
				anchor : '98%'
			}],

			buttons : [{
				text : '修改',
				handler : function() {
					from.getForm().submit({
						success : function() {
							Ext.MessageBox.alert('信息', '更新成功，点击返回列表');
							win.close();
						},
						failure : function() {
							Ext.MessageBox.alert('信息', '更新失败，请与管理员联系!');
						}
					});
				}
			}]
		});

		// =======================================货物详细信息显示==============================================
		/**
		 * 声明一个Grid,包装货物详细信息
		 */
		/**
		 * 生成列模型
		 */
		var cgcm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
			// 货物编号
			header : '编号',
			dataIndex : 'CargoID',
			sortable : true
		}, {
			// 货物名称
			header : '货物名称',
			dataIndex : 'CargoName',
			sortable : true
		}, {
			// 货物状态
			header : '货物状态',

			dataIndex : 'CargoState',

			sortable : true
		}]);

		/**
		 * 声明数据适配器，将数据源与列模型绑定
		 */
		var cgstore = new Ext.data.Store({
			proxy : new Ext.data.HttpProxy({
				url : '../MosortingBillUpdate.do?BillID=' + srID
			}),
			reader : new Ext.data.JsonReader({
				totalProperty : 'totalProperty',
				root : 'root'
			}, [{
				name : 'CargoID',
				mapping : 'CargoID'
			}, {
				name : 'CargoName',
				mapping : 'CargoName'
			}, {
				name : 'CargoState',
				mapping : 'CargoState'
			}])
		});
		cgstore.load();

		/**
		 * 声明一个Grid，列表显示信息
		 */
		var cgrid = new Ext.grid.GridPanel({
			title : '货物详细信息',
			height : 150,
			autoScroll : true,
			autoHeight : true,
			trackMouseOver : false,
			collapsible : true,
			width : 598,
			loadMask : {
				msg : '正在加载数据，请稍后.....'
			},
			ds : cgstore,
			cm : cgcm
		});
		// ===============================================================================================

		/**
		 * 声明一个window,包装FormPanel
		 */
		    win = new Ext.Window({
			title : '货票详细信息',
			closable : true,
			width : 610,
			height : 435,
			// border:false,
			plain : true,
			draggable : true,
			collapsible : true,
			closeAction:'hide',
			items : [cgrid, from]
		});
	
		win.show(Ext.get('show-btn'));
		
		// form加载事件
		
		from.getForm().loadRecord(selectRecode);
		
		/**
		 * 声明window监听器，当window关闭时，刷新Grid
		 */
		win.on('close', function() {
			grid.render();
			store.load({
				params : {
					start : 0,
					limit : 10
				}
			});
		});
	};

	// =================================渲染呈现========================================
	/**
	 * 渲染呈现Grid，Store初始化
	 */
	grid.render();
	store.load({
		params : {
			start : 0,
			limit : 10
		}
	});
});