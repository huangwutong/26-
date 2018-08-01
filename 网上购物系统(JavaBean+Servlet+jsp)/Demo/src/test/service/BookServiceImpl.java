package test.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import test.util.DbConnectionService;
import test.vo.BookInfo;
import test.vo.CatagoryInfo;

public class BookServiceImpl implements IBookService {

	private Connection connection;
	private Statement statement;
	private ResultSet resultSet;

	public BookServiceImpl() {
		connection = DbConnectionService.getConnection();
		try {
			statement = connection.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public Boolean addBookInfo(BookInfo bookInfo) {

		Boolean boolean1 = null;
		String sql = "insert into book(crono,bname,author,pdate,publisher,remark,price) values("
				+ bookInfo.getCrono()
				+ ",'"
				+ bookInfo.getBname()
				+ "','"
				+ bookInfo.getAuthor()
				+ "','"
				+ bookInfo.getPdate()
				+ "','"
				+ bookInfo.getPublisher()
				+ "','"
				+ bookInfo.getRemark()
				+ "',"
				+ bookInfo.getPrice() + ")";

		try {
			boolean1 = statement.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return boolean1;
	}

	public List<BookInfo> getBookListInfo() {
		List<BookInfo> list = new ArrayList<BookInfo>();
		String sql = "select * from book";
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				list.add(new BookInfo(resultSet.getInt(1), resultSet.getInt(2),
						resultSet.getString(3), resultSet.getString(4),
						resultSet.getString(5), resultSet.getString(6),
						resultSet.getString(7), resultSet.getFloat(8)));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return list;
	}

	public List<BookInfo> searchBooks(String bookname) {
		List<BookInfo> list = new ArrayList<BookInfo>();
		String sql = "select * from book where bname like '%" + bookname + "%'";

		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				list.add(new BookInfo(resultSet.getInt(1), resultSet.getInt(2),
						resultSet.getString(3), resultSet.getString(4),
						resultSet.getString(5), resultSet.getString(6),
						resultSet.getString(7), resultSet.getFloat(8)));

			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}

		return list;
	}

	public Boolean delBookInfo(int bookno) {

		Boolean result = null;
		String sql = "delete from book where bookno=" + bookno;

		try {
			result = statement.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public Boolean updateBookInfo(BookInfo bookInfo) {

		Boolean result = null;
		String sql = "update bookinfo set crono='" + bookInfo.getCrono()
				+ "', bname='" + bookInfo.getBname() + "',author='"
				+ bookInfo.getAuthor() + "',pdate='" + bookInfo.getPdate()
				+ "',publisher='" + bookInfo.getPublisher() + "',remark='"
				+ bookInfo.getRemark() + "',price =" + bookInfo.getPrice();

		try {
			result = statement.execute(sql);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;

	}

	public BookInfo searchBooks(int bookno) {

		return null;

	}

	public BookInfo getOneBookBybookID(int bookno) {

		BookInfo bookInfo = null;
		String sql = "select * from book where bookno=" + bookno;
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				bookInfo = new BookInfo(resultSet.getInt(1), resultSet
						.getInt(2), resultSet.getString(3), resultSet
						.getString(4), resultSet.getString(5), resultSet
						.getString(6), resultSet.getString(7), resultSet
						.getFloat(8));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return bookInfo;
	}

	public List<BookInfo> showCatagoryBook(int crono) {

		List<BookInfo> list = new ArrayList<BookInfo>();
		String sql = "select * from book where crono=" + crono;
		try {
			resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				list.add(new BookInfo(resultSet.getInt(1), resultSet.getInt(2),
						resultSet.getString(3), resultSet.getString(4),
						resultSet.getString(5), resultSet.getString(6),
						resultSet.getString(7), resultSet.getFloat(8)));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return list;
	}

}
