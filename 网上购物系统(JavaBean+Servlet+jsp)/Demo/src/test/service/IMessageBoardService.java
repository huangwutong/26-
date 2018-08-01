package test.service;

import java.util.List;

import test.vo.CatagoryInfo;
import test.vo.MessageInfo;



public interface IMessageBoardService {

	public MessageInfo saveMessageInfo(MessageInfo messageInfo);
	
	public List<MessageInfo> getMessageInfos();
	public List<MessageInfo> getMessageInfos(int currentPage);
	
	
	

}
