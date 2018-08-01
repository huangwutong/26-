
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.File;

public interface FileService {
	public void add(File file);
	public void del(int id);
	public void update(File file);
	public File load(int id);
	public List<File> loadList(File file);
}



