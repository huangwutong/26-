package com.lhq.prj.bms.po;

import java.io.Serializable;
import java.util.Date;

/**
 * Book.java Create on 2008-9-22 ����08:48:34
 * 
 * ͼ��
 * 
 * Copyright (c) 2008 by MTA.
 * 
 * @author �����
 * @version 1.0
 */
@SuppressWarnings("serial")
public class Book implements Serializable {

	private Integer bookId;

	/** ���� */
	private String bookName;

	/** ���� */
	private String author;

	/** ������ */
	private String press;

	/** ����ʱ�� */
	private Date publicationDate;

	/** ���� */
	private String price;

	/** ��� */
	private String editionNo;

	/** ISBN */
	private String isbn;

	/** �������� */
	private Integer categoryId;

	/** ������������ */
	private String categoryName;

	/** ���� */
	private String wordCount;

	/** ҳ�� */
	private String pageCount;

	/** ���� */
	private String bookSize;

	/** ֽ�� */
	private String paper;

	/** ��װ */
	private String pack;

	/** ���� */
	private String imageUrl;

	/** �����ַ */
	private String address;

	/** �༭�Ƽ� */
	private String editorRecommend;

	/** ���ݼ�� */
	private String description;

	/** ���߼�� */
	private String authorDesc;

	/** ��ǰ״̬ */
	private Integer state;
	
	/** ��ǰ������id */
	private Integer currentReaderId;
	
	/** ��ǰ���������� */
	private String currentReader;
	
	/** ��ǰ�����Ľ��ļ�¼id */
	private Integer logId;

	public Book() {
	}

	public Book(Integer bookId) {
		this.bookId = bookId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Integer getBookId() {
		return bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookSize() {
		return bookSize;
	}

	public void setBookSize(String bookSize) {
		this.bookSize = bookSize;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getEditionNo() {
		return editionNo;
	}

	public void setEditionNo(String editionNo) {
		this.editionNo = editionNo;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getPack() {
		return pack;
	}

	public void setPack(String pack) {
		this.pack = pack;
	}

	public String getPaper() {
		return paper;
	}

	public void setPaper(String paper) {
		this.paper = paper;
	}

	public String getPress() {
		return press;
	}

	public void setPress(String press) {
		this.press = press;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Date getPublicationDate() {
		return publicationDate;
	}

	public void setPublicationDate(Date publicationDate) {
		this.publicationDate = publicationDate;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getPageCount() {
		return pageCount;
	}

	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}

	public String getWordCount() {
		return wordCount;
	}

	public void setWordCount(String wordCount) {
		this.wordCount = wordCount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEditorRecommend() {
		return editorRecommend;
	}

	public void setEditorRecommend(String editorRecommend) {
		this.editorRecommend = editorRecommend;
	}

	public String getAuthorDesc() {
		return authorDesc;
	}

	public void setAuthorDesc(String authorDesc) {
		this.authorDesc = authorDesc;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer currentLogId) {
		this.logId = currentLogId;
	}

	public String getCurrentReader() {
		return currentReader;
	}

	public void setCurrentReader(String currentReader) {
		this.currentReader = currentReader;
	}

	public Integer getCurrentReaderId() {
		return currentReaderId;
	}

	public void setCurrentReaderId(Integer currentReaderId) {
		this.currentReaderId = currentReaderId;
	}

}
