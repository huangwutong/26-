
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.DocumentReadDao;
import com.accp.myoa.entity.DocumentRead;
import com.accp.myoa.service.DocumentReadService;

public class DocumentReadServiceImpl implements DocumentReadService {
	private DocumentReadDao documentReadDao;
	
	
	
	public void setDocumentReadDao(DocumentReadDao documentReadDao) {
		this.documentReadDao = documentReadDao;
	}

	public void add(DocumentRead documentRead) {
		documentReadDao.add(documentRead);

	}

	public void del(int id) {
		documentReadDao.del(id);

	}

	public DocumentRead load(int id) {
		return documentReadDao.load(id);
	}

	public List<DocumentRead> loadList(DocumentRead documentRead) {
		return documentReadDao.loadList(documentRead);
	}

	public void update(DocumentRead documentRead) {
		documentReadDao.update(documentRead);

	}

}

