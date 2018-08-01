
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.DocumentExamine;

public interface DocumentExamineService {
	public void add(DocumentExamine documentExamine);
	public void del(int id);
	public void update(DocumentExamine documentExamine);
	public DocumentExamine load(int id);
	public List<DocumentExamine> loadList(DocumentExamine documentExamine);
}



