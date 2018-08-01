
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.DocumentExamineDao;
import com.accp.myoa.entity.DocumentExamine;
import com.accp.myoa.service.DocumentExamineService;

public class DocumentExamineServiceImpl implements DocumentExamineService {
	private DocumentExamineDao documentExamineDao;
	
	
	
	public void setDocumentExamineDao(DocumentExamineDao documentExamineDao) {
		this.documentExamineDao = documentExamineDao;
	}

	public void add(DocumentExamine documentExamine) {
		documentExamineDao.add(documentExamine);

	}

	public void del(int id) {
		documentExamineDao.del(id);

	}

	public DocumentExamine load(int id) {
		return documentExamineDao.load(id);
	}

	public List<DocumentExamine> loadList(DocumentExamine documentExamine) {
		return documentExamineDao.loadList(documentExamine);
	}

	public void update(DocumentExamine documentExamine) {
		documentExamineDao.update(documentExamine);

	}

}

