Ext.onReady(function() {
	
	// 开启快速提示功能
	Ext.QuickTips.init();
	Ext.form.Field.prototype.msgTarget = 'side';

	/**
	 * 创建数据适配器，读取分公司信息
	 */
	var store = new Ext.data.Store({
		proxy : new Ext.data.HttpProxy({
			url : 'Opt/JsonFactory/BranchInfo.jsp'
		}),
		reader : new Ext.data.JsonReader({}, [{
			name : 'branchid'
		}, {
			name : 'branchname'
		}])
	});

	/**
	 * 创建一个Combox
	 */
	var combo = new Ext.form.ComboBox({
		fieldLabel : '分公司',
		hiddenName : 'branchid',
		xtype : 'combo',
		store : store,
		mode : 'remote',
		emptyText : '请选择公司',
		triggerAction : 'all',
		valueField : 'branchid',
		displayField : 'branchname',
		width:125,
		readOnly : true,
		allowBlank : false,
		editable : false,
		typeAhead: true,
		selectOnFocus:true
	});

	/**
	 * 创建一个登陆FormPanel
	 */
	var loginform = new Ext.FormPanel({
		labelAlign : 'right',
		title : '登陆窗口',
		buttonAlign : 'right',
		width : 260,
		frame : true,
		url : 'optUserLogin.do',
		plain : true,
		defaultType : 'textfield',
		labelWidth : 50,
		labelSeparator : ':',
		bodyStyle:'padding:5px 5px 0',
		
		items : [{	
			fieldLabel : '用户名',
			name : 'username',
			width:125,
			allowBlank : false
		}, {
			fieldLabel : '密码',
			name : 'userpassword',
			inputType : 'password',
			width:125,
			allowBlank : false
		}, combo],

		buttons : [{
			text : '登陆',
			handler : function() {
				if (loginform.form.isValid()) {
					loginform.getForm().submit({
						success : function() {
							window.location = path;
						},
						failure : function() {
							Ext.MessageBox.alert('信息', '登陆失败，请与管理员联系!');
						}
					});
				}
			}
		}, {
			text : '重置',
			handler : function() {
				loginform.getForm().reset();
			}
		}]
	})

	/**
	 * 获取跳转路径
	 * */
	var path = window.location.pathname;
	path = path.substring(0, path.lastIndexOf('/') + 1);
	path += "Opt/Main.html";

//	/**
//	 * 声明一个Windows
//	 * */
//	var win = new Ext.Window({
//		el:"window",
//		layout:'fit',
//		width:400,
//		height:350,
//		closeAction:'hide',
//		
//		items:[loginform]
//	});
//	
//	/**
//	 * 声明一个ViewPort
//	 * */
//	var viewport = new Ext.Viewport({
//		layout:'border',
//		items:[{
//			region:'north',
//			height:80,
//			bodyStyle:'background-color:#BBCCEE;'
//		},{
//			region:'south',
//			height:60,
//			bodyStyle:'background-color:#BBCCEE;',
//			bottons:[{
//				text:'登陆',
//				handler:function(){
//					win.show();
//				}
//			}]
//		},{
//			region:'center',
//			split:true,
//			border:true
//		}]
//	});
	
	/**
	 * 将From渲染到指定div
	 * */
	 loginform.render("login");
})