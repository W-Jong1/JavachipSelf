package com.javachip.vo;


public class PageVO
{
	private int page;
	private int perPageNum;
	private int startNum;
	
	public PageVO() {
		this.page = 1;
		this.perPageNum = 10;
	}
	public PageVO(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	
	// getter
	public int getPage() {
		return page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	
	public int getStartNum() {
		return startNum;
	}
	// setter
	public void setPage(int page) {
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	
	public void calcStart() {
		startNum = (page-1)*perPageNum;
	}
}
