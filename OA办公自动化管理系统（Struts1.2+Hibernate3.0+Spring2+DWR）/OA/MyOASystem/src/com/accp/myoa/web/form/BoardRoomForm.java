
package com.accp.myoa.web.form;

import org.apache.struts.action.ActionForm;

import com.accp.myoa.entity.BoardRoom;


public class BoardRoomForm extends ActionForm {
	private BoardRoom boardRoom;
	
	public BoardRoomForm(){
		boardRoom=new BoardRoom();
	}

	public BoardRoom getBoardRoom() {
		return boardRoom;
	}

	public void setBoardRoom(BoardRoom boardRoom) {
		this.boardRoom = boardRoom;
	}
	
}
	
