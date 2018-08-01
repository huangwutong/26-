
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.FileDao;
import com.accp.myoa.entity.File;

@SuppressWarnings("unchecked")
public class FileDaoImpl extends BaseHibernateDao implements FileDao {

	@Override
	public void add(File file) {
		super.getHibernateTemplate().save(file);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public File load(int id) {
		return (File)getHibernateTemplate().load(File.class, id);
	}

	@Override
	public List<File> loadList(File file) {
		if (file!=null) {
			return getHibernateTemplate().findByExample(file);
		}
		return getHibernateTemplate().loadAll(File.class);
	}	

	@Override
	public void update(File file) {
		getHibernateTemplate().update(file);

	}

}






