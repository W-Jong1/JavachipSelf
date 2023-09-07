package com.javachip.vo;

public class ReviewVO {
	private int rNo;
	private String rContents;
	private String rDate;
	
	// 외래키
	private int uNo;
	private int pNo;
	
	private String uName;

	public int getrNo() {
		return rNo;
	}

	@Override
	public String toString() {
		return "ReviewVO [rNo=" + rNo + ", rContents=" + rContents + ", rDate=" + rDate + ", uNo=" + uNo + ", pNo="
				+ pNo + ", uName=" + uName + "]";
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public String getrContents() {
		return rContents;
	}
	public void setrContents(String rContents) {
		this.rContents = rContents;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
}
