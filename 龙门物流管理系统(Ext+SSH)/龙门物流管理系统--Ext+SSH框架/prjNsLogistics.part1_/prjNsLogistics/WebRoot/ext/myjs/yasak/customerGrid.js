Ext.onReady(function() {
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';
	function renderSex(value) {
		if (value == "男") {
			return "<span style='color:red;font-weight:bold;'>男</span>"
		} else {
			return "<span style='color:green;font-weight:bold;'>女</span>"
		}
	}

	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='show-btn' value='查看' class='x-btn-wrap x-btn' onclick='checkInfo();'/>";
		return str;
	}

	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
		header : '客户编号',
		dataIndex : 'customerId',
		sortable : true
	}, {
		header : '公司名称',
		dataIndex : 'customerName'
	}, {
		header : '客户联系人名称',
		dataIndex : 'customerLinkMan'
	}, {
		header : '客户联系人性别',
		dataIndex : 'customerSex',
		renderer : renderSex
	}, {
		header : '客户联系电话',
		dataIndex : 'customerPhone'
	}, {
		header : '所属公司',
		dataIndex : 'branchName'
	}, {
		header : '操作',
		dataIndex : 'descn',
		renderer : renderDescn
	}]);
	var ds = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../yasak_CustomerList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'customerId',
			mapping : 'customerId'
		}, {
			name : 'customerName',
			mapping : 'customerName'
		}, {
			name : 'customerLinkMan',
			mapping : 'customerLinkMan'
		}, {
			name : 'customerSex',
			mapping : 'customerSex'
		}, {
			name : 'customerPhone',
			mapping : 'customerPhone'
		}, {
			name : 'customerFax',
			mapping : 'customerFax'
		}, {
			name : 'customerPostId',
			mapping : 'customerPostId'
		}, {
			name : 'customerEmail',
			mapping : 'customerEmail'
		}, {
			name : 'customerRegData',
			mapping : 'customerRegData'
		}, {
			name : 'branchId',
			mapping : 'branchId'
		}, {
			name : 'branchName',
			mapping : 'branchName'
		}, {
			name : 'descn',
			mapping : 'descn'
		}])
	});
	var bbar = new Ext.PagingToolbar({
		pageSize : 10,
		store : ds,
		displayInfo : true,
		displayMsg : '显示第{0}条到{1}条,一共{2}条',
		emptyMsg : '没有记录'
	});

	var grid = new Ext.grid.EditorGridPanel({
		el : 'grid',
		title : '客户详细信息',
		width : 700,
		height : 410,
		trackMouseOver : false,
		loadMask : {
			msg : '正在加载数据，请稍候....'
		},
		ds : ds,
		cm : cm,
		sm : new Ext.grid.RowSelectionModel(),
		bbar : bbar,
		buttons : [{
			text : '新增客户信息',
			id : 'win1',
			handler : function() {
				var win;
				// ============================
				if (!win) {
					var fm = new Ext.form.FormPanel({
						labelAlign : 'top',
						buttonAlign : 'right',
						title : '添加客户详细信息',
						bodyStyle : 'padding:5px',
						height : 345,
						autoScroll : false,
						width : 600,
						frame : true,
						url : '../yasak_CustomerAdd.do',
						reader : new Ext.data.JsonReader({
							totalProperty : 'totalProperty',
							root : 'root'
						}
//						[{
//							name : 'customerName',
//							mapping : 'customerName'
//						}, {
//							name : 'customerLinkMan',
//							mapping : 'customerLinkMan'
//						}, {
//							name : 'customerSex',
//							mapping : 'customerSex'
//						}, {
//							name : 'customerPhone',
//							mapping : 'customerPhone'
//						}, {
//							name : 'customerFax',
//							mapping : 'customerFax'
//						}, {
//							name : 'customerPostId',
//							mapping : 'customerPostId'
//						}, {
//							name : 'customerEmail',
//							mapping : 'customerEmail'
//						}, {
//							name : 'customerRegData',
//							mapping : 'customerRegData'
//						}, {
//							name : 'branchId',
//							mapping : 'branchId'
//						}]
						),
						items : [{
							layout : 'column',
							border : false,
							items : [{
								columnWidth : .5,
								layout : 'form',
								border : false,
								items : [{
									xtype : 'textfield',
									fieldLabel : '客户名称',
									name : 'customerName',
									anchor : '85%'
								}, {
									xtype : 'textfield',
									fieldLabel : '客户联系人名称',
									name : 'customerLinkMan',
									anchor : '85%'
								}, {									
									// 用户性别
							xtype : 'combo',
							store : new Ext.data.SimpleStore({
								fields : ["customerSex", "customerSex"],
								data : [['男', '男'], ['女', '女']]
							}),
							valueField : "customerSex",
							displayField : "customerSex",
							mode : 'local',
							forceSelection : true,
							blankText : '请选择性别',
							emptyText : '请选择性别',
							hiddenName : 'customerSex',
							width : 125,
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '客户联系人性别',
							anchor : '85%'
								},  {
									xtype : 'datefield',
									fieldLabel : '客户注册时间',
									readOnly : true,
									name : 'customerRegData',
									format:'Ymd',
									anchor : '85%'
								}]
							}, {
								columnWidth : .5,
								layout : 'form',
								border : false,
								items : [{
									xtype : 'numberfield',
									fieldLabel : '客户邮政编码',
									name : 'customerPostId',
									minLength : 5,
									maxLength : 7,
									anchor : '85%'
								},{
									xtype : 'numberfield',
									fieldLabel : '客户联系人电话',
									name : 'customerPhone',
									minLength : 6,
									maxLength : 14,
									anchor : '85%'
								}, {
									xtype : 'numberfield',
									fieldLabel : '客户传真号码',
									name : 'customerFax',
									minLength : 6,
									maxLength : 14,
									anchor : '85%'
								}, {
									xtype : 'textfield',
									fieldLabel : '客户电子邮件',
									vtype:'email',
									name : 'customerEmail',
									anchor : '85%'
								}]
							}]
						}],
						buttons : [{
							text : '添加',
							handler : function() {
								fm.getForm().submit({
									success : function() {
										Ext.MessageBox.alert('信息',
												'添加成功，点击返回列表页面');
										win.close();
									},
									failure : function() {
										Ext.MessageBox.alert('信息',
												'添加失败，请与管理员联系！');
									}
								});
							}
						}]
					});

					win = new Ext.Window({
						title : 'InfoWindow',
						closable : true,
						width : 615,
						height : 380,
						plain : true,
						draggable : true,
						collapsible : true,
						closeAction : 'hide',
						items : [fm]
					});
				}

				win.show(Ext.get('win1'));

				/**
				 * 声明window监听器，当window关闭时，刷新Grid
				 */
				win.on('close', function() {
					grid.render();
					ds.load({
						params : {
							start : 0,
							limit : 10
						}
					});
				});
				// ============================
			}
		}]
	});
	window.checkInfo = function() {
		var win;

		var selectRecode = grid.getSelectionModel().getSelected();
		var srID = selectRecode.data['customerId'];

		var from = new Ext.form.FormPanel({
			labelAlign : 'top',
			buttonAlign : 'right',
			title : '客户详细信息',
			bodyStyle : 'padding:5px',
			height : 345,
			autoScroll : false,
			width : 600,
			frame : true,
			url : '../yasak_CustomerUpdate.do',
			reader : new Ext.data.JsonReader({
				totalProperty : 'totalProperty',
				root : 'root'
			}
			// [{
			// name : 'customerId',
			// mapping : 'customerId'
			// }, {
			// name : 'customerName',
			// mapping : 'customerName'
			// }, {
			// name : 'customerLinkMan',
			// mapping : 'customerLinkMan'
			// }, {
			// name : 'customerSex',
			// mapping : 'customerSex'
			// }, {
			// name : 'customerPhone',
			// mapping : 'customerPhone'
			// }, {
			// name : 'customerFax',
			// mapping : 'customerFax'
			// }, {
			// name : 'customerPostId',
			// mapping : 'customerPostId'
			// }, {
			// name : 'customerEmail',
			// mapping : 'customerEmail'
			// }, {
			// name : 'customerRegData',
			// mapping : 'customerRegData'
			// }, {
			// name : 'branchId',
			// mapping : 'branchId'
			// }]
			),
			items : [{
				layout : 'column',
				border : false,
				items : [{
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						xtype : 'textfield',
						fieldLabel : '客户编号',
						name : 'customerId',
						readOnly : true,
						anchor : '85%'
					}, {
						xtype : 'textfield',
						fieldLabel : '客户名称',
						name : 'customerName',
						anchor : '85%'
					}, {
						xtype : 'textfield',
						fieldLabel : '客户联系人名称',
						name : 'customerLinkMan',
						anchor : '85%'
					}, {
						// 用户性别
							xtype : 'combo',
							store : new Ext.data.SimpleStore({
								fields : ["customerSex", "customerSex"],
								data : [['男', '男'], ['女', '女']]
							}),
							valueField : "customerSex",
							displayField : "customerSex",
							mode : 'local',
							forceSelection : true,
							blankText : '请选择性别',
							emptyText : '请选择性别',
							hiddenName : 'customerSex',
							width : 125,
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '客户联系人性别',
							anchor : '85%'
					}, {
						xtype : 'numberfield',
						fieldLabel : '客户联系人电话',
						minLength : 6,
						maxLength : 14,
						name : 'customerPhone',
						anchor : '85%'
					}]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						xtype : 'numberfield',
						fieldLabel : '客户传真号码',
						minLength : 6,
						maxLength : 14,
						name : 'customerFax',
						anchor : '85%'
					}, {
						xtype : 'numberfield',
						fieldLabel : '客户邮政编码',
						minLength : 5,
						maxLength : 7,
						name : 'customerPostId',
						anchor : '85%'
					}, {
						xtype : 'textfield',
						fieldLabel : '客户电子邮件',
						vtype:'email',
						name : 'customerEmail',
						anchor : '85%'
					}, {
						xtype : 'textfield',
						fieldLabel : '客户注册时间',
						readOnly : true,
						name : 'customerRegData',
						anchor : '85%'
					}, {
						xtype : 'textfield',
						fieldLabel : '本公司名称',
						readOnly : true,
						name : 'branchName',
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
							win.close();
						},
						failure : function() {
							Ext.MessageBox.alert('信息', '更新失败，请与管理员联系！');
						}
					});
				}
			}]
		});

		win = new Ext.Window({
			title : 'InfoWindow',
			closable : true,
			width : 615,
			height : 380,
			plain : true,
			draggable : true,
			collapsible : true,
			items : [from]
		});

		win.show(Ext.get('show-btn'));

		from.getForm().loadRecord(selectRecode);
		/**
		 * 声明window监听器，当window关闭时，刷新Grid
		 */
		win.on('close', function() {
			grid.render();
			ds.load({
				params : {
					start : 0,
					limit : 10
				}
			});
		});

	};

	grid.render();
	ds.load({
		params : {
			start : 0,
			limit : 10
		}
	});

});