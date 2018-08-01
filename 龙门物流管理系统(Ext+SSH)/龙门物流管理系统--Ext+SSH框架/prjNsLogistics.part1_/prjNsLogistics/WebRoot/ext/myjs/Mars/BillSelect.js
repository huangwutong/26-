Ext.onReady(function() {
	// 开启快速提示功能
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';
	/***************************************************************************
	 * 创建货票状态和公司角色的数据
	 */
	var data = [['9999','查询所有货票'],['1000', '客服接单,等待入库'], ['1001', '入库已确认'],
			['1002', '清点完毕,等待调度'], ['1003', '调度装配完毕,货已发出'],
			['1004', '货已到岸,未签收'], ['1005', '货已签收,未入库'], ['1006', '分拣完毕,已入库'],
			['1007', '客服通知客户,等待提货'], ['1008', '客户签收,付款提货']];
	var datatwo =[['0','全部'],['1','收货'],['2','发货']];
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
		//region:'north',
		title : '货票查询',
		buttonAlign : 'right',
		bodyStyle : 'padding:5px',
		width : 600,
		frame : true,
		labelWidth : 80,
		//url:'../mars_billinfo_getparam.do',
		items : [{
			border : false,
			labelSeparator : ':',
			items : [{
				xtype : 'fieldset',
				checkboxToggle : true,
				title : '查询范围',
				autoHeight : true,
				defaultType : 'textfield',
				collapsed : true,
				items : [{
					xtype : 'radio',
					fieldLabel : '按公司查询',
					name : 'radio',
					check : true,
				   listener : ('check',function(){
						cbo.disabled=true;
						txt.disabled=false;
					}),
					inputValue : 'branchid'
				}, {
					xtype : 'radio',
					fieldLabel : '按客户查询',
					name : 'radio',
					check : true,
					listener : ('check',function(){
						cbo.disabled=false;
						txt.disabled=true;
					}),
					inputValue : 'cussendid'
				}]
			}]
		}, {
			border : false,
			labelSeparator : ':',
			items : [tf]
		}],
		buttons : [{
			text : '查询',
			handler : function() {
				billselectform.getForm().submit({
				success :function(){
					//ds.load({params:{start:0,limit:5}});
					Ext.MessageBox.alert('信息', '查询成功');
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
	
	
	var tf = new Ext.form.FieldSet({
		checkboxToggle : true,
		title : '查询条件',
		autoHeight : true,
		defaultType : 'textfield',
		items : [{
		layout:'column',
		border:false,
		items:[{
		columnWidth:.5,
		layout:'form',
		border:false,
		itmes:[txt,{
		xtype : 'datefield',
			fieldLabel : '开始时间',
			name : 'billstartdata',
			width : 120
		},cbo]
		},{
		columnWidth:.5,
		layout:'from',
		border:fase,
		itmes:[cbotwo,{
		xtype : 'datefield',
		fieldLabel : '截止时间',
		name : 'billenddata',
		width : 120
		}
		]
		}]
		}]
	});
	


	var txt = new Ext.form.TextField({
		fieldLabel : '客户编号',
		name : 'branchid',
		width : 120,
		disabled:false,
		allowBlank : false
	});
	
	var cbo = new Ext.form.ComboBox({
		fieldLabel : '货票状态',
		hiddenName : 'billstateid',
		store : store,
		emptyText : '请选择货票状态',
		triggerAction : 'all',
		valueField : 'billstateid',
		displayField : 'billstatename',
		width : 120,
		readOnly : true,
		disabled:false,
		allowBlank : false,
		editable : false
	});
	var cbotwo=new Ext.form.ComboBox({
	fieldLabel : '公司角色',
	hiddenName : 'sendbranch',
	store:storetwo,
	emptyText:'请选择公司角色',
	triggerAction : 'all',
	valueField:'sendbranch',
	displayField:'sendbranchis',
	width:120,
	readOnly:true,
	disabled:false,
	allowBlank : false,
	editable:false
	})
	billselectform.render("billselect");
	// 定义显示的Grid
//	var sm=new Ext.grid.CheckboxSelectionModel();
//	
//	 编辑列数据
//	var cm=new Ext.grid.ColumnModel([
//		new Ext.grid.RowNumberer(),
//		sm,
//			{header:'货票编号',dataIndex:'billid',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'发货客户',dataIndex:'sendcusname',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'收货客户',dataIndex:'receivecusname',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'货物运输线路',dataIndex:'truckline',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'付款人',dataIndex:'payername',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'操作人',dataIndex:'username',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'货票制单时间',dataIndex:'billdata',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'货票状态',dataIndex:'billstatename',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'货票备注',dataIndex:'billmemo',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'发货公司',dataIndex:'sendbranchname',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//			{header:'收货公司',dataIndex:'receivebranchname',sortable:true,editor:new Ext.form.TextField({allowBlank:false,readOnly:true})},
//	]);
//	var ds=new Ext.data.Store({
//	proxy:new Ext.data.HttpProxy({url:'mars_billinfo_getparam.do'}),
//	reader:new Ext.data.JsonReader({
//	totalProperty:'totalProperty',
//	root:'root'
//	},[
//	{name:'billid'},
//	{name:'sendcusname'},
//	{name:'receivecusname'},
//	{name:'truckline'},
//	{name:'payername'},
//	{name:'username'},
//	{name:'billdata'},
//	{name:'billstatename'},
//	{name:'billmemo'},
//	{name:'sendbranchname'},
//	{name:'receivebranchname'}
//	])
//	});
//	 定义分页框
//	var bbar=new Ext.PagingToolbar({
//	pageSize:10,
//	store:ds,
//	displayInfo:true,
//	displayMsg:'显示第{0}条到第{1}条记录，一共{2}条',	
//	emptyMsg:'没有记录'
//	});
//	 定义Grid
//	var grid=new Ext.grid.EditorGridPanel({
//	region:'south',
//	width:450,
//	height:410,
//	ds:ds,
//	cm:cm,
//	sm:sm,
//	bbar:bbar
//	});
//	
//	
//	 声明一个VIEWPORT
//	var viewport=new Ext.Viewport({
//	layout:'border',
//	items:[tf,grid]
//	})
//	
})