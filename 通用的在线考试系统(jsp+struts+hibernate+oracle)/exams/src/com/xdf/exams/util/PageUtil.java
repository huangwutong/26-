package com.xdf.exams.util;


import java.io.Serializable;

public class PageUtil implements Serializable{
	private int total; // 共几页

	private int pageno; // 当前是第几页

	private int prepageno; // 上一页

	private int nextpageno; // 下一页

	private int pagesize; // 每页几条

	private int totalnum; // 总条数

	public PageUtil(String spageno, int totalnum, int pagesize) {
		this.pagesize = pagesize;
		this.totalnum = totalnum;

		// 1页码处理，如果穿过来是null或者是类似abc则pageno=1；
		pageno = 1;
		try {
			if (spageno != null)
				pageno = Integer.parseInt(spageno);
		} catch (NumberFormatException e) {
		}
		// 2 计算一共几页
		total = totalnum % pagesize == 0 ? (totalnum / pagesize) : (totalnum
				/ pagesize + 1);
		
		// 3 判断页码是否在范围内
		if (pageno > total)
			pageno = total;
		if (pageno < 1)
			pageno = 1;
		
		// 4 计算上下页码,如果是第1页则没有上页,如果是最后页则没有下页
		if (pageno > 1)
			prepageno = pageno - 1;
		if (pageno < total)
			nextpageno = pageno + 1;

	}

	public int getNextpageno() {
		return nextpageno;
	}

	public void setNextpageno(int nextpageno) {
		this.nextpageno = nextpageno;
	}

	public int getPageno() {
		return pageno;
	}

	public void setPageno(int pageno) {
		this.pageno = pageno;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getPrepageno() {
		return prepageno;
	}

	public void setPrepageno(int prepageno) {
		this.prepageno = prepageno;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalnum() {
		return totalnum;
	}

	public void setTotalnum(int totalnum) {
		this.totalnum = totalnum;
	}

}
