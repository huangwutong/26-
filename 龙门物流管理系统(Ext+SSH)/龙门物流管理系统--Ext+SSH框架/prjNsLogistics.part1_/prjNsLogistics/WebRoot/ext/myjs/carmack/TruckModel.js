Ext.onReady(function() {

	/**
	 * 开启快速提示功能
	 */
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';

	// =================================列表显示========================================
	/**
	 * 生成多选框模型
	 */
	var sm = new Ext.grid.CheckboxSelectionModel();

	/**
	 * 生成列模型
	 */
	var cm = new Ext.grid.ColumnModel([new Ext.grid.RowNumberer(), sm, {
		// 车辆型号编号
		header : '编号',
		dataIndex : 'TMID',
		sortable : true,
		editor : new Ext.form.TextField({
			readOnly : true
		})
	}, {
		// 车辆型号名称
		header : '型号',
		dataIndex : 'TMName',
		sortable : true,
		editor : new Ext.form.TextField({
			allowBlank : false
		})
	}, {
		// 车辆载重
		header : '载重',
		dataIndex : 'TMWeight',
		sortable : true,
		editor : new Ext.form.NumberField({
			allowBlank : false
		})
	}, {
		// 车辆货仓容积
		header : '仓容',
		dataIndex : 'TMCubage',
		sortable : true,
		editor : new Ext.form.NumberField({
			allowBlank : false
		})
	}, {
		// 车辆默认成员
		header : '默认成员',
		dataIndex : 'TMPassenger',
		sortable : true,
		editor : new Ext.form.NumberField({
			allowBlank : false
		})
	}]);

	/**
	 * 声明数据适配器，将数据源与列模型绑定
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : '../carmackTruckModelList.do'
		}),
		reader : new Ext.data.JsonReader({
			totalProperty : 'totalProperty',
			root : 'root'
		}, [{
			name : 'TMID',
			mapping : 'TMID'
		}, {
			name : 'TMName',
			mapping : 'TMName'
		}, {
			name : 'TMWeight',
			mapping : 'TMWeight'
		}, {
			name : 'TMCubage',
			mapping : 'TMCubage'
		}, {
			name : 'TMPassenger',
			mapping : 'TMPassenger'
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
	 * Record模型
	 */
	var Record = Ext.data.Record.create([{
		name : 'TMID',
		type : 'string'
	}, {
		name : 'TMName',
		type : 'string'
	}, {
		name : 'TMWeight',
		type : 'string'
	}, {
		name : 'TMCubage',
		type : 'string'
	}, {
		name : 'TMPassenger',
		type : 'string'
	}]);

	/**
	 * 声明一个Grid，列表显示信息
	 */
	var grid = new Ext.grid.EditorGridPanel({
		el : 'TMgrid',
		title : '车辆型号信息',
		height : 400,
		trackMouseOver : false,
		loadMask : {
			msg : '正在加载数据，请稍后.....'
		},
		ds : store,
		cm : cm,
		sm : sm,
		bbar : bbar,

		buttons : [{
			text : "添加数据",
			handler : function() {
				var initValue = {
					TMID : '',
					TMName : '',
					TMWeight : '5',
					TMCubage : '24',
					TMPassenger : '2'
				};
				var p = new Record(initValue);

				grid.stopEditing();
				store.insert(0, p);
				grid.startEditing(0, 0);

				p.dirty = true;
				p.modified = initValue;
				if (store.modified.indexOf(p) == -1) {
					store.modified.push(p);
				}
			}
		}, {
			text : '删除选中数据',
			handler : function() {
				var sm = grid.getSelectionModel();
				var count = sm.getCount();
				if (count == 0) {
					Ext.MessageBox.alert('信息', '您没有勾选任何记录!');
				} else {
					Ext.MessageBox.confirm('Message', '确定要删除？', function(btn) {
						if (btn == 'yes') {
							var str = '';
							for (var i = 0; i < count; i++) {
								var record = sm.getSelections()[i];
								if (record.get('TMID') == null) {
									store.remove(record);
								} else {
									str = str + record.get('TMID') + ',';
								}
							}
							Ext.Ajax.request({
								url : '../carmackTruckModelDelete.do',
								params : {
									TMID : str
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
			}
		}, {
			text : '保存数据',
			handler : function() {
				var jsonArray = [];
				for (i = 0, cnt = store.getCount(); i < cnt; i += 1) {
					var record = store.getAt(i);
					if (record.dirty) { // 得到所有修改过的数据
						if (record.get('TMName') != '') {
							jsonArray.push(record.data);
						}
					}
				}
				if (jsonArray.length == 0) {
					Ext.MessageBox.alert('信息', '没有对数据进行任何更改');
					return;
				}
				Ext.Ajax.request({
					url : '../carmackTruckModelAdd.do',
					params : {
						data : Ext.encode(jsonArray)
					},
					success : function() {
						Ext.MessageBox.alert('信息', '保存成功');
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
		}]
	});

	/**
	 * 将Grid渲染呈现
	 */
	grid.render();
	store.load({
		params : {
			start : 0,
			limit : 10
		}
	});
})