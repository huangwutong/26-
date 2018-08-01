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
package dlog4j.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import dlog4j.formbean.UploadFlashForm;
import dlog4j.formbean.UploadImageForm;

/**
 * 日记附件上传
 * 
 * @author Liudong
 */
public class DlogUploadAction extends DlogActionBase {

	// --------------------------------------------------------- Instance Variables
    public final static String UPLOADDIR_KEY = "uploadDir";
    public final static String FILEPATH_KEY = "filePath";
    public final static String IMAGESTRING_KEY = "imageString";
	static String uploadDir = null;
	static String dirName = null;
	
    // --------------------------------------------------------- Methods
    /**
     * 上传图片
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward uploadImage(ActionMapping mapping, UploadImageForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
		FormFile picture = form.getUploadFile();
		String fn = getUniqueFileName(getFileExtendName(picture.getFileName()));
		StringBuffer imgPath = new StringBuffer(uploadDir);
		imgPath.append(File.separator);
		imgPath.append(fn);
		File imgFile = new File(imgPath.toString());
		FileOutputStream fos = new FileOutputStream(imgFile);
		try {
		    //写入到目录
			fos.write(picture.getFileData());
		} finally {
			fos.close();
		}
		
		//计算图像的大小
		int width = 0, height=0;
		try{
			BufferedImage bi = ImageIO.read(imgFile);
			width = bi.getWidth();
			height = bi.getHeight();
		}catch(Exception e){
			getServlet().log("uploadImage process image failed.",e);
		}
		String img = dirName+'/'+fn;
		request.setAttribute(FILEPATH_KEY,img);
		StringBuffer imgstr = new StringBuffer(128);
		imgstr.append("<img src='");
		imgstr.append(img);
		imgstr.append("'");
		if(StringUtils.isNotEmpty(form.getTxtAlign())) {
		    imgstr.append(" align='");
		    imgstr.append(form.getTxtAlign());
		    imgstr.append("'");
		}
		if(StringUtils.isNotEmpty(form.getTxtBorder())) {
		    imgstr.append(" border='");
		    imgstr.append(form.getTxtBorder());
		    imgstr.append("'");
		}
		if(StringUtils.isNotEmpty(form.getDisplayText())) {
		    imgstr.append(" alt='");
		    imgstr.append(form.getDisplayText());
		    imgstr.append("'");			    
		}
		boolean sizeok = false;
		if(width > 600 || StringUtils.isNotEmpty(form.getTxtWidth())) {
		    imgstr.append(" width='");
		    int nWidth = getValue(600,form.getTxtWidth());
		    imgstr.append(nWidth);
		    imgstr.append("'");
		    if(nWidth==600){
		    	int nHeight = (nWidth * height)/ width;
		    	imgstr.append(" height='");
		    	imgstr.append(nHeight);
		    	imgstr.append("'");
		    	sizeok = true;
		    	request.setAttribute("width",String.valueOf(nWidth));
		    	request.setAttribute("height",String.valueOf(nHeight));
		    }
		}
		if(!sizeok && (height > 450 || StringUtils.isNotEmpty(form.getTxtHeight()))) {
		    imgstr.append(" height='");
		    int nHeight = getValue(450,form.getTxtHeight());
		    imgstr.append(nHeight);
		    imgstr.append("'");	
		    if(nHeight==450){
		    	int nWidth = (nHeight * width) / height;
		    	imgstr.append(" width='");
		    	imgstr.append(nWidth);
		    	imgstr.append("'");
		    	request.setAttribute("width",String.valueOf(nWidth));
		    	request.setAttribute("height",String.valueOf(nHeight));
		    }
		}
		imgstr.append("/>");
		request.setAttribute(IMAGESTRING_KEY,imgstr.toString());
        return mapping.getInputForward();
    }
    
    protected int getValue(int pvalue, String rvalue){
    	int rv = Integer.MAX_VALUE;
    	try{
    		rv = Integer.parseInt(rvalue);
    	}catch(Exception e){}
    	return Math.min(pvalue, rv);
    }
    /**
     * 上传flash
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    public ActionForward uploadFlash(ActionMapping mapping, UploadFlashForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
		FormFile picture = form.getUploadFile();
		String fn = getUniqueFileName(getFileExtendName(picture.getFileName()));
		FileOutputStream fos = new FileOutputStream(uploadDir + File.separator + fn);
		try {
		    //写入到目录
			fos.write(picture.getFileData());
			String flash = dirName+'/'+fn;
			request.setAttribute(FILEPATH_KEY,flash);
		} finally {
			fos.close();
		}
        return mapping.getInputForward();
    }
    /**
     * 附件上传
     */
    public ActionForward doDefault(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
		if (uploadDir == null)
			uploadDir = getUploadDir();
        if(form instanceof UploadImageForm)
            return uploadImage(mapping,(UploadImageForm)form,request,response);
        if(form instanceof UploadFlashForm)
            return uploadFlash(mapping,(UploadFlashForm)form,request,response);
        return mapping.getInputForward();
    }
	/**
	 * 获取上传文件保存的目录全路径
	 * @return
	 */
	protected String getUploadDir() {
	    if(dirName==null) {
	        dirName = servlet.getInitParameter(UPLOADDIR_KEY);
	        if (dirName == null)
	            dirName = "uploads";
	    }
		String webpath = servlet.getServletContext().getRealPath(dirName);
		if (webpath.endsWith(File.separator))
			webpath += File.separator;
		return webpath;
	}
	/**
	 * 得到一个唯一的文件名
	 * @param extName
	 * @return
	 */
	protected String getUniqueFileName(String extName) {
		final SimpleDateFormat sdf =
			new SimpleDateFormat("yyyyMMddhhmmssSSSS.");
		String fn = null;
		do {
			fn = sdf.format(new Date()) + extName;
			if (new File(uploadDir + fn).exists())
				continue;
			break;
		} while (true);
		return fn;
	}
	/**
	 * 获取文件的扩展名
	 * @param file
	 * @return
	 */
	protected static String getFileExtendName(String file) {
		int idx = file.lastIndexOf('.');
		return (idx == -1 || idx == (file.length() - 1))
			? ""
			: file.substring(idx + 1).toLowerCase();
	}
	
	public static void main(String[] args){
	    String str = null;
	    System.out.println(StringUtils.isEmpty(str));
	}

}
