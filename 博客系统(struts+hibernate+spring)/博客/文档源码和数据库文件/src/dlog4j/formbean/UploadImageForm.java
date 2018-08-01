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

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/**
 * 用于上传图片的表单类
 * @author Liudong
 */
public class UploadImageForm extends DlogActionForm {
    
	FormFile uploadFile = null;
	String imageUrl = null;
	String displayText  = null;
	String txtWidth = null;
	String txtHeight = null;
	String txtBorder = null;
	String txtAlign = "left";

	/**
	 * 验证输入的有效性
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
        try {
            if(!StringUtils.isEmpty(txtBorder)) 
                Integer.parseInt(txtBorder);            
        }catch(Exception e) {
            aes.add("txtBorder",new ActionError("illegal_input_value"));
        }
		if(uploadFile!=null){
			if(uploadFile.getFileSize()>1000000)
				aes.add("uploadFile",new ActionError("upload_file_size_exceed"));
			String fn = uploadFile.getFileName().toLowerCase();
			int i=0;
			for(;i<types.size();i++){
				if(fn.endsWith((String)types.get(i)))
					break;
			}
			if(i==types.size())
				aes.add("uploadFile",new ActionError("upload_file_extend_noallow"));
			if(uploadFile.getFileSize()<=0)
				aes.add("uploadFile",new ActionError("upload_file_illegal"));
		}
        return aes;
    }
	public final static List types = Arrays.asList(new String[]{"gif","jpg","bmp","png"});
    public static List getTypes() {
        return types;
    }
    public String getDisplayText() {
        return displayText;
    }
    public void setDisplayText(String displayText) {
        this.displayText = displayText;
    }
    public String getImageUrl() {
        return imageUrl;
    }
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    public String getTxtAlign() {
        return txtAlign;
    }
    public void setTxtAlign(String txtAlign) {
        this.txtAlign = txtAlign;
    }
    public String getTxtBorder() {
        return txtBorder;
    }
    public void setTxtBorder(String txtBorder) {
        this.txtBorder = txtBorder;
    }
    public String getTxtHeight() {
        return txtHeight;
    }
    public void setTxtHeight(String txtHeight) {
        this.txtHeight = txtHeight;
    }
    public String getTxtWidth() {
        return txtWidth;
    }
    public void setTxtWidth(String txtWidth) {
        this.txtWidth = txtWidth;
    }
    public FormFile getUploadFile() {
        return uploadFile;
    }
    public void setUploadFile(FormFile uploadFile) {
        this.uploadFile = uploadFile;
    }
}
