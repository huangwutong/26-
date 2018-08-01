
package com.accp.myoa.dao.hibimpl;

import java.util.List;

import com.accp.myoa.dao.BoardRoomDao;
import com.accp.myoa.entity.BoardRoom;

@SuppressWarnings("unchecked")
public class BoardRoomDaoImpl extends BaseHibernateDao implements BoardRoomDao {

	@Override
	public void add(BoardRoom boardRoom) {
		super.getHibernateTemplate().save(boardRoom);

	}

	@Override
	public void del(int id) {
		super.getHibernateTemplate().delete(load(id));

	}

	

	@Override
	public BoardRoom load(int id) {
		return (BoardRoom)getHibernateTemplate().load(BoardRoom.class, id);
	}

	@Override
	public List<BoardRoom> loadList(BoardRoom boardRoom) {
		if (boardRoom!=null) {
			return getHibernateTemplate().findByExample(boardRoom);
		}
		return getHibernateTemplate().loadAll(BoardRoom.class);
	}	

	@Override
	public void update(BoardRoom boardRoom) {
		getHibernateTemplate().update(boardRoom);

	}

}






