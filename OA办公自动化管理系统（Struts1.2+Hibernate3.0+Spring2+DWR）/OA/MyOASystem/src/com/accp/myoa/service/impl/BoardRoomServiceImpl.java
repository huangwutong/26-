
package com.accp.myoa.service.impl;

import java.util.List;

import com.accp.myoa.dao.BoardRoomDao;
import com.accp.myoa.entity.BoardRoom;
import com.accp.myoa.service.BoardRoomService;

public class BoardRoomServiceImpl implements BoardRoomService {
	private BoardRoomDao boardRoomDao;
	
	
	
	public void setBoardRoomDao(BoardRoomDao boardRoomDao) {
		this.boardRoomDao = boardRoomDao;
	}

	public void add(BoardRoom boardRoom) {
		boardRoomDao.add(boardRoom);

	}

	public void del(int id) {
		boardRoomDao.del(id);

	}

	public BoardRoom load(int id) {
		return boardRoomDao.load(id);
	}

	public List<BoardRoom> loadList(BoardRoom boardRoom) {
		return boardRoomDao.loadList(boardRoom);
	}

	public void update(BoardRoom boardRoom) {
		boardRoomDao.update(boardRoom);

	}

}

