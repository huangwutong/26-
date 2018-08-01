
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.FileDao;
import com.accp.myoa.entity.File;
import com.accp.myoa.service.FileService;

public class FileServiceImpl implements FileService {
	private FileDao fileDao;
	
	
	
	public void setFileDao(FileDao fileDao) {
		this.fileDao = fileDao;
	}

	public void add(File file) {
		fileDao.add(file);

	}

	public void del(int id) {
		fileDao.del(id);

	}

	public File load(int id) {
		return fileDao.load(id);
	}

	public List<File> loadList(File file) {
		return fileDao.loadList(file);
	}

	public void update(File file) {
		fileDao.update(file);

	}

}

