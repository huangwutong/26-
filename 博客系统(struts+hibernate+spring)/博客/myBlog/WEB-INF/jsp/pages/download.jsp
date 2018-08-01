<%
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
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dlog4j.tld" prefix="dlog" %>
<%@ page import="javazoom.download.util.*,java.io.*" %>

<jsp:useBean id="downloadbean" class="javazoom.download.DownloadBean" scope="page" />
<%
	Repository repository = Repository.getInstance();
	Config conf = repository.get("uniqueid");
	downloadbean.setConfig(conf);
   	downloadbean.setVirtualPath(request.getContextPath()+"/download");
%>
<table border="0" cellspacing="4" cellpadding="4" align="center" width="98%">
  <tr>
    <td bgcolor="#CCCCCC">
      <table border="0" cellspacing="1" cellpadding="0" width="100%">
        <tr align="center" bgcolor="#EEEEEE"> 
          <td></td>
          <td><b><bean:message key="DOWNLOAD_FILENAME" bundle="html"/></b></td>
          <td><b>SIZE</b></td>
          <td><b><bean:message key="DOWNLOAD_COUNT" bundle="html"/></b></td>
          <td><b><bean:message key="DOWNLOAD_FILEDESC" bundle="html"/></b></td>
        </tr>
        <% int i=1; %>
        <dlog:listFiles id="files" pathId="path" path="{webapp}\WEB-INF\downloadroot" exclude="true" extend=".description"/>
		<bean:define id="downloadDir" name="path"/>
		<logic:iterate id="fileName" name="files">
        <tr align="center" bgcolor="#FFFFFF"> 
          <td><b><%=(i++)%></b></td>
          <td align="left">&nbsp;<a href="<%= downloadbean.getDownloadLink((String)fileName) %>"><bean:write name="fileName"/></a>&nbsp;</td>
          <%
          	FileInfo fi = FileInfo.getFileInfo(conf.getFiles(),(String)fileName);
          	if(fi==null) fi = new FileInfo((String)fileName);
          %>
          <td align="right">&nbsp;<%= getFileSize((String)downloadDir, (String)fileName)/1000 %>K&nbsp;</td>
          <td>&nbsp;<%= fi.getTotalDownload() %>&nbsp;</td>
          <td align="left"><%=getFileDesc((String)downloadDir, (String)fileName)%></td>
        </tr>
        </logic:iterate>
      </table>
    </td>
  </tr>
</table>

<%!
	static boolean addListener = false;
	long getFileSize(String dir, String fn){
		RandomAccessFile raf = null;
		try{
			raf = new RandomAccessFile(dir+File.separator+fn, "r");
			return raf.length();
		}catch(Exception e){
		}finally{
			try{
				raf.close();
			}catch(Exception e){}
		}
		return -1;
	}
	String getFileDesc(String dir, String fn){
		File f = new File(dir+File.separator+fn+".description");
		if(f.exists() && f.isFile()){
			StringBuffer buf = new StringBuffer();
			BufferedReader in = null;
			try{
				in = new BufferedReader(new FileReader(f));
				do{
					String line = in.readLine();
					if(line==null)
						break;
					buf.append(line);
				}while(true);
			}catch(Exception e){
				log("getFileDesc",e);
			}finally{
				if(in!=null)
				try{
					in.close();
				}catch(Exception e){}
			}			
			return buf.toString();
		}
		return "[EMPTY]";
	}
%>
