
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.File;


public class FileForm extends ActionForm {
	private File file;
	
	public FileForm(){
		file=new File();
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
	
}
	
