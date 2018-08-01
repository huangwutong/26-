
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.DocumentRead;


public class DocumentReadForm extends ActionForm {
	private DocumentRead documentRead;
	
	public DocumentReadForm(){
		documentRead=new DocumentRead();
	}

	public DocumentRead getDocumentRead() {
		return documentRead;
	}

	public void setDocumentRead(DocumentRead documentRead) {
		this.documentRead = documentRead;
	}
	
}
	
