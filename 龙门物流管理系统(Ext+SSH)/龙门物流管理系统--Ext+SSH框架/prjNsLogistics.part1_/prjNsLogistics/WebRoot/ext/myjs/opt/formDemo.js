/*
 * Ext JS Library 2.0 Copyright(c) 2006-2007, Ext JS, LLC. licensing@extjs.com
 * 
 * http://extjs.com/license
 */

Ext.onReady(function() {

	Ext.QuickTips.init();

	// turn on validation errors beside the field globally
	Ext.form.Field.prototype.msgTarget = 'side';

	var fs = new Ext.FormPanel({
		frame : true,
		title : 'jsomn Form',
		labelAlign : 'right',
		labelWidth : 85,
		width : 340,
		waitMsgTarget : true,

		// configure how to read the json Data
		reader : new Ext.data.JsonReader({
			successProperty : 'success',
			root : 'data'
		}, [{
			name : 'first',
			mapping : 'first'
		},		// custom mapping
				{
					name : 'last',
					mapping : 'last'
				}, {
					name : 'company',
					mapping : 'company'
				}]),

		items : [new Ext.form.FieldSet({
			title : 'Contact Information',
			autoHeight : true,
			defaultType : 'textfield',
			items : [{
				fieldLabel : 'First Name',
				name : 'first',
				width : 190
			}, {
				fieldLabel : 'Last Name',
				name : 'last',
				width : 190
			}, {
				fieldLabel : 'Company',
				name : 'company',
				width : 190
			}]
		})]
	});

	fs.render('form-ct');
	fs.form.load({
		url : 'FormAutoLoad',
		method : 'GET',
		waitMsg : 'Loading'
	});

});