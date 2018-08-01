
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.DocumentExamine;


public class DocumentExamineForm extends ActionForm {
	private DocumentExamine documentExamine;
	
	public DocumentExamineForm(){
		documentExamine=new DocumentExamine();
	}

	public DocumentExamine getDocumentExamine() {
		return documentExamine;
	}

	public void setDocumentExamine(DocumentExamine documentExamine) {
		this.documentExamine = documentExamine;
	}
	
}
	
