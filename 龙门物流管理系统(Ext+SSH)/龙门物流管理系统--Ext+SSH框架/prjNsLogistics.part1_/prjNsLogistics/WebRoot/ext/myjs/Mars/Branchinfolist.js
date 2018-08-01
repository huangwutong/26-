Ext.onReady(function(){
	
	function renderDescn(value, cellmeta, record, rowIndex, columnIndex, store) {
		var str = "<input type='button' id='update-btn' value='详细信息' class='x-btn-wrap x-btn' onclick='selectinfo();'/>";
		return str;
	}
	var sm=new Ext.grid.RowSelectionModel();
	var cm=new Ext.grid.ColumnModel([
		new Ext.grid.RowNumberer(),
		{header:'公司编号',dataIndex:'branchid',sortable:true},
		{header:'公司名称',dataIndex:'branchname',sortable:true},
		{header:'公司联系人',dataIndex:'branchlinkman',sortable:true},
		{header:'公司电话',dataIndex:'branchphone',sortable:true},
		{header:'公司地址',dataIndex:'branchaddress',sortable:true},
		{header:'电子邮箱',dataIndex:'branchemail',sortable:true},
		{header:'操作',dataIndex:'branchid',renderer : renderDescn}
	]);
	var ds=new Ext.data.Store({
	proxy:new Ext.data.HttpProxy({url:'../mars_branchinfo_findAll.do'}),
	reader:new Ext.data.JsonReader({
	totalProperty:'totalProperty',
	root:'root'
	},[
	{name:'branchid'},
	{name:'branchname'},
	{name:'branchlinkman'},
	{name:'branchphone'},
	{name:'branchaddress'},
	{name:'branchemail'},
	])
	});
	
	window.selectinfo=function(){
		var win;
		if(!win){
	var selectRecode = grid.getSelectionModel().getSelected();
	var from = new Ext.form.FormPanel({
			labelAlign : 'top',
			buttonAlign : 'right',
			title : '�公司信息',
			bodyStyle : 'padding:5px',
			height : 360,
			autoScroll : true,
			width : 535,
			frame : true,
			items : [{
				layout : 'column',
				border : false,
				items : [{
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						xtype : 'textfield',
						fieldLabel : '公司编号',
						name : 'branchid',
						readOnly : true,
						anchor : '85%'
					}, {
						xtype : 'textfield',
						fieldLabel : '公司名称',
						name : 'branchname',
						readOnly : true,
						anchor : '85%'
					}, {
						xtype : 'textfield',
						fieldLabel : '公司联系人',
						name : 'branchlinkman',
						readOnly : true,
						anchor : '85%'
					}]
				}, {
					columnWidth : .5,
					layout : 'form',
					border : false,
					items : [{
						xtype:'textfield',
						fieldLabel:'公司电话',
						name:'branchphone',
						readOnly : true,
						anchor : '85%'
					}, {
						xtype : 'textfield',
						fieldLabel : '公司地址',
						name : 'branchaddress',
						readOnly : true,
						anchor : '85%'
					},{
						xtype:'textfield',
						fieldLabel:'电子邮箱',
						name:'branchemail',
						readOnly:true,
						anchor:'85%'
					}]
				}]
			}]

			
		});
		
		var win = new Ext.Window({
			title : 'InfoWindow',
			closable : true,
			width : 580,
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

		
		if (selectRecode != null) {
			from.getForm().loadRecord(selectRecode);
		}
	}
	var bbar=new Ext.PagingToolbar({
	pageSize:10,
	store:ds,
	displayInfo:true,
	displayMsg:'显示第{0}条到第{1}条记录，一共{2}条',	
	emptyMsg:'没有记录'
	});
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