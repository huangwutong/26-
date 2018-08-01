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
		// 车辆编号
		header : '编号',
		dataIndex : 'TruckID',
		sortable : true
	}, {
		// 车牌号码
		header : '号码',
		dataIndex : 'TruckNum',
		sortable : true
	},{
		// 型号
		header : '型号',
		dataIndex : 'TMID',
		sortable : true
	},{
		//颜色
		header : '颜色',
		dataIndex : 'TruckColor',
		sortable : true
	},{
		// 购买时间
		header : '购买时间',
		dataIndex : 'TruckBuyData',
		sortable : true
	},{
		// 隶属分公司
		header : '隶属公司',
		dataIndex : 'BranchName',
		sortable : true
	},{
		// 操作列
		header : '操作',
		dataIndex : 'TruckID',
		renderer : renderDescn
	}]);

	/**
	 * 声明数据适配器，将数据源与列模型绑定
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../CarmacktruckInfoList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'TruckID',
			mapping : 'TruckID'
		}, {
			name : 'TruckNum',
			mapping : 'TruckNum'
		}, {
			name : 'TruckEngineNum',
			mapping : 'TruckEngineNum'
		}, {
			name : 'TruckRunNum',
			mapping : 'TruckRunNum'
		}, {
			name : 'TruckInsuranceNum',
			mapping : 'TruckInsuranceNum'
		}, {
			name : 'TMID',
			mapping : 'TMID'
		}, {
			name : 'TruckColor',
			mapping : 'TruckColor'
		}, {
			name : 'TruckPhoto',
			mapping : 'TruckPhoto'
		}, {
			name : 'TruckBuyData',
			mapping : 'TruckBuyData'
		}, {
			name : 'BranchID',
			mapping : 'BranchID'
		}, {
			name : 'BranchName',
			mapping : 'BranchName'
		}, {
			name : 'TruckIsVacancy',
			mapping : 'TruckIsVacancy'
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
		title : '车辆信息',
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
			text : '添加车辆',
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
		 * 创建车辆类型数据适配器，读取分公司信息
		 */
		var TruckModestore = new Ext.data.Store({
			proxy : new Ext.data.HttpProxy({
				url : '../Carmack/JsonFactory/TruckMode.jsp'
			}),
			reader : new Ext.data.JsonReader({}, [{
				name : 'tmid'
			}, {
				name : 'tmname'
			}])
		});

		/**
		 * 创建车辆类型Combox
		 */
		var TruckModecombo = new Ext.form.ComboBox({
			fieldLabel : '型号名称',
			hiddenName : 'TMID',
			xtype : 'combo',
			store : TruckModestore,
			mode : 'remote',
			emptyText : '请选择类型',
			triggerAction : 'all',
			valueField : 'tmid',
			displayField : 'tmname',
			width : 125,
			readOnly : true,
			allowBlank : false,
			editable : false,
			typeAhead : true,
			selectOnFocus : true,
			anchor : '85%'
		});
		
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
			title : '添加车辆信息',
			bodyStyle : 'padding:5px',
			height : 400,
			width : 650,
			frame : true,
			url : '../CarmacktruckInfoAdd.do',

			items : [{
				layout : 'column',
				border : false,
				items : [{
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						// 号码
						xtype : 'textfield',
						fieldLabel : '号码',
						name : 'TruckNum',
						allowBlank : false,
						anchor : '85%'
					}, {
						// 发动机号
						xtype : 'numberfield',
						fieldLabel : '发动机号',
						name : 'TruckEngineNum',
						minLength : 6,
						maxLength : 17,
						anchor : '85%'
					}, {
						// 行驶证号
						xtype : 'numberfield',
						fieldLabel : '行驶证号',
						name : 'TruckRunNum',
						minLength : 6,
						maxLength : 17,
						anchor : '85%'
					}, BranchField, TruckModecombo]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						// 保险单号
						xtype : 'numberfield',
						fieldLabel : '保险单号',
						name : 'TruckInsuranceNum',
						minLength : 6,
						maxLength : 17,
						anchor : '85%'
					},  {
						// 颜色
						xtype : 'textfield',
						fieldLabel : '颜色',
						name : 'TruckColor',
						allowBlank : false,
						anchor : '85%'
					}, {
						// 购买时间
						xtype : 'datefield',
						fieldLabel : '购买时间',
						name : 'TruckBuyData',
						format : 'Ymd',
						allowBlank : false,
						anchor : '85%'
					}, {
						// 状态
						xtype : 'combo',
						store : new Ext.data.SimpleStore({
							fields : ["TruckIsVacancy", "TruckIsVacancyV"],
							data : [['0', '空闲'], ['1', '在途'],['2','维修']]
						}),
						valueField : "TruckIsVacancy",
						displayField : "TruckIsVacancyV",
						mode : 'local',
						forceSelection : true,
						blankText : '请选择状态',
						emptyText : '请选择状态',
						hiddenName : 'TruckIsVacancy',
						width : 125,
						editable : false,
						triggerAction : 'all',
						allowBlank : false,
						fieldLabel : '状态',
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

					var str = record.get('TruckID');

					Ext.Ajax.request({
						url : '../carmacktruckInfoDelete.do',
						params : {
							TruckID : str
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
		 * 创建车辆类型数据适配器，读取分公司信息
		 */
		var TruckModestore = new Ext.data.Store({
			proxy : new Ext.data.HttpProxy({
				url : '../Carmack/JsonFactory/TruckMode.jsp'
			}),
			reader : new Ext.data.JsonReader({}, [{
				name : 'tmid'
			}, {
				name : 'tmname'
			}])
		});

		/**
		 * 创建车辆类型Combox
		 */
		var TruckModecombo = new Ext.form.ComboBox({
			fieldLabel : '型号名称',
			hiddenName : 'TMID',
			xtype : 'combo',
			store : TruckModestore,
			mode : 'remote',
			emptyText : '请选择类型',
			triggerAction : 'all',
			valueField : 'tmid',
			displayField : 'tmname',
			width : 125,
			readOnly : true,
			allowBlank : false,
			editable : false,
			typeAhead : true,
			selectOnFocus : true,
			anchor : '85%'
		});

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
		 * 声明一个FormPanel,显示选中信息，更改后提交
		 */
		var from = new Ext.form.FormPanel({
			labelAlign : 'top',
			buttonAlign : 'right',
			title : '更新车辆信息',
			bodyStyle : 'padding:5px',
			height : 400,
			width : 650,
			frame : true,
			url : '../CarmacktruckInfoUpdate.do',

			items : [{
				layout : 'column',
				border : false,
				items : [{
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						// 编号
						xtype : 'textfield',
						fieldLabel : '编号',
						name : 'TruckID',
						allowBlank : false,
						readOnly:true,
						anchor : '85%'
					},{
						// 号码
						xtype : 'textfield',
						fieldLabel : '号码',
						name : 'TruckNum',
						allowBlank : false,
						anchor : '85%'
					}, {
						// 发动机号
						xtype : 'textfield',
						fieldLabel : '发动机号',
						name : 'TruckEngineNum',
						vtype: 'alphanum',
						minLength : 6,
						maxLength : 17,
						anchor : '85%'
					}, {
						// 行驶证号
						xtype : 'textfield',
						fieldLabel : '行驶证号',
						name : 'TruckRunNum',
						vtype: 'alphanum',
						minLength : 4,
						maxLength : 17,
						anchor : '85%'
					}, Branchcombo]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						// 保险单号
						xtype : 'textfield',
						fieldLabel : '保险单号',
						name : 'TruckInsuranceNum',
						vtype: 'alphanum',
						minLength : 6,
						maxLength : 17,
						anchor : '85%'
					}, {
						// 颜色
						xtype : 'textfield',
						fieldLabel : '颜色',
						name : 'TruckColor',
						allowBlank : false,
						anchor : '85%'
					},{
						// 购买时间
						xtype : 'datefield',
						fieldLabel : '购买时间',
						name : 'TruckBuyData',
						format : 'Ymd',
						allowBlank : false,
						anchor : '85%'
					}, {
						// 状态
						xtype : 'combo',
						store : new Ext.data.SimpleStore({
							fields : ["TruckIsVacancy", "TruckIsVacancyV"],
							data : [['0', '空闲'], ['1', '在途'],['2','维修']]
						}),
						valueField : "TruckIsVacancy",
						displayField : "TruckIsVacancyV",
						mode : 'local',
						forceSelection : true,
						blankText : '请选择状态',
						emptyText : '请选择状态',
						hiddenName : 'TruckIsVacancy',
						width : 125,
						editable : false,
						triggerAction : 'all',
						allowBlank : false,
						fieldLabel : '状态',
						anchor : '85%'
					}, TruckModecombo]
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