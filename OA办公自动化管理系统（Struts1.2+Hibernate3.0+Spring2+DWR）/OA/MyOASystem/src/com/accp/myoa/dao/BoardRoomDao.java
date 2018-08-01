

package com.accp.myoa.dao;
import java.util.List;

import com.accp.myoa.entity.BoardRoom;

public interface BoardRoomDao {
	public void add(BoardRoom boardRoom);
	public void del(int id);
	public void update(BoardRoom boardRoom);
	public BoardRoom load(int id);
	public List<BoardRoom> loadList(BoardRoom boardRoom);
}



