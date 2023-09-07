package com.javachip.vo;

public class SearchVO extends PageVO{
	private String searchType;
	private String searchValue;
	private String sort;
	private int uNo;
	
	@Override
	public String toString() {
		return "SearchVO [searchType=" + searchType + ", searchValue=" + searchValue + ", sort=" + sort + "]";
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	
	
}


