/**
 * 
 */
package com.bjsxt.drp.business.usermgr.dao;
import com.bjsxt.drp.business.usermgr.model.File;

import java.sql.Connection;
import java.util.List;

public interface FileDao {

	
	/**
	 * �ϴ��ļ�
	 */ 
	public void addFile(Connection conn,File file);
	
	/**
	 * ɾ���ļ�
	 */
	public void delFile(Connection conn,String []file_name);
	
	/**
	 * ��ѯ���е��ļ�
	 */
	public List findAllFile();
}
