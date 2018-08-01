package test.service;

import java.util.List;

import test.vo.BookInfo;
import test.vo.CatagoryInfo;

public interface IBookService {

	public Boolean addBookInfo(BookInfo bookInfo);
	public Boolean delBookInfo(int bookno);
	public List<BookInfo> getBookListInfo();
	public List<BookInfo> searchBooks(String bookname);
	public Boolean updateBookInfo(BookInfo bookInfo);
	public BookInfo searchBooks(int bookno);
	public List<BookInfo> showCatagoryBook(int crono);
	public BookInfo getOneBookBybookID(int bookno);
	
}
