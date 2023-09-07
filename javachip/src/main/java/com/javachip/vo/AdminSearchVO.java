package com.javachip.vo;

public class AdminSearchVO extends AdminCriteria
{
	public String AdminSearchUserType;	//관리자 회원 타입으로 검색
	public String AdminSearchId;		//관리자 회원 아이디/이름으로 검색
	public String AdminSearchIdValue;	//관리자가 회원/아이디 이름으로 입력할 변수
	private String searchType;			//관리자 공지사항 검색
	private String searchValue;			//관리자 공지사항 검색
	private String searchType_qna;		//관리자 Qna 검색
	private int uNo;
	
	//=================================유저검색
	public String getAdminSearchUserType() {
		return AdminSearchUserType;
	}
	public void setAdminSearchUserType(String adminSearchUserType) {
		AdminSearchUserType = adminSearchUserType;
	}
	public String getAdminSearchId() {
		return AdminSearchId;
	}
	public void setAdminSearchId(String adminSearchId) {
		AdminSearchId = adminSearchId;
	}
	public String getAdminSearchIdValue() {
		return AdminSearchIdValue;
	}
	public void setAdminSearchIdValue(String adminSearchIdValue) {
		AdminSearchIdValue = adminSearchIdValue;
	}
	
	//=================================공지사항 검색
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
		
	//=================================qna 검색
	
	public String getSearchType_qna()
	{
		return searchType_qna;
	}
	
	public void setSearchType_qna(String searchType_qna)
	{
		this.searchType_qna = searchType_qna;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	
}
