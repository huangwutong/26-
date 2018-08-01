/**
 * 自定义Ext验证类型
 */
Ext.apply(Ext.form.VTypes, {
	daterange : function(val, field) {
		var date = field.parseDate(val);

		// We need to force the picker to update values to recaluate the
		// disabled dates display
		var dispUpd = function(picker) {
			var ad = picker.activeDate;
			picker.activeDate = null;
			picker.update(ad);
		};

		if (field.startDateField) {
			var sd = Ext.getCmp(field.startDateField);
			sd.maxValue = date;
			if (sd.menu && sd.menu.picker) {
				sd.menu.picker.maxDate = date;
				dispUpd(sd.menu.picker);
			}
		} else if (field.endDateField) {
			var ed = Ext.getCmp(field.endDateField);
			ed.minValue = date;
			if (ed.menu && ed.menu.picker) {
				ed.menu.picker.minDate = date;
				dispUpd(ed.menu.picker);
			}
		}
		/*
		 * Always return true since we're only using this vtype to set the
		 * min/max allowed values (these are tested for after the vtype test)
		 */
		return true;
	},

	password : function(val, field) {
		if (field.initialPassField) {
			var pwd = Ext.getCmp(field.initialPassField);
			return (val == pwd.getValue());
		}
		return true;
	},

	passwordText : 'Passwords do not match'
});

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
		var str = "<input type='button' id='show-btn' value='生成车次表' class='x-btn-wrap x-btn' onclick='checkInfo();'/>";
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
			url : '../optBillInfoList.do?BIStateID=1002'
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
			name : 'ReceiveName',
			mapping : 'ReceiveName'
		}, {
			name : 'BillData',
			mapping : 'BillData'
		}, {
			name : 'ReceiveBranchName',
			mapping : 'ReceiveBranchName'
		}, {
			name : 'BillStateName',
			mapping : 'BillStateName'
		}, {
			name : 'CargoIDs',
			mapping : 'CargoIDs'
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
	var grid = new Ext.grid.GridPanel({
		region : 'north',
		contentEL : 'north-div',
		split : true,
		border : true,
		collapsible : true,
		autoScroll : true,
		title : '货票信息',
		height : 200,
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
		/**
		 * 获取Grid中选中行id
		 */
		var selectRecode = grid.getSelectionModel().getSelected();

		form.getForm().loadRecord(selectRecode)
	}

	/**
	 * 创建空闲车辆数据适配器，读取空闲车辆信息
	 */
	var Truckstore = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../Opt/JsonFactory/FreeTruck.jsp'
		}),
		reader : new Ext.data.JsonReader({}, [{
			name : 'TruckID'
		}, {
			name : 'TruckNum'
		}])
	});

	/**
	 * 创建空闲车辆Combox
	 */
	var Truckcombo = new Ext.form.ComboBox({
		fieldLabel : '运输车辆',
		hiddenName : 'TruckID',
		xtype : 'combo',
		store : Truckstore,
		mode : 'remote',
		emptyText : '请选择运输车辆',
		triggerAction : 'all',
		valueField : 'TruckID',
		displayField : 'TruckNum',
		width : 125,
		readOnly : true,
		allowBlank : false,
		editable : false,
		typeAhead : true,
		selectOnFocus : true,
		anchor : '85%'
	});

	/**
	 * 创建空闲司机数据适配器，读取空闲车辆信息
	 */
	var Driverstore = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../Opt/JsonFactory/FreeDriver.jsp'
		}),
		reader : new Ext.data.JsonReader({}, [{
			name : 'DriverID'
		}, {
			name : 'DriverName'
		}])
	});

	/**
	 * 创建空闲司机Combox
	 */
	var Drivercombo = new Ext.form.ComboBox({
		fieldLabel : '随车司机',
		hiddenName : 'DriverID',
		xtype : 'combo',
		store : Driverstore,
		mode : 'remote',
		emptyText : '请选择随车司机',
		triggerAction : 'all',
		valueField : 'DriverID',
		displayField : 'DriverName',
		width : 125,
		readOnly : true,
		allowBlank : false,
		editable : false,
		typeAhead : true,
		selectOnFocus : true,
		anchor : '85%'
	});

	var today = new Date().dateFormat('Ymd');

	/**
	 * 声明一个FormPanel,显示选中信息，更改后提交
	 */
	var form = new Ext.form.FormPanel({
		region : 'center',
		labelAlign : 'top',
		buttonAlign : 'right',
		title : '车次信息',
		bodyStyle : 'padding:5px',
		height : 280,
		autoScroll : true,
		width : 598,
		frame : true,
		collapsible : true,
		url : '../optTruckLogAdd.do',

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
					anchor : '85%'
				}, Truckcombo, {
					// 出发时间
					xtype : 'datefield',
					fieldLabel : '出发时间',
					name : 'TLStartData',
					id : 'TLStartData',
					format : 'Ymd',
					vtype : 'daterange',
					endDateField : 'TLArrive',
					value : today,
					readOnly : true,
					anchor : '85%'
				}]
			}, {
				columnWidth : .5,
				layout : 'form',
				border : false,
				items : [{
					// 分公司编号
					xtype : 'textfield',
					fieldLabel : '分公司编号',
					name : 'BranchID',
					readOnly : true,
					anchor : '85%'
				}, Drivercombo, {
					// 预计到达时间
					xtype : 'datefield',
					fieldLabel : '预计到达时间',
					name : 'TLArrive',
					id : 'TLArrive',
					format : 'Ymd',
					vtype : 'daterange',
					startDateField : 'TLStartData',
					readOnly : true,
					anchor : '85%'
				}]
			}]
		}],

		buttons : [{
			text : '提交',
			handler : function() {
				if (form.getForm().isValid()) {
					form.getForm().submit({
						success : function() {
							Ext.MessageBox.alert('信息', '提交成功，点击返回列表页面');
							grid.render();
							store.load({
								params : {
									start : 0,
									limit : 10
								}
							});
						},
						failure : function() {
							Ext.MessageBox.alert('信息', '提交失败，请与管理员联系!');
						}
					});
				}

			}
		}]
	});

	/**
	 * 声明一个ViewPort封装Form以及Grid
	 */
	var viewport = new Ext.Viewport({
		layout : 'border',
		autoScroll : true,
		items : [grid, form]
	});

	/**
	 * 将Grid渲染并初始化数据
	 */
	grid.render();
	store.load({
		params : {
			start : 0,
			limit : 10
		}
	});

})