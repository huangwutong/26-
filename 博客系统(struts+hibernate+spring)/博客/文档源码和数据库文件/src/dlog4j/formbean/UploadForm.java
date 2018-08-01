/*
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */
package dlog4j.formbean;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 * @author Liudong
 * @deprecated 该类已经废弃由UploadImageForm以及UploadFlashForm替代
 * 上传日志附件表单
 */
public class UploadForm extends DlogActionForm {
	
	FormFile uploadFile = null;
	String form = "forms[0]";
	/**
	 * @return
	 */
	public FormFile getUploadFile() {
		return uploadFile;
	}

	/**
	 * @param file
	 */
	public void setUploadFile(FormFile file) {
		uploadFile = file;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts.action.ActionForm#validate(org.apache.struts.action.ActionMapping, javax.servlet.http.HttpServletRequest)
	 */
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if(uploadFile!=null){
			if(uploadFile.getFileSize()>1000000)
				errors.add("uploadFile",new ActionError("upload_file_size_exceed"));
			String fn = uploadFile.getFileName();
			int i=0;
			for(;i<types.size();i++){
				if(fn.endsWith((String)types.get(i)))
					break;
			}
			if(i==types.size()){
				errors.add("uploadFile",new ActionError("upload_file_extend_noallow"));
			}
		}
		return errors;
	}
	public final static List types = Arrays.asList(new String[]{"gif","jpg","bmp","png","swf"});
	/**
	 * @return
	 */
	public String getForm() {
		return form;
	}

	/**
	 * @param string
	 */
	public void setForm(String string) {
		form = string;
	}

}
