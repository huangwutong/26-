Ext.apply(Ext.form.VTypes, {
  daterange: function(val, field) {
    var date = field.parseDate(val);
    
    // We need to force the picker to update values to recaluate the disabled dates display
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
    /* Always return true since we're only using this vtype
     * to set the min/max allowed values (these are tested
     * for after the vtype test)
     */
    return true;
  },
  
  password: function(val, field) {
    if (field.initialPassField) {
      var pwd = Ext.getCmp(field.initialPassField);
      return (val == pwd.getValue());
    }
    return true;
  },
  
  passwordText: 'Passwords do not match'
});

Ext.onReady(function() {
	// 开启快速提示功能
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';
	/***************************************************************************
	 * 创建货票状态和公司角色的数据
	 */
	var data = [['9999','全部'],['1001', '入库已确认'], ['1002', '调度装配完毕,货已发出'],
			['1003', '货已到岸,未签收'], ['1004', '货已签收,未入库'], ['1005', '分拣完毕,已入库'],
			['1006', '客服通知客户,等待提货'], ['1007', '客户签收,付款提货']];
	var datatwo = [['0', '全部'], ['1', '收货'], ['2', '发货']];
	var storetwo = new Ext.data.Store({
		proxy : new Ext.data.MemoryProxy(datatwo),
		reader : new Ext.data.ArrayReader({}, [{
			name : 'sendbranch',
			mapping : 0
		}, {
			name : 'sendbranchis',
			mapping : 1
		}])
	});
	var store = new Ext.data.Store({
		proxy : new Ext.data.MemoryProxy(data),
		reader : new Ext.data.ArrayReader({}, [{
			name : 'billstateid',
			mapping : 0
		}, {
			name : 'billstatename',
			mapping : 1
		}])
	});

	var billselectform = new Ext.FormPanel({
		labelAlign : 'left',
		region : 'north',
		title : '货票查询',
		buttonAlign : 'right',
		bodyStyle : 'padding:5px',
		width : 600,
		height:350,
		frame : true,
		labelWidth : 80,
		url : '../mars_billinfo_getparam.do',
		items : [{
			border : false,
			labelSeparator : ':',
			items : [{
				xtype : 'fieldset',
				title : '查询范围',
				autoHeight : true,
				defaultType : 'textfield',
				items : [{
					xtype : 'radio',
					fieldLabel : '按公司查询',
					name : 'radio',
					check : true,
					inputValue : 'branchid'
				}, {
					xtype : 'radio',
					fieldLabel : '按客户查询',
					name : 'radio',
					check : true,
					inputValue : 'customerid'
				}]
			}]
		}, {
			border : false,
			labelSeparator : ':',
			items : [{
				xtype : 'fieldset',
				title : '查询条件',
				autoHeight : true,
				defaultType : 'textfield',
				items : [{
					fieldLabel : '客户编号',
					name : 'cussendid',
					id:'cussendid',
					allowBlank : true
				}, {
					xtype : 'datefield',
					format:'Ymd',
					fieldLabel : '开始时间',
					name : 'billstartdata',
					id:'billstartdata',
					 vtype: 'daterange',
        			endDateField: 'billenddata'
				}, {
					xtype : 'datefield',
					format:'Ymd',
					fieldLabel : '截止时间',
					name : 'billenddata',
					id:'billenddata',
					vtype: 'daterange',
        			startDateField: 'billstartdata'
				}, {
					xtype : 'combo',
					fieldLabel : '货票状态',
					hiddenName : 'billstateid',
					store : store,
					emptyText : '请选择货票状态',
					triggerAction : 'all',
					valueField : 'billstateid',
					displayField : 'billstatename',
					readOnly : true,
					allowBlank : false,
					editable : false
				}, {
					xtype : 'combo',
					fieldLabel : '公司角色',
					hiddenName : 'sendbranch',
					store : storetwo,
					emptyText : '请选择公司角色',
					triggerAction : 'all',
					valueField : 'sendbranch',
					displayField : 'sendbranchis',
					readOnly : true,
					allowBlank : true,
					editable : false
				}]
			}]
		}],
		buttons : [{
			text : '查询',
			handler : function() {
				billselectform.getForm().submit({
					success : function() {
						ds.load({
							params : {
								start : 0,
								limit : 5
							}
						});

					},
					failure : function() {
						Ext.MessageBox.alert('信息', '查询失败，请确认查询条件!');
					}

				});

			}
		}, {
			text : '重置',
			handler : function() {
				billselectform.getForm().reset();
			}
		}]
	})
	// billselectform.render("select");
	//var sm = new Ext.grid.CheckboxSelectionModel();

	// 编辑列数据
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(),  {
		header : '货票编号',
		dataIndex : 'billid',
		sortable : true
		
	}, {
		header : '发货客户',
		dataIndex : 'sendcusname',
		sortable : true

	}, {
		header : '收货客户',
		dataIndex : 'receivecusname',
		sortable : true
		
	}, {
		header : '付款人',
		dataIndex : 'payername',
		sortable : true
		
	}, {
		header : '货票制单时间',
		dataIndex : 'billdata',
		sortable : true
		
	}, {
		header : '货票状态',
		dataIndex : 'billstatename',
		sortable : true
		
	}, {
		header : '收货公司',
		dataIndex : 'receivebranchname',
		sortable : true
		
	},]);
	var ds = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : 'BillJson.jsp'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'billid'
		}, {
			name : 'sendcusname'
		}, {
			name : 'receivecusname'
		}, {
			name : 'truckline'
		}, {
			name : 'payername'
		}, {
			name : 'username'
		}, {
			name : 'billdata'
		}, {
			name : 'billstatename'
		}, {
			name : 'billmemo'
		}, {
			name : 'sendbranchname'
		}, {
			name : 'receivebranchname'
		}])
	});
	// 定义分页框
	var bbar = new Ext.PagingToolbar({
		pageSize : 10,
		store : ds,
		displayInfo : true,
		displayMsg : '显示第{0}条到第{1}条记录，一共{2}条',
		emptyMsg : '没有记录'
	});
	// 定义Grid
	var grid = new Ext.grid.EditorGridPanel({
		region : 'center',
		autoScroll:true,
		height : 150,
		ds : ds,
		cm : cm,
		//sm : sm,
		bbar : bbar
	});

	//声明一个VIEWPORT
	var viewport = new Ext.Viewport({
		layout : 'border',
		items : [billselectform, grid]
	})
})