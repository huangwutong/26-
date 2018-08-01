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
package javazoom.download.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.Serializable;
import java.util.List;

public class FileInfo implements Serializable {

	public static String PATH = "";
	
	public FileInfo(String fileName){
		this.filename = fileName;
		loadData();
	}

	public FileInfo(String s, String s1, String s2, String s3, String s4,
			boolean flag, int i, String s5, String s6, String s7) {
		path = null;
		filename = null;
		urlMapping = null;
		contentType = null;
		contentDisposition = null;
		contentDispositionHeader = null;
		customField = null;
		zipEnabled = false;
		maxDownload = -1;
		login = null;
		password = null;
		download = 0;
		incompleteDownload = 0;
		size = -1L;
		path = s;
		filename = s1;
		urlMapping = s2;
		contentType = s3;
		contentDisposition = s4;
		zipEnabled = flag;
		maxDownload = i;
		login = s5;
		password = s6;
		customField = s7;
		//load the saving data
		loadData();
	}
	
	public static FileInfo getFileInfo(List files, String filename){
		for(int i=0;i<files.size();i++){
			FileInfo fi = (FileInfo)files.get(i);			
			Debug.getInstance().trace(Debug.PANIC, filename+","+fi.getFilename());
			if(filename.equals(fi.getFilename()))
				return fi;
		}
		return null;
	}

	protected void loadData() {
		String fn = filename + ".sav";
		BufferedReader reader = null;
		try{
			reader = new BufferedReader(new FileReader(PATH+File.separator+fn));
			String line = reader.readLine();
			int idx = line.indexOf(',');
			download = Integer.parseInt(line.substring(0,idx));
			incompleteDownload = Integer.parseInt(line.substring(idx+1));
			Debug.getInstance().trace(Debug.PANIC, "filename="+filename+"download="+download+",incompleteDownload="+incompleteDownload);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				reader.close();
			}catch(Exception e){}
		}
	}
	
	protected void saveData(int d1, int d2){
		String fn = filename + ".sav";
		BufferedWriter writer = null;
		try{
			writer = new BufferedWriter(new FileWriter(PATH+File.separator+fn));
			writer.write(d1+","+d2);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				writer.close();
			}catch(Exception e){}
		}
	}

	public void addDownload() {
		download++;
		saveData(download, incompleteDownload);
	}

	public void addIncompleteDownload() {
		incompleteDownload++;
		saveData(download, incompleteDownload);
	}

	public boolean checkLogin(String s) {
		return login.equals(s);
	}

	public boolean checkPassword(String s) {
		return password.equals(s);
	}

	public String getContentDisposition() {
		return contentDisposition;
	}

	public String getContentDispositionHeader() {
		return contentDispositionHeader;
	}

	public String getContentType() {
		return contentType;
	}

	public String getCustomField() {
		return customField;
	}

	public static String getExtension(String s) {
		String s1 = "";
		int i = s.lastIndexOf(".");
		if (i != -1)
			s1 = s.substring(i + 1, s.length());
		return s1;
	}

	public String getFilename() {
		return filename;
	}

	public String getFilenameExtension() {
		return getExtension(filename);
	}

	public String getLogin() {
		return login;
	}

	public int getMaxDownload() {
		return maxDownload;
	}

	public String getPassword() {
		return password;
	}

	public String getPath() {
		return path;
	}

	public String getRelativeFilename() {
		int i = filename.lastIndexOf("/");
		if (i != -1)
			return filename.substring(i + 1, filename.length());
		else
			return filename;
	}

	public String getRelativePath() {
		int i = filename.lastIndexOf("/");
		if (i != -1)
			return filename.substring(0, i);
		else
			return "";
	}

	public long getSize() {
		return size;
	}

	public int getTotalDownload() {
		return download;
	}

	public int getTotalIncompleteDownload() {
		return incompleteDownload;
	}

	public String getUrlMapping() {
		return urlMapping;
	}

	public boolean isZipEnabled() {
		return zipEnabled;
	}

	public void resetTotalDownload() {
		download = 0;
	}

	public void resetTotalIncompleteDownload() {
		incompleteDownload = 0;
	}

	public void setContentDisposition(String s) {
		contentDisposition = s;
	}

	public void setContentDispositionHeader(String s) {
		contentDispositionHeader = s;
	}

	public void setContentType(String s) {
		contentType = s;
	}

	public void setSize(long l) {
		size = l;
	}

	public void updateDownload(int i) {
		System.out.println("updateDownload i="+i);
		download = i;
	}

	public void updateIncompleteDownload(int i) {
		System.out.println("updateIncompleteDownload i="+i);
		incompleteDownload = i;
	}

	private String contentDisposition;

	private String contentDispositionHeader;

	private String contentType;

	private String customField;

	private boolean zipEnabled;

	private String filename;

	private String login;

	private int maxDownload;

	private String password;

	private String path;

	private long size;

	private int download;

	private int incompleteDownload;

	private String urlMapping;
}