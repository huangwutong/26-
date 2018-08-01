Ext.apply(Ext.form.VTypes, {
	daterange : function(val, field) {
		var date = field.parseDate(val);

		// We need to force the picker to update values to recaluate the
		// disabled
		// dates display
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
	}
});
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
		// 货物编号
		header : '货物编号',
		dataIndex : 'CargoID',
		sortable : true
	}, {
		// 货物名称
		header : '货物名称',
		dataIndex : 'CargoName',
		sortable : true
	}, {
		// 货物数量
		header : '货物数量',
		dataIndex : 'CargoNum',
		sortable : true
	}, {
		// 货物价值
		header : '货物价值',
		dataIndex : 'CargoValue',
		sortable : true
	}, {
		// 货物运费
		header : '货物运费',
		dataIndex : 'CargoFreight',
		sortable : true
	}, {
		// 货物状态
		header : '货物状态',
		dataIndex : 'CargoState',
		sortable : true
	}, {
		// 公司名称
		header : '公司名称',
		dataIndex : 'BranchName',
		sortable : true
	}, {
		// 操作
		header : '操作',
		dataIndex : 'CargoID',
		renderer : renderDescn
	}]);

	/**
	 * 声明数据适配器，将数据源与列模型绑定
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../MocargoList.do'
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
			name : 'CargoWeight',
			mapping : 'CargoWeight'
		}, {
			name : 'CargoBulk',
			mapping : 'CargoBulk'
		}, {
			name : 'CargoNum',
			mapping : 'CargoNum'
		}, {
			name : 'CargoUnit',
			mapping : 'CargoUnit'
		}, {
			name : 'CargoValue',
			mapping : 'CargoValue'
		}, {
			name : 'CargoFreight',
			mapping : 'CargoFreight'
		}, {
			name : 'CargoAmends',
			mapping : 'CargoAmends'
		}, {
			name : 'CargoMemo',
			mapping : 'CargoMemo'
		}, {
			name : 'CargoState',
			mapping : 'CargoState'
		}, {
			name : 'BranchID',
			mapping : 'BranchID'
		}, {
			name : 'CargoStartData',
			mapping : 'CargoStartData'
		}, {
			name : 'CargoEndData',
			mapping : 'CargoEndData'
		}, {
			name : 'BranchName',
			mapping : 'BranchName'
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
		el : 'CIgrid',
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
			text : '添加货物信息',
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

		/**
		 * 创建分公司数据适配器，读取分公司信息
		 */
		var Branchstore = new Ext.data.Store({
			proxy : new Ext.data.HttpProxy({
				url : '../Opt/JsonFactory/BranchInfo.jsp'
			}),
			reader : new Ext.data.JsonReader({}, [{
				name : 'branchid'
			}, {
				name : 'branchname'
			}])
		});

		/**
		 * 创建分公司控件
		 */
		var BranchField;
		if (store.getCount() > 0) {
			BranchField = new Ext.form.TextField({
				fieldLabel : '公司名称',
				name : 'BranchID',
				allowBlank : false,
				readOnly : true,
				anchor : '85%',
				value : record.get('BranchID')
			});
		} else {
			BranchField = new Ext.form.ComboBox({
				fieldLabel : '公司名称',
				hiddenName : 'BranchID',
				xtype : 'combo',
				store : Branchstore,
				mode : 'remote',
				emptyText : '请选择公司',
				triggerAction : 'all',
				valueField : 'branchid',
				displayField : 'branchname',
				width : 125,
				readOnly : true,
				allowBlank : false,
				editable : false,
				typeAhead : true,
				selectOnFocus : true,
				anchor : '85%'
			});
		}

		/**
		 * 声明一个FormPanel,显示选中信息，更改后提交
		 */

			var from = new Ext.form.FormPanel({
				labelAlign : 'top',
				buttonAlign : 'right',
				title : '货物详细信息',
				bodyStyle : 'padding:5px',
				height : 350,
				width : 650,
				autoScroll : true,
				frame : true,
				url : '../MocargoInfoAdd.do',

				items : [{
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							// 货物名称
							xtype : 'textfield',
							fieldLabel : '货物名称',
							name : 'CargoName',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物重量
							xtype : 'textfield',
							fieldLabel : '货物重量(吨)',
							name : 'CargoWeight',
							vtype : 'alphanum',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物体积
							xtype : 'textfield',
							fieldLabel : '货物体积(立方米)',
							name : 'CargoBulk',
							vtype : 'alphanum',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物数量
							xtype : 'textfield',
							fieldLabel : '货物数量',
							name : 'CargoNum',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物单位
							xtype : 'textfield',
							fieldLabel : '货物单位',
							name : 'CargoUnit',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物价值
							xtype : 'textfield',
							fieldLabel : '货物价值',
							name : 'CargoValue',
							allowBlank : false,
							anchor : '85%'
						}]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [BranchField, {
							// 货物运费
							xtype : 'textfield',
							fieldLabel : '货物运费',
							name : 'CargoFreight',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物保价
							xtype : 'textfield',
							fieldLabel : '货物保价',
							name : 'CargoAmends',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 库存状态
							xtype : 'combo',
							store : new Ext.data.SimpleStore({
								fields : ["cargostatevalue", "cargostatename"],
								data : [['0', '库存'], ['1', '在途'], ['2', '出库']]
							}),
							valueField : "cargostatevalue",
							displayField : "cargostatename",
							mode : 'local',
							forceSelection : true,
							blankText : '请选择状态',
							emptyText : '请选择状态',
							hiddenName : 'CargoState',
							width : 125,
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '库存状态',
							anchor : '85%'
						}, {
							xtype : 'datefield',
							format : 'Ymd',
							fieldLabel : '货物入库时间',
							name : 'CargoStartData',
							id : 'CargoStartData',
							vtype : 'daterange',
							endDateField : 'CargoEndData',
							anchor : '85%'
						}, {
							xtype : 'datefield',
							format : 'Ymd',
							fieldLabel : '货物出库时间',
							name : 'CargoEndData',
							id : 'CargoEndData',
							vtype : 'daterange',
							startDateField : 'CargoStartData',
							anchor : '85%'
						}, {
							// 备注
							xtype : 'textarea',
							fieldLabel : '备注',
							name : 'CargoMemo',
							autoScroll : false,
							anchor : '85%'
						}]
					}]
				}],

				buttons : [{
					text : '添加',
					handler : function() {
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
				}]
			});

			/**
			 * 声明一个window,包装FormPanel
			 */
			win = new Ext.Window({
				title : 'InfoWindow',
				closable : true,
				width : 660,
				height : 375,
				border : false,
				plain : true,
				draggable : true,
				collapsible : true,
				closeAction : 'hide',

				items : [from]
			});
	
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

			/**
			 * 创建分公司控件
			 */
			var BranchField = new Ext.form.TextField({
				fieldLabel : '公司名称',
				name : 'BranchID',
				allowBlank : false,
				readOnly : true,
				anchor : '85%',
				value : selectRecode.get("BranchID")
			})

			/**
			 * 声明一个FormPanel,显示选中信息，更改后提交
			 */

			var from = new Ext.form.FormPanel({
				labelAlign : 'top',
				buttonAlign : 'right',
				title : '货物详细信息',
				bodyStyle : 'padding:5px',
				height : 350,
				width : 650,
				autoScroll : true,
				frame : true,
				url : '../moCargoInfoUpdate.do',

				items : [{
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							// 货物编号
							xtype : 'textfield',
							fieldLabel : '货物编号',
							readOnly : true,
							name : 'CargoID',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物名称
							xtype : 'textfield',
							fieldLabel : '货物名称',
							name : 'CargoName',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物重量
							xtype : 'textfield',
							fieldLabel : '货物重量(吨)',
							name : 'CargoWeight',
							vtype : 'alphanum',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物体积
							xtype : 'textfield',
							fieldLabel : '货物体积(立方米)',
							name : 'CargoBulk',
							vtype : 'alphanum',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物数量
							xtype : 'textfield',
							fieldLabel : '货物数量',
							name : 'CargoNum',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物单位
							xtype : 'textfield',
							fieldLabel : '货物单位',
							name : 'CargoUnit',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物价值
							xtype : 'textfield',
							fieldLabel : '货物价值',
							name : 'CargoValue',
							allowBlank : false,
							anchor : '85%'
						}]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [BranchField, {
							// 货物运费
							xtype : 'textfield',
							fieldLabel : '货物运费',
							name : 'CargoFreight',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 货物保价
							xtype : 'textfield',
							fieldLabel : '货物保价',
							name : 'CargoAmends',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 库存状态
							xtype : 'combo',
							store : new Ext.data.SimpleStore({
								fields : ["cargostatevalue", "cargostatename"],
								data : [['0', '库存'], ['1', '在途'], ['2', '出库']]
							}),
							valueField : "cargostatevalue",
							displayField : "cargostatename",
							mode : 'local',
							forceSelection : true,
							blankText : '请选择状态',
							emptyText : '请选择状态',
							hiddenName : 'CargoState',
							width : 125,
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '库存状态',
							anchor : '85%'
						}, {
							xtype : 'datefield',
							format : 'Ymd',
							fieldLabel : '货物入库时间',
							name : 'CargoStartData',
							id : 'CargoStartData',
							vtype : 'daterange',
							endDateField : 'CargoEndData',
							anchor : '85%'
						}, {
							xtype : 'datefield',
							format : 'Ymd',
							fieldLabel : '货物出库时间',
							name : 'CargoEndData',
							id : 'CargoEndData',
							vtype : 'daterange',
							startDateField : 'CargoStartData',
							anchor : '85%'
						}, {
							// 备注
							xtype : 'textarea',
							fieldLabel : '备注',
							name : 'CargoMemo',
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
				height : 375,
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