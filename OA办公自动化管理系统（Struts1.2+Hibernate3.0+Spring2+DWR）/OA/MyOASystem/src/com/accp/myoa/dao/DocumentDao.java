

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.Document;

public interface DocumentDao {
	public void add(Document document);
	public void del(int id);
	public void update(Document document);
	public Document load(int id);
	public List<Document> loadList(Document document);
}



