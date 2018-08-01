Ext.onReady(function() {
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';
	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='show-btn' value='查看' class='x-btn-wrap x-btn' onclick='checkInfo();'/>";
		return str;
	}

	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), {
		header : '货票编号',
		dataIndex : 'billId',
		sortable : true
	}, {
		header : '发货单位',
		dataIndex : 'sendName'
	}, {
		header : '收货单位',
		dataIndex : 'receiveName'
	}, {
		header : '制单时间',
		dataIndex : 'billData'
	}, {
		header : '货票状态',
		dataIndex : 'billDataName'
	}, {
		header : '发货公司',
		dataIndex : 'sendBranchName'
	}, {
		header : '收货公司',
		dataIndex : 'receiveBranchName'
	}, {
		header : '操作',
		dataIndex : 'descn',
		renderer : renderDescn
	}]);
	var ds = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../yasak_BillList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'billId',
			mapping : 'billId'
		}, {
			name : 'sendId',
			mapping : 'sendId'
		}, {
			name : 'sendName',
			mapping : 'sendName'
		}, {
			name : 'receiveId',
			mapping : 'receiveId'
		}, {
			name : 'receiveName',
			mapping : 'receiveName'
		}, {
			name : 'userId',
			mapping : 'userId'
		}, {
			name : 'userName',
			mapping : 'userName'
		}, {
			name : 'billData',
			mapping : 'billData'
		}, {
			name : 'billDataId',
			mapping : 'billDataId'
		}, {
			name : 'billDataName',
			mapping : 'billDataName'
		}, {
			name : 'sendBranchId',
			mapping : 'sendBranchName'
		}, {
			name : 'sendBranchName',
			mapping : 'sendBranchName'
		}, {
			name : 'receiveBranchId',
			mapping : 'receiveBranchId'
		}, {
			name : 'receiveBranchName',
			mapping : 'receiveBranchName'
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
		title : '货票详细信息',
		width : 830,
		height : 260,
		trackMouseOver : false,
		loadMask : {
			msg : '正在加载数据，请稍候....'
		},
		ds : ds,
		cm : cm,
		sm : new Ext.grid.RowSelectionModel(),
		bbar : bbar
	});

	window.checkInfo = function() {
		var win;
		var selectRecode = grid.getSelectionModel().getSelected();
		var srID = selectRecode.data['billId'];
		if (!win) {
			var from = new Ext.form.FormPanel({
				labelAlign : 'top',
				buttonAlign : 'right',
				title : '货票详细信息',
				bodyStyle : 'padding:5px',
				height : 370,
				autoScroll : false,
				width : 600,
				frame : true,
				url : '../yasak_BillUpdate.do',
				reader : new Ext.data.JsonReader({
					totalProperty : 'totalProperty',
					root : 'root'
				}),
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
							name : 'billId',
							readOnly : true,
							anchor : '95%'
						}, {
							xtype : 'textfield',
							fieldLabel : '发货单位编号',
							name : 'sendId',
							anchor : '95%'
						}, {
							xtype : 'textfield',
							fieldLabel : '发货单位',
							name : 'sendName',
							anchor : '95%'
						}, {
							xtype : 'textfield',
							fieldLabel : '收货单位编号',
							name : 'receiveId',
							anchor : '95%'
						}, {
							xtype : 'textfield',
							fieldLabel : '收货单位',
							name : 'receiveName',
							anchor : '95%'
						}, {
							xtype : 'textfield',
							fieldLabel : '发货分公司',
							name : 'sendBranchName',
							readOnly : 'true',
							anchor : '95%'
						}]
					}, {
						columnWidth : .5,
						layout : 'form',
						border : false,
						items : [{
							xtype : 'textfield',
							fieldLabel : '操作人编号',
							name : 'userId',
							readOnly : 'true',
							anchor : '95%'
						}, {
							xtype : 'textfield',
							fieldLabel : '操作人姓名',
							name : 'userName',
							readOnly : 'true',
							anchor : '95%'
						}, {
							xtype : 'datefield',
							fieldLabel : '填写日期',
							name : 'billData',
							format:'Ymd',
							anchor : '95%'
						}, {
							xtype : 'combo',
							store : new Ext.data.SimpleStore({
								fields : ["billDataId", "billDataName"],
								data : [[1000, 'Send_客服已接单,等待入库'],
										[1001, 'Send_入库已确认'],
										[1002, 'Send_调度装配完毕,货已发出'],
										[1003, 'Receive_货已到岸,未签收'],
										[1004, 'Receive_货已签收,未入库'],
										[1005, 'Receive_分拣完毕,已入库'],
										[1006, 'Receive_客服通知客户,等待提货'],
										[1007, 'Receive_客户验收,付款提货']]
							}),
							valueField : "billDataId",
							displayField : "billDataName",
							mode : 'local',
							forceSelection : true,
							blankText : '请选择货票状态',
							emptyText : '选择货票状态',
							hiddenName : 'billDataId',
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '选择货票状态',
							anchor : '95%'
						}, {
							xtype : 'combo',
							store : new Ext.data.SimpleStore({
								fields : ["receiveBranchId",
										"receiveBranchName"],
								data : [[100, '盛唐物流'], [101, '龙城仓储中心'],
										[102, '古城仓储中心'], [103, '黑土地仓储中心'],
										[104, '稽郡仓储中心'], [105, '天府仓储中心'],
										[106, '罗布泊仓储中心']]
							}),
							valueField : "receiveBranchId",
							displayField : "receiveBranchName",
							mode : 'local',
							forceSelection : true,
							blankText : '请选择收货分公司',
							emptyText : '选择收货分公司',
							hiddenName : 'receiveBranchId',
							editable : false,
							triggerAction : 'all',
							allowBlank : false,
							fieldLabel : '选择收货分公司',
							anchor : '95%'
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
								ds.load({
									params : {
										start : 0,
										limit : 10
									}
								});
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
				height : 400,
				plain : true,
				draggable : true,
				collapsible : true,
				items : [from]
			});
		}
		win.show(Ext.get('show-btn'));
		from.getForm().loadRecord(selectRecode);
	};
	var top = new Ext.form.FormPanel({
		labelAlign : 'right',
		frame : true,
		collapsible : true,
		title : '增加货票信息',
		bodyStyle : 'padding:5px 5px 0',
		width : 830,
		hight : 800,
		url : '../yasak_BillAdd.do',
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}),
		items : [{
			layout : 'column',
			items : [{
				columnWidth : .5,
				layout : 'form',
				items : [{
					xtype : 'textfield',
					fieldLabel : '发货单位编号',
					name : 'sendId',
					anchor : '95%'

				}, {
					xtype : 'textfield',
					fieldLabel : '收货单位编号',
					name : 'receiveId',
					anchor : '95%'
				}]
			}, {
				columnWidth : .5,
				layout : 'form',
				items : [{
					xtype : 'datefield',
					fieldLabel : '制单时间',
					name : 'billData',
					format:'Ymd',
					anchor : '95%'
				}, {
					xtype : 'combo',
					store : new Ext.data.SimpleStore({
						fields : ["billDataId", "billDataName"],
						data : [[1000, 'Send_客服已接单,等待入库'],
								[1001, 'Send_入库已确认'],
								[1002, 'Send_调度装配完毕,货已发出'],
								[1003, 'Receive_货已到岸,未签收'],
								[1004, 'Receive_货已签收,未入库'],
								[1005, 'Receive_分拣完毕,已入库'],
								[1006, 'Receive_客服通知客户,等待提货'],
								[1007, 'Receive_客户验收,付款提货']]
					}),
					valueField : "billDataId",
					displayField : "billDataName",
					mode : 'local',
					forceSelection : true,
					blankText : '请选择货票状态',
					emptyText : '选择货票状态',
					hiddenName : 'billDataId',
					editable : false,
					triggerAction : 'all',
					allowBlank : false,
					fieldLabel : '选择货票状态',
					anchor : '95%'
				}]
			}, {
				columnWidth : .5,
				layout : 'form',
				items : [{

					xtype : 'combo',
					store : new Ext.data.SimpleStore({
						fields : ["receiveBranchId", "receiveBranchName"],
						data : [[100, '盛唐物流'], [101, '龙城仓储中心'],
								[102, '古城仓储中心'], [103, '黑土地仓储中心'],
								[104, '稽郡仓储中心'], [105, '天府仓储中心'],
								[106, '罗布泊仓储中心']]
					}),
					valueField : "receiveBranchId",
					displayField : "receiveBranchName",
					mode : 'local',
					forceSelection : true,
					blankText : '请选择收货分公司',
					emptyText : '选择收货分公司',
					hiddenName : 'receiveBranchId',
					editable : false,
					triggerAction : 'all',
					allowBlank : false,
					fieldLabel : '选择收货分公司',
					anchor : '95%'

				}]
			}]
		}],

		buttons : [{
			text : '查看客户资料',
			id : 'win1',
			handler : function() {
				var win;
				if (!win) {
					var cm1 = new Ext.grid.ColumnModel([
							new Ext.grid.RowNumberer(), {
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
								header : '客户联系电话',
								dataIndex : 'customerPhone'
							}, {
								header : '所属公司',
								dataIndex : 'branchName'
							}]);
					var ds1 = new Ext.data.Store({
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
							name : 'customerPhone',
							mapping : 'customerPhone'
						}, {
							name : 'branchId',
							mapping : 'branchId'
						}, {
							name : 'branchName',
							mapping : 'branchName'
						}])
					});
					var bbar1 = new Ext.PagingToolbar({
						pageSize : 10,
						store : ds1,
						displayInfo : true,
						displayMsg : '显示第{0}条到{1}条,一共{2}条',
						emptyMsg : '没有记录'
					});

					var grid1 = new Ext.grid.EditorGridPanel({
						// el : 'grid1',
						title : '客户详细信息',
						width : 535,
						height : 310,
						trackMouseOver : false,
						loadMask : {
							msg : '正在加载数据，请稍候....'
						},
						ds : ds1,
						cm : cm1,
						sm : new Ext.grid.RowSelectionModel(),
						bbar : bbar1
					});

					win = new Ext.Window({
						title : 'InfoWindow',
						closable : true,
						width : 550,
						height : 350,
						plain : true,
						draggable : true,
						collapsible : true,
						closeAction : 'hide',
						items : [grid1]
					});
				}
				win.show(Ext.get('win1'));
				grid1.render();
				ds1.load({
					params : {
						start : 0,
						limit : 10
					}
				});
			}
		}, {
			text : '添加货票信息',
			handler : function() {
				top.getForm().submit({
					success : function() {
						Ext.MessageBox.alert('信息', '添加成功，点击返回列表页面');
						grid.render();
						ds.load({
							params : {
								start : 0,
								limit : 10
							}
						});
					},
					failure : function() {
						Ext.MessageBox.alert('信息', '添加失败，请与管理员联系！');
					}
				});
			}
		}]

	});

	top.render(document.body);
	grid.render();
	ds.load({
		params : {
			start : 0,
			limit : 10
		}
	});

});