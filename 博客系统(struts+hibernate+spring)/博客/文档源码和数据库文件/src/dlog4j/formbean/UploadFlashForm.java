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

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 * 上传flash的表单对象
 * @author Liudong
 */
public class UploadFlashForm extends DlogActionForm {
    
	FormFile uploadFile = null;
	String flashUrl = null;
	String txtWidth;
	String txtHeight;
	boolean transparent;
	boolean loop;
	boolean play;
	boolean menu;
	/**
	 * 验证参数的有效性
	 */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest req) {
		ActionErrors aes = new ActionErrors();
		try {
			if(!StringUtils.isEmpty(txtWidth)) 
				Integer.parseInt(txtWidth);            
		}catch(Exception e) {
			aes.add("txtWidth",new ActionError("illegal_input_value"));
		}
		try {
			if(!StringUtils.isEmpty(txtHeight)) 
				Integer.parseInt(txtHeight);            
		}catch(Exception e) {
			aes.add("txtHeight",new ActionError("illegal_input_value"));
		}
		if(uploadFile!=null){
			if(uploadFile.getFileSize()>1000000)
				aes.add("uploadFile",new ActionError("upload_file_size_exceed"));
			String fn = uploadFile.getFileName().toLowerCase();
			if(!fn.endsWith(".swf"))
				aes.add("uploadFile",new ActionError("upload_file_extend_noallow"));
			if(uploadFile.getFileSize()<=0)
				aes.add("uploadFile",new ActionError("upload_file_illegal"));
		}
		return aes;
    }
    public FormFile getUploadFile() {
        return uploadFile;
    }
    public void setUploadFile(FormFile uploadFile) {
        this.uploadFile = uploadFile;
    }
	/**
	 * @return
	 */
	public String getFlashUrl() {
		return flashUrl;
	}

	/**
	 * @return
	 */
	public String getTxtHeight() {
		return txtHeight;
	}

	/**
	 * @return
	 */
	public String getTxtWidth() {
		return txtWidth;
	}

	/**
	 * @param string
	 */
	public void setFlashUrl(String string) {
		flashUrl = string;
	}

	/**
	 * @param string
	 */
	public void setTxtHeight(String string) {
		txtHeight = string;
	}

	/**
	 * @param string
	 */
	public void setTxtWidth(String string) {
		txtWidth = string;
	}

	/**
	 * @return
	 */
	public boolean isLoop() {
		return loop;
	}

	/**
	 * @return
	 */
	public boolean isMenu() {
		return menu;
	}

	/**
	 * @return
	 */
	public boolean isPlay() {
		return play;
	}

	/**
	 * @return
	 */
	public boolean isTransparent() {
		return transparent;
	}

	/**
	 * @param b
	 */
	public void setLoop(boolean b) {
		loop = b;
	}

	/**
	 * @param b
	 */
	public void setMenu(boolean b) {
		menu = b;
	}

	/**
	 * @param b
	 */
	public void setPlay(boolean b) {
		play = b;
	}

	/**
	 * @param b
	 */
	public void setTransparent(boolean b) {
		transparent = b;
	}

}
