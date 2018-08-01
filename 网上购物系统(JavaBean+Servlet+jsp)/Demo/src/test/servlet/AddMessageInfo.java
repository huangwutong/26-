package test.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.service.MessageBoardServiceImpl;
import test.vo.MessageInfo;




public class AddMessageInfo extends HttpServlet{

	
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		MessageInfo messageBoardInfo = new MessageInfo();
		messageBoardInfo.setMessage_user(arg0.getParameter("user"));
		messageBoardInfo.setMessage_title(arg0.getParameter("title"));
		messageBoardInfo.setMessage_content(arg0.getParameter("content"));
		MessageBoardServiceImpl boardServiceImpl = new MessageBoardServiceImpl();
		boardServiceImpl.saveMessageInfo(messageBoardInfo);
		arg0.getRequestDispatcher("pageShowMessageList").forward(arg0, arg1);
	}
}
