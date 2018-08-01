/**
 * 
 */
package com.bjsxt.drp.business.usermgr.factory;

import com.bjsxt.drp.business.usermgr.dao.FileDao;
import com.bjsxt.drp.business.usermgr.dao.FileDao3MySqlImpl;


/**
 * @author cash
 *
 */
public class FileDaoFactory {
	
	private static FileDaoFactory instance;
	
	private FileDao fileDao;
	
	private FileDaoFactory(){
		fileDao=new FileDao3MySqlImpl();
	}
	
	public static synchronized FileDaoFactory getInstance() {
		if (instance == null) {
			instance = new FileDaoFactory();
		}
		return instance;
	}
	
	/**
	 * ����FileDao����
	 * @return FileDao FileDao�ӿ�
	 */
	public FileDao createFileDao() {
		return fileDao;
	}
	

}
