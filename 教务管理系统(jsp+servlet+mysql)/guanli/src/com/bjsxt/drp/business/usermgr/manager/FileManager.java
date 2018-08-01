/**
 * 
 */
package com.bjsxt.drp.business.usermgr.manager;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.bjsxt.drp.business.usermgr.dao.FileDao;
import com.bjsxt.drp.business.usermgr.factory.FileDaoFactory;
import com.bjsxt.drp.business.usermgr.model.File;
import com.bjsxt.drp.business.usermgr.model.User;
import com.bjsxt.drp.business.util.DB;
/**
 * ���ļ������ɾ��Ĺ����࣬���õ���ģʽʵ��
 * @author cash
 *
 */
public class FileManager {
	private static FileManager instance=new FileManager();
	
	private FileDao fileDao;
	
	private FileManager(){
           fileDao=FileDaoFactory.getInstance().createFileDao();		
	}

	public static FileManager getInstance() {
		return instance;
	}
	
	/**
	 * �ϴ��ļ�
	 * @param File file����
	 */
	public void addUser(File file) {
		Connection conn = null;
		try {
			conn = DB.getConn();
			fileDao.addFile(conn, file);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.closeConn(conn);
		}
	}
	
	/**
	 * ��ѯ�����ļ�
	 * @return file�����б�
	 */
	public List findAllUserList() {
		List fileList = new ArrayList();
		try {
			fileList = fileDao.findAllFile();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return fileList;
	} 
	
	/**
	 * ����file_name�ļ��Ͻ���ɾ��
	 * @param file_name file_name�ļ���
	 */
	public void deleteUsers(String[] file_name) {
		Connection conn = null;
		try {
			conn = DB.getConn();
			fileDao.delFile(conn, file_name);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DB.closeConn(conn);
		}
	}
	
	

}
