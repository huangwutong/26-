package com.ssh.im2010.utilBean;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.ssh.im2010.service.PageService;

@Component
public class Page {
	private int pageSize  = 11;
	private int pageNow   = 1;
	private int rowCount  ;
	private int pageCount ;
	private PageService ps ;
	
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getRowCount() {
		return rowCount;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public PageService getPs() {
		return ps;
	}
	//根据byname自动注入
	@Resource(name="pageService")
	public void setPs(PageService ps) {
		this.ps = ps;
		this.pageCount = ps.getPageCount();
		this.rowCount = ps.getRowCount();
	}
	

}
