Ext.onReady(function(){
	/**
	 * 声明一个函数，为操作列添加一个按钮
	 */
	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='update-btn' value='详细信息' class='x-btn-wrap x-btn' onclick='selectinfo();'/>";
		return str;
	}
//设置全选按钮
	var sm=new Ext.grid.RowSelectionModel();
	//编辑列数据
	var cm=new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
		{header:'客户编号',dataIndex:'customerid',sortable:true},
		{header:'客户姓名',dataIndex:'customername',sortable:true},
		{header:'客户联系人名称',dataIndex:'customerlinkman',sortable:true},
		{header:'客户联系电话',dataIndex:'customerphone',sortable:true},
		{header:'所属分公司',dataIndex:'branchid',sortable:true},
		{header:'操作',dataIndex:'customerid',renderer : renderDescn}
	]);
	var ds=new Ext.data.Store({
	proxy:new Ext.data.HttpProxy({url:'../mars_customerinfo_findAll.do'}),
	reader:new Ext.data.JsonReader({
	totalProperty:'totalProperty',
	root:'root'
	},[
	{name:'customerid'},
	{name:'customername'},
	{name:'customerlinkman'},
	{name:'customersex'},
	{name:'customerphone'},
	{name:'customerfax'},
	{name:'customerpostid'},
	{name:'customeremail'},
	{name:'customerregdata'},
	{name:'branchid'}
	])
	});
	/**
	 * 为操作列按钮编写单击事件
	 */
	
	window.selectinfo=function(){
	var win;
		if(!win){
	var selectRecode = grid.getSelectionModel().getSelected();
	var from = new Ext.form.FormPanel({
			labelAlign : 'top',
			buttonAlign : 'right',
			title : '客户详细信息',
			bodyStyle : 'padding:5px',
			height : 400,
			autoScroll : true,
			width : 600,
			frame : true,
			items : [{
				layout : 'column',
				border : false,
				items : [{
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						// 客户编号
						xtype : 'textfield',
						fieldLabel : '客户编号',
						name : 'customerid',
						readOnly : true,
						anchor : '85%'
					}, {
						// 客户名
						xtype : 'textfield',
						fieldLabel : '客户名',
						name : 'customername',
						readOnly : true,
						anchor : '85%'
					}, {
						// 客户真实姓名
						xtype : 'textfield',
						fieldLabel : '客户联系人',
						name : 'customerlinkman',
						readOnly : true,
						anchor : '85%'
					}, {
						// 客户联系电话
						xtype : 'textfield',
						fieldLabel : '性别',
						name : 'customersex',
						readOnly : true,
						anchor : '85%'
					}, {
						xtype:'textfield',
						fieldLabel:'客户电话',
						name:'customerphone',
						readOnly : true,
						anchor : '85%'
						
					}]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
					//用户所属公司
						xtype:'textfield',
						fieldLabel:'客户传真',
						name:'customerfax',
						readOnly : true,
						anchor : '85%'
					}, {
						// 用户密码
						xtype : 'textfield',
						fieldLabel : '客户邮政编码',
						name : 'customerpostid',
						readOnly : true,
						anchor : '85%'
					}, {
						// 用户性别
						xtype : 'textfield',
						fieldLabel:'客户电子邮件',
						name:'customeremail',
						readOnly : true,
						anchor : '85%'
						
					}, {
						// 用户身份证
						xtype : 'textfield',
						fieldLabel : '客户注册时间',
						name : 'customerregdata',
						readOnly : true,
						anchor : '85%'
					}, {
						// 用户登陆次数
						xtype : 'textfield',
						fieldLabel : '所属客户分公司',
						name : 'branchid',
						anchor : '85%',
						readOnly : true
					}]
				}]
			}]

			
		});
		/**
		 * 声明一个window,包装FormPanel
		 */
		 win = new Ext.Window({
			title : 'InfoWindow',
			closable : true,
			width : 610,
			height : 400,
			autoScroll:true,
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
		if (selectRecode != null) {
			from.getForm().loadRecord(selectRecode);
		}	
	}
	//定义分页框
	var bbar=new Ext.PagingToolbar({
	pageSize:10,
	store:ds,
	displayInfo:true,
	displayMsg:'显示第{0}条到第{1}条记录，一共{2}条',	
	emptyMsg:'没有记录'
	});
	//定义Grid
	var grid=new Ext.grid.EditorGridPanel({
	el:'grid',
	height:300,
	autoScroll:true,
	ds:ds,
	cm:cm,
	sm:sm,
	bbar:bbar
	});
	grid.render();
	ds.load({params:{start:0,limit:5}});
})