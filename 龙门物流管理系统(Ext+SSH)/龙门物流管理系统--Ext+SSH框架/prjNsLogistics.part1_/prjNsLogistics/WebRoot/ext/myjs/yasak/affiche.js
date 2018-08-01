Ext.onReady(function() {
var top = new Ext.form.FormPanel({
	labelAlign : 'right',
	frame : true,
	collapsible : true,
	title : '增加公告',
	bodyStyle : 'padding:5px 5px 0',
	width : 770,
	hight : 800,
	url : '../yasak_afficheAdd.do',
	reader : new Ext.data.JsonReader({
		totalProperty : 'totalProperty',
		root : 'root'
	}),
	items : [{
				xtype : 'textfield',
				fieldLabel : '公告标题',
				name : 'title',
				anchor : '95%'

			}, {
				xtype : 'datefield',
				fieldLabel : '发布时间',
				name : 'data',
				format:'Ymd',
				anchor : '95%'
			},{
				xtype : 'htmleditor',
				id : 'content',
				fieldLabel : '详细内容',
				width : 680,
				height : 200,
				anchor : '95%'
	}],
	buttons : [{
		text : '发布',
		handler : function() {
			top.getForm().submit({
				success : function() {
					Ext.MessageBox.alert('信息', '发布成功，点击返回列表页面');
				},
				failure : function() {
					Ext.MessageBox.alert('信息', '发布失败，请与管理员联系！');
				}
			});
		}
	}]

});

top.render(document.body);
});