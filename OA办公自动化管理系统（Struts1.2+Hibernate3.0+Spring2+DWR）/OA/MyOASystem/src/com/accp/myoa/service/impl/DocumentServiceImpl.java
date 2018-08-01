
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.DocumentDao;
import com.accp.myoa.entity.Document;
import com.accp.myoa.service.DocumentService;

public class DocumentServiceImpl implements DocumentService {
	private DocumentDao documentDao;
	
	
	
	public void setDocumentDao(DocumentDao documentDao) {
		this.documentDao = documentDao;
	}

	public void add(Document document) {
		documentDao.add(document);

	}

	public void del(int id) {
		documentDao.del(id);

	}

	public Document load(int id) {
		return documentDao.load(id);
	}

	public List<Document> loadList(Document document) {
		return documentDao.loadList(document);
	}

	public void update(Document document) {
		documentDao.update(document);

	}

}

