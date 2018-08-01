
package com.accp.myoa.service;

import java.util.List;

import com.accp.myoa.entity.DocumentRead;

public interface DocumentReadService {
	public void add(DocumentRead documentRead);
	public void del(int id);
	public void update(DocumentRead documentRead);
	public DocumentRead load(int id);
	public List<DocumentRead> loadList(DocumentRead documentRead);
}



