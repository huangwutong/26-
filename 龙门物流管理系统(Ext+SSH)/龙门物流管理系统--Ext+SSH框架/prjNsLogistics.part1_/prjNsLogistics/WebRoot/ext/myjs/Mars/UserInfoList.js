Ext.onReady(function(){
	/**
	 * 声明一个函数，为操作列添加一个按钮
	 */
	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='update-btn' value='详细信息' class='x-btn-wrap x-btn' onclick='selectinfo();'/>";
		return str;
	}
	//设置全选按钮
	var sm=new Ext.grid.RowSelectionModel()
	//编辑列数据
	var cm=new Ext.grid.ColumnModel([
	new Ext.grid.RowNumberer(),
	{header:'用户编号',dataIndex:'userid',sortable:true},
	{header:'用户公司',dataIndex:'branchid',sortable:true},
	{header:'用户姓名',dataIndex:'userrname',sortable:true},
	{header:'用户性别',dataIndex:'usersex',sortable:true},
	{header:'用户部门',dataIndex:'departmentname',sortable:true},
	{header:'用户角色',dataIndex:'userrolename',sortable:true},
	{header:'操作',dataIndex:'userid',renderer : renderDescn}
	]);
	var ds=new Ext.data.Store({
	proxy:new Ext.data.HttpProxy({url:'../mars_useinfo_findAll.do'}),
	reader:new Ext.data.JsonReader({
	totalProperty:'totalProperty',
	root:'root'
	},[
	{name:'userid'},
	{name:'username'},
	{name:'branchid'},
	{name:'userrname'},
	{name:'userpassword'},
	{name:'usersex'},
	{name:'departmentname'},
	{name:'userphone'},
	{name:'usercardid'},
	{name:'userrolename'},
	{name:'userloginnum'},
	{name:'userlogindata'},
	{name:'userregdata'}
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
			title : '用户详细信息',
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
						// 用户编号
						xtype : 'textfield',
						fieldLabel : '用户编号',
						name : 'userid',
						readOnly : true,
						anchor : '95%'
					}, {
						// 用户名
						xtype : 'textfield',
						fieldLabel : '用户名',
						name : 'username',
						readOnly : true,
						anchor : '95%'
					}, {
						// 用户真实姓名
						xtype : 'textfield',
						fieldLabel : '真实姓名',
						name : 'userrname',
						readOnly : true,
						anchor : '95%'
					}, {
						// 用户联系电话
						xtype : 'textfield',
						fieldLabel : '联系电话',
						name : 'userphone',
						minLength : 11,
						maxLength : 17,
						readOnly : true,
						anchor : '95%'
					}, {
						xtype:'textfield',
						fieldLabel:'用户权限',
						name:'userrolename',
						readOnly : true,
						anchor : '95%'
						
					}, {
						// 用户上次登录时间
						xtype : 'textfield',
						fieldLabel : '上次登录时间',
						name : 'userlogindata',
						readOnly : true,
						anchor : '95%'
					}, {
						// 用户注册时间
						xtype : 'textfield',
						fieldLabel : '注册时间',
						name : 'userregdata',
						readOnly : true,
						anchor : '95%'
					}]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
					//用户所属公司
						xtype:'textfield',
						fieldLabel:'用户公司',
						name:'branchid',
						readOnly : true,
						anchor : '95%'
					}, {
						// 用户密码
						xtype : 'textfield',
						fieldLabel : '用户密码',
						name : 'userpassword',
						readOnly : true,
						anchor : '95%'
					}, {
						// 用户性别
						xtype : 'combo',
						fieldLabel:'性别',
						name:'usersex',
						readOnly : true,
						anchor : '95%'
						
					}, {
						// 用户身份证
						xtype : 'textfield',
						fieldLabel : '身份证',
						name : 'usercardid',
						minLength : 16,
						maxLength : 18,
						readOnly : true,
						anchor : '95%'
					}, {
						//用户部门
						xtype:'textfield',
						fieldLabel:'部门',
						name:'departmentname',
						anchor : '95%'
					}, {
						// 用户登陆次数
						xtype : 'textfield',
						fieldLabel : '用户登陆次数号',
						name : 'userloginnum',
						anchor : '95%',
						readOnly : true
					}]
				}]
			}]

			
		});
	/**
		 * 声明一个window,包装FormPanel
		 */
		var win = new Ext.Window({
			title : 'InfoWindow',
			closable : true,
			width : 620,
			height : 420,
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