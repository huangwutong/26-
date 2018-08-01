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
		// 用户编号
		header : '编号',
		dataIndex : 'UserID',
		sortable : true
	}, {
		// 用户真实姓名
		header : '姓名',
		dataIndex : 'UserRName',
		sortable : true
	}, {
		// 用户性别
		header : '性别',
		dataIndex : 'UserSex',
		sortable : true
	}, {
		// 用户所在部门名称
		header : '部门',
		dataIndex : 'DepartmentName',
		sortable : true
	}, {
		// 用户权限
		header : '角色',
		dataIndex : 'RoleName',
		sortable : true
	}, {
		// 操作列
		header : '操作',
		dataIndex : 'UsreID',
		renderer : renderDescn
	}]);

	/**
	 * 声明数据适配器，将数据源与列模型绑定
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../carmackUserInfoList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'UserID',
			mapping : 'UserID'
		}, {
			name : 'UserRName',
			mapping : 'UserRName'
		}, {
			name : 'UserSex',
			mapping : 'UserSex'
		}, {
			name : 'DepartmentName',
			mapping : 'DepartmentName'
		}, {
			name : 'RoleName',
			mapping : 'RoleName'
		}, {
			name : 'UserPassWord',
			mapping : 'UserPassWord'
		}, {
			name : 'UserPhone',
			mapping : 'UserPhone'
		}, {
			name : 'DepartmentID',
			mapping : 'DepartmentID'
		}, {
			name : 'UserCardID',
			mapping : 'UserCardID'
		}, {
			name : 'UserLoginNum',
			mapping : 'UserLoginNum'
		}, {
			name : 'UserName',
			mapping : 'UserName'
		}, {
			name : 'RoleID',
			mapping : 'RoleID'
		}, {
			name : 'UserLoginData',
			mapping : 'UserLoginData'
		}, {
			name : 'UserRegData',
			mapping : 'UserRegData'
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
		el : 'UIgrid',
		title : '用户信息',
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
			text : '添加用户',
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
			 * 创建部门数据适配器，读取部门信息
			 */
			var Departmentstore = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
					url : '../Opt/JsonFactory/DepartmentInfo.jsp'
				}),
				reader : new Ext.data.JsonReader({}, [{
					name : 'DepartmentID'
				}, {
					name : 'DepartmentName'
				}])
			});

			/**
			 * 创建部门Combox
			 */
			var Departmentcombo = new Ext.form.ComboBox({
				fieldLabel : '部门名称',
				hiddenName : 'DepartmentID',
				xtype : 'combo',
				store : Departmentstore,
				mode : 'remote',
				emptyText : '请选择部门',
				triggerAction : 'all',
				valueField : 'DepartmentID',
				displayField : 'DepartmentName',
				width : 125,
				readOnly : true,
				allowBlank : false,
				editable : false,
				typeAhead : true,
				anchor : '85%',
				selectOnFocus : true
			});

			/**
			 * 创建权限角色数据适配器，读取权限角信息
			 */
			var Rolestore = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
					url : '../Opt/JsonFactory/RoleInfo.jsp'
				}),
				reader : new Ext.data.JsonReader({}, [{
					name : 'RoleID'
				}, {
					name : 'RoleName'
				}])
			});

			/**
			 * 创建权限角色Combox
			 */
			var Rolecombo = new Ext.form.ComboBox({
				fieldLabel : '权限角色',
				hiddenName : 'RoleID',
				xtype : 'combo',
				store : Rolestore,
				mode : 'remote',
				emptyText : '请选择权限角色',
				triggerAction : 'all',
				valueField : 'RoleID',
				displayField : 'RoleName',
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
				title : '添加用户信息',
				bodyStyle : 'padding:5px',
				height : 275,
				width : 650,
				frame : true,
				autoScroll : true,
				url : '../carmackUserInfoAdd.do',

				items : [{
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							// 用户名
							xtype : 'textfield',
							fieldLabel : '用户名',
							name : 'UserName',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 用户真实姓名
							xtype : 'textfield',
							fieldLabel : '真实姓名',
							name : 'UserRName',
							allowBlank : false,
							anchor : '85%'
						}, {
							// 用户联系电话
							xtype : 'numberfield',
							fieldLabel : '联系电话',
							name : 'UserPhone',
							minLength : 11,
							maxLength : 17,
							anchor : '85%'
						}, BranchField, Rolecombo]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							// 用户密码
							xtype : 'textfield',
							fieldLabel : '用户密码',
							name : 'UserPassWord',
							inputType : 'password',
							allowBlank : false,
							anchor : '85%'
						}, {
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
							hiddenName : 'UserSex',
							width : 125,
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '性别',
							anchor : '85%'
						}, {
							// 用户身份证
							xtype : 'textfield',
							fieldLabel : '身份证',
							name : 'UserCardID',
							minLength : 16,
							maxLength : 18,
							vtype : 'alphanum',
							allowBlank : false,
							anchor : '85%'
						}, Departmentcombo]
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
				height : 300,
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

					var str = record.get('UserID');

					Ext.Ajax.request({
						url : '../carmackUserInfoDelete.do',
						params : {
							userID : str
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
			 * 创建分公司Combox
			 */
			var Branchcombo = new Ext.form.ComboBox({
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

			/**
			 * 创建部门数据适配器，读取部门信息
			 */
			var Departmentstore = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
					url : '../Opt/JsonFactory/DepartmentInfo.jsp'
				}),
				reader : new Ext.data.JsonReader({}, [{
					name : 'DepartmentID'
				}, {
					name : 'DepartmentName'
				}])
			});

			/**
			 * 创建部门Combox
			 */
			var Departmentcombo = new Ext.form.ComboBox({
				fieldLabel : '部门名称',
				hiddenName : 'DepartmentID',
				xtype : 'combo',
				store : Departmentstore,
				mode : 'remote',
				emptyText : '请选择部门',
				triggerAction : 'all',
				valueField : 'DepartmentID',
				displayField : 'DepartmentName',
				width : 125,
				readOnly : true,
				allowBlank : false,
				editable : false,
				typeAhead : true,
				selectOnFocus : true,
				anchor : '85%'
			});

			/**
			 * 创建权限角色数据适配器，读取权限角信息
			 */
			var Rolestore = new Ext.data.Store({
				proxy : new Ext.data.HttpProxy({
					url : '../Opt/JsonFactory/RoleInfo.jsp'
				}),
				reader : new Ext.data.JsonReader({}, [{
					name : 'RoleID'
				}, {
					name : 'RoleName'
				}])
			});

			/**
			 * 创建权限角色Combox
			 */
			var Rolecombo = new Ext.form.ComboBox({
				fieldLabel : '权限角色',
				hiddenName : 'RoleID',
				xtype : 'combo',
				store : Rolestore,
				mode : 'remote',
				emptyText : '请选择权限角色',
				triggerAction : 'all',
				valueField : 'RoleID',
				displayField : 'RoleName',
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
				title : '用户详细信息',
				bodyStyle : 'padding:5px',
				height : 415,
				width : 650,
				frame : true,
				url : '../carmackUserInfoUpdate.do',

				items : [{
					layout : 'column',
					border : false,
					items : [{
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							// 用户编号
							xtype : 'textfield',
							fieldLabel : '用户编号',
							name : 'UserID',
							readOnly : true,
							anchor : '85%'
						}, {
							// 用户名
							xtype : 'textfield',
							fieldLabel : '用户名',
							name : 'UserName',
							anchor : '85%'
						}, {
							// 用户真实姓名
							xtype : 'textfield',
							fieldLabel : '真实姓名',
							name : 'UserRName',
							anchor : '85%'
						}, {
							// 用户联系电话
							xtype : 'numberfield',
							fieldLabel : '联系电话',
							name : 'UserPhone',
							minLength : 11,
							maxLength : 17,
							anchor : '85%'
						}, Rolecombo, {
							// 用户上次登录时间
							xtype : 'textfield',
							fieldLabel : '上次登录时间',
							name : 'UserLoginData',
							readOnly : true,
							anchor : '85%'
						}, {
							// 用户注册时间
							xtype : 'textfield',
							fieldLabel : '注册时间',
							name : 'UserRegData',
							readOnly : true,
							anchor : '85%'
						}]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [Branchcombo, {
							// 用户密码
							xtype : 'textfield',
							fieldLabel : '用户密码',
							name : 'UserPassWord',
							inputType : 'password',
							anchor : '85%'
						}, {
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
							hiddenName : 'UserSex',
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '性别',
							anchor : '85%'
						}, {
							// 用户身份证
							xtype : 'textfield',
							fieldLabel : '身份证',
							name : 'UserCardID',
							minLength : 16,
							maxLength : 18,
							vtype : 'alphanum',
							anchor : '85%'
						}, Departmentcombo, {
							// 用户登陆次数
							xtype : 'textfield',
							fieldLabel : '用户登陆次数号',
							name : 'UserLoginNum',
							readOnly : true,
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
				height : 435,
				// border:false,
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