
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.Document;


public class DocumentForm extends ActionForm {
	private Document document;
	
	public DocumentForm(){
		document=new Document();
	}

	public Document getDocument() {
		return document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}
	
}
	
