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
		var str = "<input type='button' id='update-btn' value='修改' class='x-btn-wrap x-btn' onclick='updateInfo();'/>";
		str += "&nbsp;&nbsp;"
		str += "<input type='button' id='del-btn' value='删除' class='x-btn-wrap x-btn' onclick='delInfo();'/>";
		return str;
	}

	/**
	 * 生成列模型
	 */
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
		// 司机编号
		header : '编号',
		dataIndex : 'DriverID',
		sortable : true
	}, {
		// 司机姓名
		header : '姓名',
		dataIndex : 'DriverName',
		sortable : true
	}, {
		// 司机性别
		header : '性别',
		dataIndex : 'DriverSex',
		sortable : true
	}, {
		// 司机年龄
		header : '年龄',
		dataIndex : 'DriverAge',
		sortable : true
	}, {
		// 操作列
		header : '操作',
		dataIndex : 'DriverID',
		renderer : renderDescn
	}]);

	/**
	 * 声明数据适配器，将数据源与列模型绑定
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../carmackDriverInfoList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'DriverID',
			mapping : 'DriverID'
		}, {
			name : 'BranchID',
			mapping : 'BranchID'
		}, {
			name : 'BranchName',
			mapping : 'BranchName'
		}, {
			name : 'DriverName',
			mapping : 'DriverName'
		}, {
			name : 'DriverAge',
			mapping : 'DriverAge'
		}, {
			name : 'DriverSex',
			mapping : 'DriverSex'
		}, {
			name : 'DriverPhoto',
			mapping : 'DriverPhoto'
		}, {
			name : 'DriverDriveCardID',
			mapping : 'DriverDriveCardID'
		}, {
			name : 'DriverCardID',
			mapping : 'DriverCardID'
		}, {
			name : 'DriverPhone',
			mapping : 'DriverPhone'
		}, {
			name : 'DriverMemo',
			mapping : 'DriverMemo'
		}, {
			name : 'DriverIsVacancy',
			mapping : 'DriverIsVacancy'
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
		el : 'TIgrid',
		title : '司机信息',
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
			text : '添加司机',
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
					value : record.get("BranchID")
				})
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
				title : '添加司机信息',
				bodyStyle : 'padding:5px',
				height : 300,
				width : 650,
				frame : true,
				url : '../carmackDriverInfoAdd.do',

				items : [{
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							// 司机名
							xtype : 'textfield',
							fieldLabel : '姓名',
							name : 'DriverName',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 年龄
							xtype : 'textfield',
							fieldLabel : '年龄',
							name : 'DriverAge',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 用户身份证
							xtype : 'textfield',
							fieldLabel : '身份证',
							name : 'DriverCardID',
							minLength : 16,
							maxLength : 18,
							vtype : 'alphanum',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 联系电话
							xtype : 'numberfield',
							fieldLabel : '联系电话',
							name : 'DriverPhone',
							minLength : 11,
							maxLength : 17,
							anchor : '85%'
						}]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [BranchField, {
							// 用户性别
							xtype : 'combo',
							store : new Ext.data.SimpleStore({
								fields : ["UserSex", "UserSex"],
								data : [['男', '男'], ['女', '女']]
							}),
							valueField : "UserSex",
							displayField : "UserSex",
							mode : 'local',
							forceSelection : true,
							blankText : '请选择性别',
							emptyText : '请选择性别',
							hiddenName : 'DriverSex',
							width : 125,
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '性别',
							anchor : '85%'
						}, {
							// 驾照
							xtype : 'textfield',
							fieldLabel : '驾驶证件',
							name : 'DriverDriveCardID',
							minLength : 16,
							maxLength : 18,
							vtype : 'alphanum',
							allowBlank : false,
							anchor : '85%'
						}]
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
				height : 325,
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
	 * 为操作列删除按钮编写单击事件
	 */

	window.delInfo = function() {
		var sm = grid.getSelectionModel();
		var count = sm.getCount();
		if (count == 0) {
			Ext.MessageBox.alert('信息', '您没有勾选任何记录!');
		} else {
			Ext.MessageBox.confirm('Message', '确定要删除？', function(btn) {
				if (btn == 'yes') {
					var record = sm.getSelected();

					var str = record.get('DriverID');

					Ext.Ajax.request({
						url : '../carmackDriverInfoDelete.do',
						params : {
							driverID : str
						},
						success : function() {
							Ext.MessageBox.alert('信息', '删除成功');
							store.reload();
						},
						failure : function() {
							Ext.MessageBox.alert('错误', '请与后台服务人员联系');
						},
						timeout : 30000,
						headers : {
							'my-header' : 'foo'
						}
					});
				}
			});
		}
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
				title : '用户详细信息',
				bodyStyle : 'padding:5px',
				height : 350,
				width : 650,
				frame : true,
				url : '../carmackDriverInfoUpdate.do',

				items : [{
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							// 司机编号
							xtype : 'textfield',
							fieldLabel : '编号',
							name : 'DriverID',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 年龄
							xtype : 'textfield',
							fieldLabel : '年龄',
							name : 'DriverAge',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 用户身份证
							xtype : 'textfield',
							fieldLabel : '身份证',
							name : 'DriverCardID',
							minLength : 16,
							maxLength : 18,
							vtype : 'alphanum',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 联系电话
							xtype : 'numberfield',
							fieldLabel : '联系电话',
							name : 'DriverPhone',
							minLength : 11,
							maxLength : 17,
							anchor : '85%'
						}, {
							// 司机状态
							xtype : 'textfield',
							fieldLabel : '司机状态(0-空闲;1-在途;2-休假)',
							name : 'DriverIsVacancy',
							allowBlank : false,
							anchor : '85%'
						}]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							// 司机名
							xtype : 'textfield',
							fieldLabel : '姓名',
							name : 'DriverName',
							allowBlank : false,
							anchor : '85%'
						}, BranchField, {
							// 用户性别
							xtype : 'combo',
							store : new Ext.data.SimpleStore({
								fields : ["UserSex", "UserSex"],
								data : [['男', '男'], ['女', '女']]
							}),
							valueField : "UserSex",
							displayField : "UserSex",
							mode : 'local',
							forceSelection : true,
							blankText : '请选择性别',
							emptyText : '请选择性别',
							hiddenName : 'DriverSex',
							width : 125,
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '性别',
							anchor : '85%'
						}, {
							// 驾照
							xtype : 'textfield',
							fieldLabel : '驾驶证件',
							name : 'DriverDriveCardID',
							minLength : 16,
							maxLength : 18,
							vtype : 'alphanum',
							allowBlank : false,
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