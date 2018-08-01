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
package dlog4j.hsqldb;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dlog4j.util.StringUtils;

/**
 * ��������HSQLEngine��С��������������ݿ����������Ӧ������ǰ��ʼ��
 * ��˲���ʹ��Struts�Ĳ��������HSQLDB
 * @author Winter Lau
 */
public class HSQLEngineServlet extends HttpServlet {

	String path = "/WEB-INF/db";
	String database = "mydlog";
	int port = 9001;
	
	/**
	 * ִ��HSQLDB���ݿ�������ʼ������
	 */
	public void init() throws ServletException {
		//��ȡ����
		String tPath = getInitParameter("path");
		if(StringUtils.isNotEmpty(tPath))
			path = tPath;
		String tDatabase = getInitParameter("database");
		if(StringUtils.isNotEmpty(tDatabase))
			database = tDatabase;
		String tPort = getInitParameter("port");
		if(StringUtils.isNumeric(tPort)){
			int nPort = Integer.parseInt(tPort);
			if(nPort>1024 && nPort<65536)
				port = nPort;
		}
		String dataPath;
		if(path.startsWith("/"))
			dataPath = getServletContext().getRealPath(path);
		else
			dataPath = path;
		//��������
		HSQLEngine engine = HSQLEngine.getEngine(dataPath,port,database);
		engine.start();
		while(!engine.isRunning()){
			try{
				Thread.sleep(200);
			}catch(Exception e){}
		}
		log("HSQLEngine of DLOG4J started.");
	}
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		//TODO:������ݿ⵱ǰ״̬��ֻ�й���Ա����Ȩ�޲鿴��
	}
	
	/**
	 * ֹͣ���ݿ�����
	 */
	public void destroy() {
		try{
			HSQLEngine.getEngine(null,-1,null).stop();
		}catch(Exception e){}
	}
}
