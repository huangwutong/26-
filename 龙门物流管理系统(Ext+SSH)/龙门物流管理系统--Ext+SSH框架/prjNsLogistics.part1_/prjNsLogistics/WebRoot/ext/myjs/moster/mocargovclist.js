
Ext.onReady(function() {


	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';

	// =================================列表显示========================================
	/**
	 * 声明一个函数，为操作列添加一个按钮
	 */
	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='update-btn' value='修改' class='x-btn-wrap x-btn' onclick='updateInfo();'/>";

		return str;
	}

	/**
	 * 生成列模型
	 */
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
		// 货物集合编号
		header : '编号',
		dataIndex : 'CVID',
		sortable : true
	}, {
		// 货物编号
		header : '货物编号',
		dataIndex : 'CargoID',
		sortable : true
	}, {
		// 货票编号
		header : '货票编号',
		dataIndex : 'BillID',
		sortable : true
	}, {
		// 货物名称
		header : '货物名称',
		dataIndex : 'CargoName',
		sortable : true
	}, {
		// 操作列
		header : '操作',
		dataIndex : 'CVID',
		renderer : renderDescn
	}]);

	/**
	 * 声明数据适配器，将数据源与列模型绑定
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../MocargoVCList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
				name : 'CVID',
				mapping : 'CVID'
			}, {
				name : 'CargoID',
				mapping : 'CargoID'
			}, {
				name : 'BillID',
				mapping : 'BillID'
			}, {
				name : 'CargoName',
				mapping : 'CargoName'
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
		title : '货物信息列表',
		height : 430,
		trackMouseOver : false,
		loadMask : {
			msg : '正在加载数据，请稍后.....'
		},
		ds : store,
		cm : cm,
		sm : new Ext.grid.RowSelectionModel(),
		bbar : bbar,

		buttons : [{
			text : '添加货物集合信息',
			id : 'addbtn',
			handler : function() {
				addclick();
			}
		}]
	});

	// =================================表单提交========================================
	/**
	 * 为Grid的添加按钮编写单击事件
	 */
	function addclick() {

		/**
		 * 声明一个变量，后期赋值为窗体
		 */
		var win;

		/**
		 * 声明2个变量，第一个获取一条记录并从中获取公司ID，第二个代表公司控件
		 */
		var record;
		if (store.getCount() > 0) {
			record = store.getAt(0);
		}

		if (!win) {

			/**
			 * 创建货物数据适配器，读取货物信息
			 */
			var cargostore = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
					url : '../MoCargoID.do'
				}),
				reader : new Ext.data.JsonReader({}, [{
					name : 'CargoID'
				}, {
					name : 'CargoName'
				}])
			});
			
			/**
			 * 创建货物控件
			 */
		
			    var CargoComboBox = new Ext.form.ComboBox({
					fieldLabel : '货物名称',
					hiddenName : 'CargoID',
					xtype : 'combo',
					store : cargostore,
					mode : 'remote',
					emptyText : '请选择货物',
					triggerAction : 'all',
					valueField : 'CargoID',
					displayField : 'CargoName',
					width : 125,
					readOnly : true,
					allowBlank : false,
					editable : false,
					typeAhead : true,
					selectOnFocus : true,
					anchor : '85%'
				});
				
			/**
			 * 创建货票数据适配器，读取货票信息
			 */
			var billstore = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
					url : '../MocargoBillInfo.do'
				}),
				reader : new Ext.data.JsonReader({}, [{
					name : 'BillID'
				}])
			});
			/**
			 * 创建货票控件
			 */
			var billComboBox = new Ext.form.ComboBox({
					fieldLabel : '货票名称',
					hiddenName : 'BillID',
					xtype : 'combo',
					store : billstore,
					mode : 'remote',
					emptyText : '请选择货票',
					triggerAction : 'all',
					valueField : 'BillID',
					displayField : 'BillID',
					width : 125,
					readOnly : true,
					allowBlank : false,
					editable : false,
					typeAhead : true,
					selectOnFocus : true,
					anchor : '85%'
				});
			
			
			
			/**
			 * 声明一个FormPanel,显示选中信息，更改后提交
			 */
			var from = new Ext.form.FormPanel({
				labelAlign : 'top',
				buttonAlign : 'right',
				title : '添加货物集合信息',
				bodyStyle : 'padding:5px',
				height : 150,
				width : 650,
				autoScroll:true,
				frame : true,
				url : '../MocargoVCAdd.do',

				items : [{
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [CargoComboBox]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [billComboBox]
					}]
				
			}],

				buttons : [{
					text : '提交',
					handler : function() {
						if (from.form.isValid()) {
							from.getForm().submit({
								success : function() {
									Ext.MessageBox.alert('信息', '添加成功，点击返回列表页面');
									grid.render();
									store.load({
										params : {
											start : 0,
											limit : 10
										}
									});
									win.close();
								},
								failure : function() {
									Ext.MessageBox.alert('信息', '添加失败，请与管理员联系!');
								}
							});
						}
					}
				}, {
					text : '重置',
					handler : function() {
						from.getForm().reset();
					}
				}]
			});

			/**
			 * 声明一个window,包装FormPanel
			 */
			win = new Ext.Window({
				title : 'InfoWindow',
				closable : true,
				width : 660,
				height : 175,
				// border:false,
				plain : true,
				draggable : true,
				collapsible : true,
				closeAction : 'hide',

				items : [from]
			});
		}
		win.show(Ext.get('addbtn'));

	};


	/**
	 * 为操作列修改按钮编写单击事件
	 */

	window.updateInfo = function() {

		/**
		 * 声明一个变量，后期赋值为窗体
		 */
		var win;
		if (!win) {
			/**
			 * 获取Grid中选中行Record
			 */
			var selectRecode = grid.getSelectionModel().getSelected();
			var srID = selectRecode.data['CVID'];
			/**
			 * 创建货物数据适配器，读取货物信息
			 */
			var cargostore = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
					url : '../MoCargoID.do'
				}),
				reader : new Ext.data.JsonReader({}, [{
					name : 'CargoID'
				}, {
					name : 'CargoName'
				}])
			});
			
			/**
			 * 创建货物控件
			 */
		
			    var CargoComboBox = new Ext.form.ComboBox({
					fieldLabel : '货物名称',
					hiddenName : 'CargoID',
					xtype : 'combo',
					store : cargostore,
					mode : 'remote',
					emptyText : '请选择货物',
					triggerAction : 'all',
					valueField : 'CargoID',
					displayField : 'CargoName',
					width : 125,
					readOnly : true,
					allowBlank : false,
					editable : false,
					typeAhead : true,
					selectOnFocus : true,
					anchor : '85%'
				});
				
			/**
			 * 创建货票数据适配器，读取货票信息
			 */
			var billstore = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
					url : '../MocargoBillInfo.do'
				}),
				reader : new Ext.data.JsonReader({}, [{
					name : 'BillID'
				}])
			});
			/**
			 * 创建货票控件
			 */
			var billComboBox = new Ext.form.ComboBox({
					fieldLabel : '货票名称',
					hiddenName : 'BillID',
					xtype : 'combo',
					store : billstore,
					mode : 'remote',
					emptyText : '请选择货票',
					triggerAction : 'all',
					valueField : 'BillID',
					displayField : 'BillID',
					width : 125,
					readOnly : true,
					allowBlank : false,
					editable : false,
					typeAhead : true,
					selectOnFocus : true,
					anchor : '85%'
				});

			/**
			 * 声明一个FormPanel,显示选中信息，更改后提交
			 */

			var from = new Ext.form.FormPanel({
				labelAlign : 'top',
				buttonAlign : 'right',
				title : '货物详细信息',
				bodyStyle : 'padding:5px',
				height : 180,
				width : 650,
				autoScroll:true,
				frame : true,
				url : '../MoCargoVCUpdate.do',

				items : [{
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
						// 货票集合ID
						xtype : 'textfield',
						fieldLabel : '货票集合编号',
						name : 'CVID',
						readOnly : true,
						anchor : '85%'
					},{
							// 货物信息
							xtype : 'combo',
							store : cargostore,
							mode : 'remote',
							valueField : 'CargoID',
							displayField : 'CargoName',
							forceSelection : true,
							blankText : '请选择货物',
							emptyText : '请选择货物',
							hiddenName : 'CargoID',
							width : 125,
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '货物信息',
							anchor : '85%'
						}]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							// 货票信息
							xtype : 'combo',
							store : billstore,
							mode : 'remote',
							valueField : 'BillID',
							displayField : 'BillID',
							forceSelection : true,
							blankText : '请选择货票',
							emptyText : '请选择货票',
							hiddenName : 'BillID',
							width : 125,
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '货票信息',
							anchor : '85%'
						}]
					}]
				}],

				buttons : [{
					text : '修改',
					handler : function() {
						from.getForm().submit({
							success : function() {
								Ext.MessageBox.alert('信息', '更新成功，点击返回列表页面');
								grid.render();
								store.load({
									params : {
										start : 0,
										limit : 10
									}
								});
								win.close();
							},
							failure : function() {
								Ext.MessageBox.alert('信息', '更新失败，请与管理员联系!');
							}
						});
					}
				}]
			});

			/**
			 * 声明一个window,包装FormPanel
			 */
			win = new Ext.Window({
				title : 'InfoWindow',
				closable : true,
				width : 660,
				height : 205,
				border : false,
				plain : true,
				draggable : true,
				collapsible : true,
				closeAction : 'hide',

				items : [from]
			});
		}
		win.show(Ext.get('update-btn'));

		/**
		 * form加载事件
		 */
		from.getForm().loadRecord(selectRecode);

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

})