

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.DocumentRead;

public interface DocumentReadDao {
	public void add(DocumentRead documentRead);
	public void del(int id);
	public void update(DocumentRead documentRead);
	public DocumentRead load(int id);
	public List<DocumentRead> loadList(DocumentRead documentRead);
}



