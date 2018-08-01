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
		// 编号
		header : '编号',
		dataIndex : 'BranchID',
		sortable : true
	}, {
		// 名称
		header : '名称',
		dataIndex : 'BranchName',
		sortable : true
	}, {
		//联系人
		header : '联系人',
		dataIndex : 'BranchLinkMan',
		sortable : true
	}, {
		// 联系电话
		header : '联系电话',
		dataIndex : 'BranchPhone',
		sortable : true
	}, {
		// 详细地址
		header : '详细地址',
		dataIndex : 'BranchAddress',
		sortable : true
	}, {
		// 电子邮箱
		header : '电子邮箱',
		dataIndex : 'BranchEmail',
		sortable : true
	},{
		// 操作列
		header : '操作',
		dataIndex : 'BranchID',
		renderer : renderDescn
	}]);

	/**
	 * 声明数据适配器，将数据源与列模型绑定
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../carmackBranchInfoList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		},[{
			name : 'BranchID',
			mapping : 'BranchID'
		}, {
			name : 'BranchName',
			mapping : 'BranchName'
		}, {
			name : 'BranchLinkMan',
			mapping : 'BranchLinkMan'
		}, {
			name : 'BranchPhone',
			mapping : 'BranchPhone'
		}, {
			name : 'BranchAddress',
			mapping : 'BranchAddress'
		}, {
			name : 'BranchEmail',
			mapping : 'BranchEmail'
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
		el : 'BIgrid',
		title : '公司信息',
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
			text : '添加公司',
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
		 * 声明一个FormPanel,显示选中信息，更改后提交
		 */
		var from = new Ext.form.FormPanel({
			labelAlign : 'top',
			buttonAlign : 'right',
			title : '添加公司信息',
			bodyStyle : 'padding:5px',
			height : 400,
			width : 650,
			frame : true,
			url : '../carmackBranchInfoAdd.do',

			items : [{
				layout : 'column',
				border : false,
				items : [{
					columnWidth : .5,
					layout : 'form',
					border : false,
					items :  [{
						//名称
						xtype : 'textfield',
						fieldLabel : '名称',
						name : 'BranchName',
						allowBlank : false,
						anchor : '85%'
					}, {
						//联系人
						xtype : 'textfield',
						fieldLabel : '联系人',
						name : 'BranchLinkMan',
						allowBlank : false,
						anchor : '85%'
					}, {
						// 联系电话
						xtype : 'numberfield',
						fieldLabel : '联系电话',
						name : 'BranchPhone',
						minLength : 6,
						maxLength : 14,
						anchor : '85%'
					}]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						// 详细地址
						xtype : 'textfield',
						fieldLabel : '详细地址',
						name : 'BranchAddress',
						allowBlank : false,
						anchor : '85%'
					}, {
						// 电子邮箱
						xtype : 'textfield',
						fieldLabel : '电子邮箱',
						vtype:'email',
						name : 'BranchEmail',
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
		var win = new Ext.Window({
			title : 'InfoWindow',
			closable : true,
			width : 660,
			height : 435,
			// border:false,
			plain : true,
			draggable : true,
			collapsible : true,

			items : [from]
		});

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

					var str = record.get('BranchID');

					Ext.Ajax.request({
						url : '../carmackBranchInfoDelete.do',
						params : {
							BranchID : str
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
		 * 获取Grid中选中行Record
		 */
		var selectRecode = grid.getSelectionModel().getSelected();

		/**
		 * 声明一个FormPanel,显示选中信息，更改后提交
		 */
		var from = new Ext.form.FormPanel({
			labelAlign : 'top',
			buttonAlign : 'right',
			title : '更新公司信息',
			bodyStyle : 'padding:5px',
			height : 400,
			width : 650,
			frame : true,
			url : '../carmackBranchInfoUpdate.do',

			items : [{
				layout : 'column',
				border : false,
				items : [{
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						//编号
						xtype : 'textfield',
						fieldLabel : '编号',
						name : 'BranchID',
						allowBlank : false,
						readOnly: true,
						anchor : '85%'
					},{
						//名称
						xtype : 'textfield',
						fieldLabel : '名称',
						name : 'BranchName',
						allowBlank : false,
						anchor : '85%'
					},  {
						//联系人
						xtype : 'textfield',
						fieldLabel : '联系人',
						name : 'BranchLinkMan',
						allowBlank : false,
						anchor : '85%'
					}, {
						// 联系电话
						xtype : 'numberfield',
						fieldLabel : '联系电话',
						name : 'BranchPhone',
						minLength : 6,
						maxLength : 11,
						anchor : '85%'
					}]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						// 详细地址
						xtype : 'textfield',
						fieldLabel : '详细地址',
						name : 'BranchAddress',
						allowBlank : false,
						anchor : '85%'
					}, {
						// 电子邮箱
						xtype : 'textfield',
						fieldLabel : '电子邮箱',
						name : 'BranchEmail',
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
		var win = new Ext.Window({
			title : 'InfoWindow',
			closable : true,
			width : 660,
			height : 435,
			// border:false,
			plain : true,
			draggable : true,
			collapsible : true,

			items : [from]
		});

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